import 'dart:async';
import 'dart:io';

/// This function consolidates the bytes from an [HttpClientResponse] into a [List<int>].
Future<List<int>> consolidateBytes(HttpClientResponse response) async {
  final completer = Completer<List<int>>();
  final bytes = <int>[];

  // Listen to the response stream, accumulate bytes
  response.listen(
    bytes.addAll,
    onDone: () => completer.complete(bytes),
    onError: (error) => completer.completeError(error),
  );

  return completer.future;
}

Future<void> main() async {
  // Define the base URL for downloading images
  String baseUrl = "https://picsum.photos/200/300";
  HttpClient httpClient = HttpClient();
  HttpClientRequest request;
  HttpClientResponse response;

  // Download multiple images in a loop
  for (int i = 0; i < 5; i++) {
    print("Download image $i....");

    // Create an HTTP request
    request = await httpClient.getUrl(Uri.parse(baseUrl));

    // Send the request and get the response
    response = await request.close();

    // Check if the response is successful
    if (response.statusCode == HttpStatus.ok) {
      // Consolidate response bytes into a list
      final List<int> bytes = await consolidateBytes(response);

      // Write bytes to a file
      final file = File('images/image${i}.jpg'); // Specify your desired file path
      await file.writeAsBytes(bytes);
    }

    print("Finished downloading image $i....");
  }

  print("Download process completed.");
}
