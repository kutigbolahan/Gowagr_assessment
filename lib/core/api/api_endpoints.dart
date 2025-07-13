
import 'package:gowagr_assessment/core/config.dart';

final baseUrl = AppConfig.baseUrl;

class _AuthEndpoints {
  String createAccount = '$baseUrl/auth/UserSignup';
 
}



final authEndpoints = _AuthEndpoints();

