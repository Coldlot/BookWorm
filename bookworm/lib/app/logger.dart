import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 5,
    lineLength: 10,
  ),
);

class EnableReleaseLogs extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

final Logger silentLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 5,
  ),
);
