import 'package:appkel_for_courier_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

import 'app/app.dart';

import 'data/storage/local_storage.dart';
// import 'firebase_options.dart';
import 'helpers/logger_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await LocalStorage.init();
  // LocalStorage().token = null;

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
    if (record.error != null) {
      print('${record.error}');

      if (record.stackTrace != null) {
        print('${record.stackTrace}');
      }

      FirebaseCrashlytics.instance.recordError(
        record.error,
        record.stackTrace,
        reason: record.message,
      );
    }

    if (record.level == Level.SEVERE) {}
  });

  FlutterError.onError = (details) {
    Logger.root.severe(details.exceptionAsString(), details.exception);
  };

  PlatformDispatcher.instance.onError = (e, s) {
    Logger.root.severe(e, s);
    return false;
  };

  initLoggerListener();
  runApp(const ProviderScope(
    child: App(),
  ));
}
