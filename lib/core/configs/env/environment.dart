import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final Environment environment = Environment.instance;

class Environment {
  Environment._internal();

  static final Environment _instance = Environment._internal();

  static Environment get instance => _instance;

  static String get fileName => kReleaseMode ? '.env' : '.env';

  static String get name => dotenv.env['ENV_NAME'] ?? 'staging';

  static String get projectName => dotenv.env['PROJECT_NAME'] ?? 'example';

  static String get appVersion => dotenv.env['APP_VERSION'] ?? '0.0.1';

  static String get release => 'v$appVersion';

  static String get appHostPort => dotenv.env['API_PORT'] ?? '';

  static String get appHostUrl =>
      dotenv.env['API_URL'] ?? 'Host URL not configured';

  static String get appSocketHostUrl => appHostUrl.replaceAll('https://', '');

  static String get appTitle => dotenv.env['APP_TITLE'] ?? 'Example App';

  initConfig() async {
    await dotenv.load(fileName: Environment.fileName);
  }
}
