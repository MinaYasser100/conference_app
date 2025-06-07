class AppConst {
  // Singleton instance
  static final AppConst _instance = AppConst._internal();

  // Private constructor
  AppConst._internal();

  // Factory constructor to return the same instance
  factory AppConst() {
    return _instance;
  }

  // Constants
  static const String baseUrl = 'http://ucan.runasp.net/api/Brother/';
  static const String updatePoints = '/updatepoints';
  static const String getAllBrothers = '/getAllBrothers';
}
