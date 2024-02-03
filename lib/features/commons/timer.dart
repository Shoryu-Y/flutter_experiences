import 'dart:async';

Future<int> measure(FutureOr<void> Function() callback) async {
  final stopwatch = Stopwatch()..start();
  await callback();
  stopwatch.stop();
  print(stopwatch.elapsedMicroseconds);

  return stopwatch.elapsedMicroseconds;
}
