import 'package:flutter_dotenv/flutter_dotenv.dart';

class Const {
  static const String baseURL = "https://dummyapi.io/data/v1/";
  static final String appId = dotenv.env['APP-ID'] ?? "";
}