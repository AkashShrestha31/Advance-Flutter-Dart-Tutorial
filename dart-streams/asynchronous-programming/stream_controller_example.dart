import 'dart:async';

void main() {
  // Create a StreamController to manage the stream.
  StreamController<int> streamController = StreamController<int>();

  // Create a stream using the StreamController's stream getter.
  final Stream<int> stream = streamController.stream;

  // Listen to the stream and print the received values.
  stream.listen((value) {
    print("The value is $value");
  });

  // Add values to the stream using a loop.
  for (int i = 0; i < 10; i++) {
    streamController.add(i);
  }

  // Close the stream after adding values.
  streamController.close();
}
