{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "GoogleSignIn",
  "androidactivityinject": "\r\n\r\n",
  "androidclassname": "YYGoogleSignIn",
  "androidcodeinjection": "<YYAndroidGradleDependencies>\r\n\r\nimplementation 'com.google.android.gms:play-services-auth:19.2.0'\r\n\r\n\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidManifestManifestInject>\r\n\r\n</YYAndroidManifestManifestInject>\r\n\r\n<YYAndroidManifestActivityInject>\r\n\r\n</YYAndroidManifestActivityInject>\r\n\r\n<YYAndroidManifestApplicationInject>\r\n\r\n</YYAndroidManifestApplicationInject>\r\n\r\n",
  "androidinject": "\r\n\r\n",
  "androidmanifestinject": "\r\n\r\n",
  "androidPermissions": [],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "YYGoogleSignIn",
  "copyToTargets": 9007199254741036,
  "date": "2024-03-03T12:38:21.1009125-08:00",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "0.0.1",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"GoogleSignIn.ext","constants":[],"copyToTargets":-1,"filename":"GoogleSignIn.ext","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GoogleSignIn_Show","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"GoogleSignIn_Show","help":"GoogleSignIn_Show(token)","hidden":false,"kind":4,"returnType":1,},
      ],"init":"","kind":4,"order":[
        {"name":"GoogleSignIn_Show","path":"extensions/GoogleSignIn/GoogleSignIn.yy",},
      ],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"GoogleSignIn.js","constants":[],"copyToTargets":-1,"filename":"GoogleSignIn.js","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GoogleSignIn_Show_","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"GoogleSignIn_Show_","help":"GoogleSignIn_Show_(token)","hidden":false,"kind":5,"returnType":1,},
      ],"init":"","kind":5,"order":[
        {"name":"GoogleSignIn_Show_","path":"extensions/GoogleSignIn/GoogleSignIn.yy",},
      ],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "\r\n\r\nimplementation 'com.google.android.gms:play-services-auth:19.2.0'\r\n\r\n\r\n",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "\r\n     pod 'GoogleSignIn','6.2.4'\r\n",
  "ioscodeinjection": "\r\n<YYIosCocoaPods>\r\n     pod 'GoogleSignIn','6.2.4'\r\n</YYIosCocoaPods>\r\n\r\n<YYIosCFBundleURLSchemesArray>\r\n     <string>com.googleusercontent.apps.20722703459-bb8lnfpgj83fuao2sn48ugv7jr7urpol</string>\r\n</YYIosCFBundleURLSchemesArray>\r\n",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": true,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"option_name","defaultValue":"0","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"937ba959-39fa-4a7d-a854-91b8e5881c11","hidden":false,"listItems":[],"optType":1,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"option_name1","defaultValue":"0","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"2c3a48ad-0cb9-4e8b-9834-fa19b718339d","hidden":false,"listItems":[],"optType":1,},
  ],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Firebase Authentication Extras Logins (Extensions)",
    "path": "folders/__ReleaseThings__/Firebase Authentication Extras Logins (Extensions).yy",
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