{
  "$GMExtension":"",
  "%Name":"AppleSignIn",
  "androidactivityinject":"",
  "androidclassname":"",
  "androidcodeinjection":"",
  "androidinject":"",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":false,
  "androidsourcedir":"",
  "author":"",
  "classname":"YY_AppleSignIn",
  "copyToTargets":9007199254740992,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"0.0.2",
  "files":[
    {"$GMExtensionFile":"","%Name":"AppleSignIn.ext","constants":[
        {"$GMExtensionConstant":"","%Name":"applesignin_scope_fullname","hidden":false,"name":"applesignin_scope_fullname","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"\"fullname\"",},
        {"$GMExtensionConstant":"","%Name":"applesignin_scope_email","hidden":false,"name":"applesignin_scope_email","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"\"email\"",},
        {"$GMExtensionConstant":"","%Name":"applesignin_signin_response","hidden":false,"name":"applesignin_signin_response","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1",},
        {"$GMExtensionConstant":"","%Name":"applesignin_state_authorized","hidden":false,"name":"applesignin_state_authorized","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"100",},
        {"$GMExtensionConstant":"","%Name":"applesignin_state_revoked","hidden":false,"name":"applesignin_state_revoked","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"101",},
        {"$GMExtensionConstant":"","%Name":"applesignin_state_not_found","hidden":false,"name":"applesignin_state_not_found","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"102",},
        {"$GMExtensionConstant":"","%Name":"applesignin_credential_response","hidden":false,"name":"applesignin_credential_response","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"2",},
        {"$GMExtensionConstant":"","%Name":"applesignin_realuserstatus_likelyreal","hidden":false,"name":"applesignin_realuserstatus_likelyreal","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"5002",},
        {"$GMExtensionConstant":"","%Name":"applesignin_realuserstatus_unknown","hidden":false,"name":"applesignin_realuserstatus_unknown","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"5001",},
        {"$GMExtensionConstant":"","%Name":"applesignin_realuserstatus_unsupported","hidden":false,"name":"applesignin_realuserstatus_unsupported","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"5000",},
      ],"copyToTargets":9007199254740996,"filename":"AppleSignIn.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"AppleSignIn_Init","argCount":0,"args":[],"documentation":"","externalName":"AppleSignIn_Init","help":"AppleSignIn_Init()","hidden":false,"kind":4,"name":"AppleSignIn_Init","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"AppleSignIn_AuthoriseUser","argCount":0,"args":[],"documentation":"","externalName":"AppleSignIn_AuthoriseUser","help":"AppleSignIn_AuthoriseUser()","hidden":false,"kind":4,"name":"AppleSignIn_AuthoriseUser","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"AppleSignIn_AddScope","argCount":0,"args":[1,],"documentation":"","externalName":"AppleSignIn_AddScope","help":"AppleSignIn_AddScope(scope)","hidden":false,"kind":4,"name":"AppleSignIn_AddScope","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"AppleSignIn_ClearScopes","argCount":0,"args":[],"documentation":"","externalName":"AppleSignIn_ClearScopes","help":"AppleSignIn_ClearScopes()","hidden":false,"kind":4,"name":"AppleSignIn_ClearScopes","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"AppleSignIn_GetCredentialState","argCount":0,"args":[1,],"documentation":"","externalName":"AppleSignIn_GetCredentialState","help":"AppleSignIn_GetCredentialState(identitiy_token)","hidden":false,"kind":4,"name":"AppleSignIn_GetCredentialState","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"AppleSignIn_Init","kind":4,"name":"AppleSignIn.ext","order":[
        {"name":"AppleSignIn_Init","path":"extensions/AppleSignIn/AppleSignIn.yy",},
        {"name":"AppleSignIn_AuthoriseUser","path":"extensions/AppleSignIn/AppleSignIn.yy",},
        {"name":"AppleSignIn_AddScope","path":"extensions/AppleSignIn/AppleSignIn.yy",},
        {"name":"AppleSignIn_ClearScopes","path":"extensions/AppleSignIn/AppleSignIn.yy",},
        {"name":"AppleSignIn_GetCredentialState","path":"extensions/AppleSignIn/AppleSignIn.yy",},
      ],"origname":"","ProxyFiles":[],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"",
  "html5Props":false,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"",
  "ioscodeinjection":"",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":true,
  "iosSystemFrameworkEntries":[
    {"$GMExtensionFrameworkEntry":"","%Name":"AuthenticationServices.framework","embed":0,"name":"AuthenticationServices.framework","resourceType":"GMExtensionFrameworkEntry","resourceVersion":"2.0","weakReference":true,},
  ],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"",
  "maclinkerflags":"",
  "macsourcedir":"",
  "name":"AppleSignIn",
  "options":[],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Firebase Authentication Extras Logins (Extensions)",
    "path":"folders/__ReleaseThings__/Firebase Authentication Extras Logins (Extensions).yy",
  },
  "productId":"",
  "resourceType":"GMExtension",
  "resourceVersion":"2.0",
  "sourcedir":"",
  "supportedTargets":9007199254740996,
  "tvosclassname":"YY_AppleSignIn",
  "tvosCocoaPodDependencies":"",
  "tvosCocoaPods":"",
  "tvoscodeinjection":"",
  "tvosdelegatename":"",
  "tvosmaccompilerflags":"",
  "tvosmaclinkerflags":"",
  "tvosplistinject":"",
  "tvosProps":true,
  "tvosSystemFrameworkEntries":[
    {"$GMExtensionFrameworkEntry":"","%Name":"AuthenticationServices.framework","embed":0,"name":"AuthenticationServices.framework","resourceType":"GMExtensionFrameworkEntry","resourceVersion":"2.0","weakReference":true,},
  ],
  "tvosThirdPartyFrameworkEntries":[],
}