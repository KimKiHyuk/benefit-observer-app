class AuthService {
  String _fcmtoken;


  void setLocalFcmToken(String token) {
    this._fcmtoken = token;
  }

  String getLocalFcmToken() {
    return this._fcmtoken ?? null;
  }
}