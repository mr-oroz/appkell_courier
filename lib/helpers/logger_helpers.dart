import 'package:logging/logging.dart';

void initLoggerListener() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');

    assert(() {
      if (record.error != null) {
        // ignore: avoid_print
        print('${record.error}');
      }
      if (record.stackTrace != null) {
        // ignore: avoid_print
        print('${record.stackTrace}');
      }

      return true;
    }());
  });
}
