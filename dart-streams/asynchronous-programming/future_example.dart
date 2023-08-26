import 'dart:async';

/// Asynchronous function that adds two integers and returns a [Future] with the result.
///
/// Given two integers [a] and [b], this function calculates their sum and
/// returns a [Future] that will eventually hold the sum as an integer.
Future<int> addTwoNumber(int a, int b) {
  return Future.value(a + b);
}

/// The main entry point of the Dart program.
///
/// This asynchronous function demonstrates the use of [Future] for handling
/// asynchronous operations. It calculates the sum of 3 and 5 using the
/// [addTwoNumber] function and prints the result.
Future<void> main() async {
  // Calculate the sum of 3 and 5 asynchronously using [addTwoNumber].
  int value = await addTwoNumber(3, 5);

  // Print the calculated sum.
  print("The value is $value");
}
