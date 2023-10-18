{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "YYFirebaseAnalytics",
  "androidactivityinject": "",
  "androidclassname": "YYFirebaseAnalytics",
  "androidcodeinjection": "\r\n\r\n<YYAndroidGradleDependencies>\r\n       implementation 'com.google.firebase:firebase-analytics'\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidManifestApplicationInject>\r\n       <meta-data android:name=\"firebase_analytics_collection_enabled\" android:value=\"true\" />\r\n       <meta-data android:name=\"google_analytics_adid_collection_enabled\" android:value=\"true\" />\r\n       <meta-data android:name=\"google_analytics_ssaid_collection_enabled\" android:value=\"true\" />\r\n</YYAndroidManifestApplicationInject>\r\n",
  "androidinject": "\r\n       <meta-data android:name=\"firebase_analytics_collection_enabled\" android:value=\"true\"></meta-data>\r\n       <meta-data android:name=\"google_analytics_adid_collection_enabled\" android:value=\"true\"></meta-data>\r\n       <meta-data android:name=\"google_analytics_ssaid_collection_enabled\" android:value=\"true\"></meta-data>\r\n",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "YYFirebaseAnalytics",
  "copyToTargets": 9007199254741036,
  "date": "2021-07-18T06:04:24.0799295+01:00",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "2.2.2",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":-1,"filename":"FirebaseAnalytics.ext","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FirebaseAnalytics_LogEvent","argCount":0,"args":[
            1,
            1,
          ],"documentation":"","externalName":"FirebaseAnalytics_LogEvent","help":"FirebaseAnalytics_LogEvent(event,json)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FirebaseAnalytics_SetAnalyticsCollectionEnabled","argCount":0,"args":[
            2,
          ],"documentation":"","externalName":"FirebaseAnalytics_SetAnalyticsCollectionEnabled","help":"FirebaseAnalytics_SetAnalyticsCollectionEnabled(bool)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FirebaseAnalytics_ResetAnalyticsData","argCount":0,"args":[],"documentation":"","externalName":"FirebaseAnalytics_ResetAnalyticsData","help":"FirebaseAnalytics_ResetAnalyticsData()","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FirebaseAnalytics_SetDefaultEventParameters","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"FirebaseAnalytics_SetDefaultEventParameters","help":"FirebaseAnalytics_SetDefaultEventParameters(json)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FirebaseAnalytics_SetSessionTimeoutDuration","argCount":0,"args":[
            2,
          ],"documentation":"","externalName":"FirebaseAnalytics_SetSessionTimeoutDuration","help":"FirebaseAnalytics_SetSessionTimeoutDuration(miliseconds)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FirebaseAnalytics_SetUserId","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"FirebaseAnalytics_SetUserId","help":"FirebaseAnalytics_SetUserId(userID)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FirebaseAnalytics_SetUserProperty","argCount":0,"args":[
            1,
            1,
          ],"documentation":"","externalName":"FirebaseAnalytics_SetUserProperty","help":"FirebaseAnalytics_SetUserProperty(key,value)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FirebaseAnalytics_SetConsent","argCount":0,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FirebaseAnalytics_SetConsent","help":"FirebaseAnalytics_SetConsent()","hidden":false,"kind":4,"returnType":1,},
      ],"init":"","kind":4,"order":[
        {"name":"FirebaseAnalytics_SetAnalyticsCollectionEnabled","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_LogEvent","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_ResetAnalyticsData","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetDefaultEventParameters","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetSessionTimeoutDuration","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetUserId","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetUserProperty","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetConsent","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
      ],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":-1,"filename":"FirebaseAnalytics.js","final":"","functions":[],"init":"","kind":5,"order":[],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "\r\n       implementation 'com.google.firebase:firebase-analytics'\r\n",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "\r\n     pod 'Firebase/Analytics','8.4.0'\r\n     #pod 'Firebase/AnalyticsWithoutAdIdSupport'\r\n",
  "ioscodeinjection": "\r\n<YYIosCocoaPods>\r\n     pod 'Firebase/Analytics','8.4.0'\r\n     #pod 'Firebase/AnalyticsWithoutAdIdSupport'\r\n</YYIosCocoaPods>\r\n\r\n<YYIosPlist>\r\n     <key>FIREBASE_ANALYTICS_COLLECTION_ENABLED</key>\r\n     <true/>\r\n     \r\n     <key>GOOGLE_ANALYTICS_IDFV_COLLECTION_ENABLED </key>\r\n     <true/>\r\n</YYIosPlist>\r\n\r\n",
  "iosdelegatename": "",
  "iosplistinject": "\r\n     <key>FIREBASE_ANALYTICS_COLLECTION_ENABLED</key>\r\n     <true></true>\r\n     \r\n     <key>GOOGLE_ANALYTICS_IDFV_COLLECTION_ENABLED </key>\r\n     <true></true>\r\n",
  "iosProps": true,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Firebase Analytics",
    "path": "folders/Firebase Analytics.yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": null,
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "<YYTvosPlist>\r\n\r\n</YYTvosPlist>\r\n\r\n",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "\r\n\r\n",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}