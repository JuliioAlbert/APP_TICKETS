import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String baseURL = dotenv.env['BASE_URL'] ?? "No hay key ";
}
