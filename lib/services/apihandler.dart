import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> apiHandler(
  String url,
  String method, {
  Map<String, String>? headers,
  Map<String, String>? body,
  bool authorization = false,
}) async {
  method = method.toUpperCase();
  http.Response response;

  if (method == 'GET') {
    response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
  } else if (method == 'POST') {
    print("Post Body: $body");
    response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
    print("Response: ${response.body}");
  } else if (method == 'PUT') {
    response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
  } else if (method == 'PATCH') {
    response = await http.patch(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
  } else if (method == 'DELETE') {
    response = await http.delete(Uri.parse(url), headers: headers, body: body);
  } else {
    throw Exception('Invalid method');
  }

  var jsonResponse = jsonDecode(response.body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonResponse;
  } else if (response.statusCode == 403) {
    print("Response: ${jsonResponse}");
    print("Status Code: ${response.statusCode}");
  } else {
    print("Response: ${jsonResponse}");
    print("URL: $url");
    print("Status Code: ${response.statusCode}");
    print("Exception: ${jsonResponse["message"]}");
    final errorMessage = jsonResponse["message"] ?? "An error occurred";

    throw Exception(errorMessage);
  }
}
