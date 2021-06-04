import 'package:loggy/loggy.dart';
import 'package:vecna/common/exception/expected_exception.dart';

import '../../flavor_config.dart';

/// Printer that submits log to the firebase crashlytics
class FirebaseLogPrinter extends LogPrinter {
  const FirebaseLogPrinter();

  @override
  void onLog(LogRecord record) {
    if (record.error is ExpectedException) {
      // Don't log expected exceptions as they are considered normal user flow
      // That would be exceptions like Session expired, No internet, etc.
      return;
    }

    if (record.level.priority >= LogLevel.error.priority) {
      FlavorConfig.submitError(record.error, message: record.message, stackTrace: record.stackTrace);
    } else {
      final time = record.time.toIso8601String().split('T')[1];
      final callerFrame = record.callerFrame == null ? '-' : '(${record.callerFrame.location})';
      final logLevel = record.level.toString().replaceAll('Level.', '').toUpperCase();

      FlavorConfig.log('$time $logLevel $callerFrame ${record.message}');
    }
  }
}
