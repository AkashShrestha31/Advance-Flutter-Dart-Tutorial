import 'dart:async';

void main(x) {
  // Create a stream from an iterable and make it a broadcast stream.
  final stream = Stream.fromIterable([1, 2, 3, 4, 5]).asBroadcastStream();

  // Transforming the stream using the `transform` method
  final doubledStream = stream.transform(StreamTransformer<int, int>.fromHandlers(
    handleData: (value, sink) {
      sink.add(value * 2);
    },
  ));

  // Listen to the transformed stream and print the doubled values
  doubledStream.listen((value) {
    print(value); // Output: 2, 4, 6, 8, 10
  });

  // Transforming the stream using the `map` method
  final mapValue = stream.map((value) => value * 2);

  // Listen to the mapped stream and print the transformed values
  mapValue.listen((value) {
    print("The value is $value");
  });
}
