
#macro FirebaseRealTime_Library_useSDK ((extension_get_option_value("YYFirebaseRealTime","Config") == "SDKs_When_Available" and (os_type == os_android or os_type == os_ios or os_browser != browser_not_a_browser)) or extension_get_option_value("YYFirebaseRealTime","Config") == "SDKs_Only")

/// @description URL-encodes a string according to RFC 3986
/// @param {String} _orig
/// @returns {String}
function __firebase_realtime_url_encode(_orig) {
    
	static _input_buffer = buffer_create(1, buffer_grow, 1);
	static _output_buffer = buffer_create(1, buffer_grow, 1);
	
    static _hex = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];

	buffer_seek(_input_buffer, buffer_seek_start, 0);
	buffer_seek(_output_buffer, buffer_seek_start, 0);
	
	buffer_write(_input_buffer, buffer_string, _orig);

    repeat (string_length(_orig)) {
        var _code = buffer_read(_input_buffer, buffer_u8);

        // Check if character is unreserved (ALPHA / DIGIT / "-" / "." / "_" / "~")
        if ((_code >= 65 && _code <= 90) ||    // A-Z
            (_code >= 97 && _code <= 122) ||   // a-z
            (_code >= 48 && _code <= 57) ||    // 0-9
            _code == 45 ||                    // -
            _code == 46 ||                    // .
            _code == 95 ||                    // _
            _code == 126) {                   // ~
			// Write directly to the output buffer
            buffer_write(_output_buffer, buffer_u8, _code);
        } else {
            // Use bitwise operations to get high and low nibbles
            var _high = (_code & $F0) >> 4;
            var _low = _code & $0F;
			buffer_write(_output_buffer, buffer_text, "%" + _hex[_high] + _hex[_low]);
        }
    }
	buffer_write(_output_buffer, buffer_u8, 0);
	
    return buffer_peek(_output_buffer, 0, buffer_string);
}

/// @param {Struct.FirebaseRealTimeBuilder} _builder
/// @param {Array<String>} _selected_params
/// @returns {String}
function __firebase_realtime_build_url(_builder, _selected_params = undefined) {

	static _default_url = extension_get_option_value("YYFirebaseRealTime", "DatabaseURL");

	with (_builder) {
		var _private = __;
		var _database = _private.database;
		var _path = _private.path;
		
		var _url = is_undefined(_database) ? _default_url : _database;
		
		// Sanity check
		var _delimiter = string_ends_with(_url, "/") ? "" : "/"

		_url =  string_join(_delimiter, _url, _path) + ".json";
		
		var _params = [];
		
		// Create params array
		if (is_array(_selected_params)) {
			var _length = array_length(_selected_params);
			for (var _i = 0; _i < _length; _i++) {
				var _name = _selected_params[_i];
				var _value = _private[$ _name];
				
				if (is_undefined(_value)) continue;
				
				// Quote string values..
				if (is_string(_value)) {
					_value = __firebase_realtime_url_encode("\""+ _value +"\""); 
				}
				
				array_push(_params, string_concat(_name, "=", _value));
			}
		}
		
		// Add auth if available
		static _auth_function_index = asset_get_index("RESTFirebaseAuthentication_GetIdToken")
		if (_auth_function_index == -1) {
			var _auth_token_id = RESTFirebaseAuthentication_GetIdToken();
			if (_auth_token_id != "") {
				array_push(_params, "auth=" + _auth_token_id);
			}
		}
		
		if (array_length(_params) > 0) {
			_url = string_concat(_url, "?", string_join_ext("&", _params));
		}
		
		return _url;
	}
}

function FirebaseRealTime(_database = undefined, _path = "") {
	return new FirebaseRealTimeBuilder(_database, _path)
}

function FirebaseRealTimeBuilder(_database, _path) constructor {
	
	enum FIREBASE_DATABASE_ACTION {
		SET = 0,
		READ = 1,
		LISTENER = 2,
		EXISTS = 3,
		DELETE = 4,
		LISTENER_REMOVE = 5,
		LISTERER_REMOVE_ALL = 6,
	}
	
	#region PRIVATE
	
	__ = {
		push: false,
		path: undefined,
		orderBy: undefined,
		
		equalTo: undefined,
		startAt: undefined,
		startAfter: undefined,
		endAt: undefined,
		endBefore: undefined,
		
		limitToFirst: undefined,
		limitToLast: undefined,
		
		database: _database,
		action: undefined,
		value: undefined,
		
		priority: undefined,
	};
	
	/// @ignore
	pathArray = string_split(_path, "/", true);
	
	/// @function BuildPath()
	/// @returns {String}
	/// @ignore
	static BuildPath = function() {
		return string_join_ext("/", pathArray);
	}
	
	/// @function ProcessValue(value)
	/// @returns {Any}
	/// @ignore
	static ProcessValue = function(_value) {
		if (is_string(_value)) {
			try {
				_value = json_parse(_value);
			}
			catch (_ex) {}
		}
		else if (is_handle(_value)) {
			var _handle_type = string(_value);
			// If is a ds_map convert to a struct
			if (string_starts_with(_handle_type, "ref ds_map")) {
				_value = json_parse(json_encode(_value));
			}
			// If is a ds_list convert to an array
			else if (string_starts_with(_handle_type, "ref ds_list")) {
				var _map = ds_map_create();
				ds_map_add_list(_map, "list", _value);
				var _struct = json_parse(json_encode(_map));
				ds_map_delete(_map, "list");
				ds_map_destroy(_map);
				_value = _struct.list;
			}
			else {
				_value = _handle_type;
			}
		}
		
		return _value;
	}
	
	#endregion
	
	#region BUILDER
	
	/// @function Path(_path)
	/// @param {String} _path
	static Path = function(_path) {
		pathArray = string_split(_path, "/", true);
		return self;
	}
	
	/// @function Child(child_path)
	/// @param {String} _child_path
	static Child = function(_child_path) {
		array_push(pathArray, _child_path);
		return self;
	}
	
	/// @function Parent()
	static Parent = function() {
		array_pop(pathArray);
		return self;
	}
	
	/// @function Push()
	static Push = function() {
		__.push = true;
		return self;
	}

	/// @function OrderByKey()
	static OrderByKey = function() {
		__.orderBy = "$key";
		return self;
    }
	
	/// @function OrderByValue()
	static OrderByValue = function() {
		__.orderBy = "$value";
		return self;
    }
	
	/// @function OrderByPriority()
	static OrderByPriority = function() {
		__.orderBy = "$priority";
		return self;
    }
	
	/// @function OrderByChild(_child_path)
	/// @param {String} _child_path
	static OrderByChild = function(_child_path) {
		__.orderBy = _child_path;
		return self;
    }
	
	/// @function EqualTo(_equal_to)
	/// @param {Any} _equal_to
	static EqualTo = function(_equal_to) {
		__.equalTo = _equal_to;
		return self;
    }
	
	/// @function StartAt(_start_at)
	/// @param {Any} _start_at
	static StartAt = function(_start_at) {
		__.startAt = _start_at;
		__.startAfter = undefined;
		return self;
    }
	
	/// @function StartAfter(_start_after)
	/// @param {Any} _start_after
	static StartAfter = function(_start_after) {
		__.startAfter = _start_after;
		__.startAt = undefined;
		return self;
    }
	
	/// @function EndAt(_end_at)
	/// @param {Any} _end_at
	static EndAt = function(_end_at) {
		__.endAt = _end_at
		__.endBefore = undefined;
		return self;
    }
	
	/// @function EndBefore(_end_before)
	/// @param {Any} _end_before
	static EndBefore = function(_end_before) {
		__.endBefore = _end_before
		__.endAt = undefined;
		return self;
    }
		
	/// @function LimitToLast(_count)
	/// @param {Real} _count
	static LimitToLast = function(_count) {
		__.limitToLast = _count;
		__.limitToFirst = undefined;
		return self;
	}
	
	/// @function LimitToFirst(_count)
	/// @param {Real} _count
	static LimitToFirst = function(_count) {
		__.limitToFirst = _count;
		__.limitToLast = undefined;
		return self;
	}
	
	#endregion
	
	#region ACTIONS

	/// @function Set(_value, _priority)
	/// @param {String} _value
	/// @param {Any} _priority
    static Set = function(_value, _priority = undefined) {
		__.action = FIREBASE_DATABASE_ACTION.SET;
		
		__.value = ProcessValue(_value);
		__.priority = _priority;
		__.path = BuildPath();
		
		show_debug_message(self);
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__));
				
		var _listener = FirebaseREST_asyncFunction_RealTime(
						"FirebaseRealTime_Set",
						Obj_FirebaseREST_Listener_Once_RealTime,
						__firebase_realtime_build_url(self),
						__.push ? "POST" : "PUT",
						"{}",
						__.value
					)
		_listener.path = __.path
		
		return _listener;
    }
	
	/// @function Read(_path)
    static Read = function() {
		__.action = FIREBASE_DATABASE_ACTION.READ;
		__.path = BuildPath();
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
			
		var _listener = FirebaseREST_asyncFunction_RealTime(
						"FirebaseRealTime_Read",
						Obj_FirebaseREST_Listener_Once_RealTime,
						__firebase_realtime_build_url(self, ["orderBy", "startAt", "endAt", "equalTo", "limitToFirst", "limitToLast"]),
						"GET",
						"X-Firebase-Decoding: 1",
						"");
						
		_listener.path = __.path
			

		return _listener;
    }
	
	/// @function Listener()
    static Listener = function() {
		__.action = FIREBASE_DATABASE_ACTION.LISTENER;
		__.path = BuildPath();
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		
		
		var _listener = FirebaseREST_asyncFunction_RealTime(
						"FirebaseRealTime_Listener",
						Obj_FirebaseREST_Listener_On_RealTime,
						__firebase_realtime_build_url(self, ["orderBy", "startAt", "endAt", "equalTo", "limitToFirst", "limitToLast"]),
						"GET",
						"X-Firebase-Decoding: 1",
						"");
						
		_listener.path = __.path
			

		return _listener;
    }

	/// @function Exists()
    static Exists = function() {
		__.action = FIREBASE_DATABASE_ACTION.EXISTS;
		__.path = BuildPath();
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		var listener = FirebaseREST_asyncFunction_RealTime(
						"FirebaseRealTime_Exists",
						Obj_FirebaseREST_Listener_Once_RealTime,
						__firebase_realtime_build_url(self),
						"GET",
						"{}",
						""
					)
	
		listener.path = __.path

		return(listener)
    }
	
	/// @function Delete()
	static Delete = function() {
		__.action = FIREBASE_DATABASE_ACTION.DELETE;
		__.path = BuildPath();
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		var listener = FirebaseREST_asyncFunction_RealTime(
						"FirebaseRealTime_Delete",
						Obj_FirebaseREST_Listener_Once_RealTime,
						__firebase_realtime_build_url(self),
						"DELETE",
						"{}",
						""
					)
	
		listener.path = __.path
		return listener;
    }
	
	/// @function ListenerRemove(_listener)
	/// @param {Any} _listener
    static ListenerRemove = function(_listener) {
		__.action = FIREBASE_DATABASE_ACTION.LISTENER_REMOVE;
		__.path = BuildPath();
		
		__.value = _listener;
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		with(_listener)
		    instance_destroy()
    }
	
	/// @function ListenerRemoveAll()
    static ListenerRemoveAll = function() {
		__.action = FIREBASE_DATABASE_ACTION.LISTERER_REMOVE_ALL;
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		with(Obj_FirebaseREST_Listener_RealTime) {
			if(string_count("Listener", event))
				instance_destroy()
		}
    }

	#endregion
	
}

