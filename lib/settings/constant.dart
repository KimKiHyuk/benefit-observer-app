const bool DEV = true;

const String DEV_URL = "http://10.0.2.2:8000/";
const String PROD_URL = "/";

String ROOT() => DEV ? DEV_URL : PROD_URL;

String REGISTER_API = ROOT() + "auth/register/";

String SUBSCRIBE_API = ROOT() + "subscribe/";
String GET_USER_SUBSCRIBE_LIST_API = SUBSCRIBE_API + "user/";
String GET_SUBSCRIBE_LIST  = SUBSCRIBE_API + "list/";



const String FCM_TOKEN = "FCM_TOKEN";
const String INSTALL = "INSTALL";
