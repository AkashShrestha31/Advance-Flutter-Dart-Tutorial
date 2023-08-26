import 'dart:async';

void main() {
  // Create a StreamController to manage the broadcast stream.
  StreamController<int> streamController = StreamController<int>.broadcast();

  // Create a stream using the StreamController's stream getter.
  final Stream<int> stream = streamController.stream;

  // Listen to the stream and print the received values.
  stream.listen((value) {
    print("The Listener 1 is $value");
  });

  // Listen to the same stream again with a different listener.
  stream.listen((value) {
    print("The Listener 2 is $value");
  });

  // Add values to the stream using a loop.
  for (int i = 0; i < 10; i++) {
    streamController.add(i);
  }

  // Close the stream after adding values.
  streamController.close();
}
