import 'dart:async';

void main() {
  // Creating the first stream and handling errors using `onError` callback.
  StreamController<int> streamController = StreamController<int>();
  Stream<int> stream = streamController.stream;
  
  stream.listen(
    (value) {
      // Handle data
      print("The Stream 1 value is $value");
    },
    onDone: () {
      // Handle stream completion
      print("Stream 1 Completed ....");
    },
    onError: (err) {
      // Handle errors
      print("Error is $err ....");
    },
  );
  
  // Adding values to the first stream
  for (int i in List.generate(5, (index) {
    return index;
  })) {
    streamController.add(i);
  }
  
  // Closing the first stream
  streamController.close();

  // Creating the second stream and handling errors using `try-catch`.
  StreamController<int> streamController1 = StreamController<int>();
  Stream<int> stream1 = streamController1.stream;
  
  stream1.listen((value) {
    try {
      // Handle data with error handling
      print("The Stream 2 value is $value");
    } catch (err) {
      // Handle exceptions
      print("The exception is $err");
    }
  }, onDone: () {
    // Handle stream completion
    print("Stream 2 Completed ....");
  });
  
  // Adding values to the second stream
  for (int i in List.generate(5, (index) {
    return index;
  })) {
    streamController1.add(i);
  }
  
  // Closing the second stream
  streamController1.close();
}
