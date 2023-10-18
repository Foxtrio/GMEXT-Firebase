{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "AppleSignInMac",
  "androidactivityinject": "",
  "androidclassname": "",
  "androidcodeinjection": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": false,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": 2,
  "date": "2019-08-19T09:41:57",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "1.0.0",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_scope_fullname","hidden":false,"value":"\"fullname\"",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_scope_email","hidden":false,"value":"\"email\"",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_signin_response","hidden":false,"value":"1001",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_credential_response","hidden":false,"value":"1002",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_state_authorized","hidden":false,"value":"1100",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_state_revoked","hidden":false,"value":"1101",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_state_not_found","hidden":false,"value":"1102",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_realuserstatus_likelyreal","hidden":false,"value":"5102",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_realuserstatus_unknown","hidden":false,"value":"5101",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"mac_applesignin_realuserstatus_unsupported","hidden":false,"value":"5100",},
      ],"copyToTargets":2,"filename":"libAppleSignInMacLib.dylib","final":"Mac_AppleSignIn_Final","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"Mac_AppleSignIn_Init","argCount":0,"args":[],"documentation":"","externalName":"Mac_AppleSignIn_Init","help":"Mac_AppleSignIn_Init()","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"Mac_AppleSignIn_AuthoriseUser","argCount":0,"args":[],"documentation":"","externalName":"Mac_AppleSignIn_AuthoriseUser","help":"Mac_AppleSignIn_AuthoriseUser()","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"Mac_AppleSignIn_AddScope","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"Mac_AppleSignIn_AddScope","help":"Mac_AppleSignIn_AddScope(scope)","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"Mac_AppleSignIn_ClearScopes","argCount":0,"args":[],"documentation":"","externalName":"Mac_AppleSignIn_ClearScopes","help":"Mac_AppleSignIn_ClearScopes()","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"Mac_AppleSignIn_GetCredentialState","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"Mac_AppleSignIn_GetCredentialState","help":"Mac_AppleSignIn_GetCredentialState(identitiy_token)","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"RegisterCallbacks","argCount":0,"args":[],"documentation":"","externalName":"RegisterCallbacks","help":"Glue function, not required to be called.","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"Mac_AppleSignIn_Final","argCount":0,"args":[],"documentation":"","externalName":"Mac_AppleSignIn_Final","help":"Mac_AppleSignIn_Final()","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"Mac_AppleSignIn_RegisterWindow","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"RegisterWindow","help":"Mac_AppleSignIn_RegisterWindow(window_handle())","hidden":false,"kind":1,"returnType":2,},
      ],"init":"Mac_AppleSignIn_Init","kind":1,"order":[
        {"name":"Mac_AppleSignIn_Init","path":"extensions/AppleSignInMac/AppleSignInMac.yy",},
        {"name":"Mac_AppleSignIn_Final","path":"extensions/AppleSignInMac/AppleSignInMac.yy",},
        {"name":"Mac_AppleSignIn_AuthoriseUser","path":"extensions/AppleSignInMac/AppleSignInMac.yy",},
        {"name":"Mac_AppleSignIn_AddScope","path":"extensions/AppleSignInMac/AppleSignInMac.yy",},
        {"name":"Mac_AppleSignIn_ClearScopes","path":"extensions/AppleSignInMac/AppleSignInMac.yy",},
        {"name":"Mac_AppleSignIn_GetCredentialState","path":"extensions/AppleSignInMac/AppleSignInMac.yy",},
        {"name":"Mac_AppleSignIn_RegisterWindow","path":"extensions/AppleSignInMac/AppleSignInMac.yy",},
        {"name":"RegisterCallbacks","path":"extensions/AppleSignInMac/AppleSignInMac.yy",},
      ],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": false,
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
    "name": "Firebase Authentication Extras Logins (Extensions)",
    "path": "folders/__ReleaseThings__/Firebase Authentication Extras Logins (Extensions).yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": 2,
  "tvosclassname": "",
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": "",
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}