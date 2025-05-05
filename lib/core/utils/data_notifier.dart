import 'dart:async';

/// A class that manages a stream of data.
class DataNotifier<R> {
  final _controller = StreamController<R>.broadcast();

  /// The stream of data.
  Stream<R> get stream => _controller.stream;

  /// Emit a new notification.
  void emit(R notify) {
    _controller.add(notify);
  }

  /// Dispose the stream controller.
  void dispose() {
    _controller.close();
  }
}
