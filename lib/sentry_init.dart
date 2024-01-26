import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'main.dart';

// function named sentry_init
void sentry_init() async {
  // initialize sentry
  await SentryFlutter.init(
        (options) {
      options.dsn =
      'https://8a5583a49bc235f68f5edbd9c4cf7bca@o4506637194756096.ingest.sentry.io/4506637195935744';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(workwise_autism()),
  );
  // Sentry.captureException(Exception('Sentry Test'));
}