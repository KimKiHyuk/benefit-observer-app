const bool DEV = true;

const String DEV_URL = "127.0.0.1:8080/";
const String PROD_URL = "/";
const String FCM_TOKEN = "FCM_TOKEN";
String ROOT() => DEV ? DEV_URL : PROD_URL;
String SUBSCRIBE_API = ROOT() + "subscribes/";