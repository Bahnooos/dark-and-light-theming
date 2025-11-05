import 'package:logger/logger.dart';

class AppLoggerHelper {
  static final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 3,
      lineLength: 80,
      colors: true,
      printEmojis: true,
    ),
    level: Level.debug,
    filter: AppLogFilter(),
  );

  static bool _isInitialized = false;
  static void initialize() {
    _isInitialized = true;
  }

  static void debug(String message) {
    if (_isInitialized) _logger.d(message);
  }

  static void info(String message) {
    if (_isInitialized) _logger.i(message);
  }

  static void warning(String message) {
    if (_isInitialized) _logger.w(message);
  }

  static void error(String message, [dynamic error]) {
    if (_isInitialized) {
      _logger.e(message, error: error, stackTrace: StackTrace.current);
    }
  }
}

class AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (event.level == Level.error || event.level == Level.warning) {
      return true;
    }
    return false;
  }
}
