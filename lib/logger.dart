// import 'dart:developer';

// import 'package:http/http.dart' as http;

// class LoggingHttpClient extends http.BaseClient {
//   final http.Client _inner = http.Client();

//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) async {
//     log("${request.method} ${request.url}", name: 'Request URL');
//     request.headers.forEach(
//       (key, value) => log("$key: $value", name: 'Headers'),
//     );

//     if (request is http.Request) {
//       log("${request.body}", name: 'Body');
//     }

//     final response = await _inner.send(request);

//     final responseBody = await http.Response.fromStream(response);
//     log("[${response.statusCode}]: ${responseBody.body}", name: 'RESPONSE');

//     // Recreate the StreamedResponse since the original stream is consumed
//     return http.StreamedResponse(
//       Stream.fromIterable([responseBody.bodyBytes]),
//       response.statusCode,
//       headers: response.headers,
//       reasonPhrase: response.reasonPhrase,
//       request: response.request,
//     );
//   }
// }


import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class LoggingHttpClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    _logRequest(request);

    final streamedResponse = await _inner.send(request);
    final response = await http.Response.fromStream(streamedResponse);

    _logResponse(streamedResponse, response);

    return http.StreamedResponse(
      Stream.fromIterable([response.bodyBytes]),
      response.statusCode,
      headers: response.headers,
      reasonPhrase: response.reasonPhrase,
      request: response.request,
    );
  }

  void _logRequest(http.BaseRequest request) {
    final uri = request.url;
    final method = request.method;

    log("➡️ $method ${uri.toString()}", name: 'HTTP Request');

    // Log query parameters
    if (uri.queryParameters.isNotEmpty) {
      log("Query Parameters:", name: '🔍');
      uri.queryParameters.forEach((key, value) {
        log("  $key: $value", name: '🔍');
      });
    }

    // Log headers
    if (request.headers.isNotEmpty) {
      log("Headers:", name: '📝');
      request.headers.forEach((key, value) {
        log("  $key: $value", name: '📝');
      });
    }

    // Log body (if available)
    if (request is http.Request) {
      final contentType = request.headers['Content-Type'] ?? '';
      final body = request.body;
      log("Request Body:", name: '📦');

      if (contentType.contains("application/json")) {
        try {
          final decoded = jsonDecode(body);
          log(JsonEncoder.withIndent('  ').convert(decoded), name: '📦 JSON');
        } catch (_) {
          log(body, name: '📦 RAW');
        }
      } else {
        log(body, name: '📦 RAW');
      }
    }
  }

  void _logResponse(http.StreamedResponse streamedResponse, http.Response response) {
    final uri = streamedResponse.request?.url;
    final statusCode = response.statusCode;

    log("⬅️ [$statusCode] ${uri.toString()}", name: 'HTTP Response');

    // Log response headers
    if (response.headers.isNotEmpty) {
      log("Response Headers:", name: '📭');
      response.headers.forEach((key, value) {
        log("  $key: $value", name: '📭');
      });
    }

    // Log body
    final contentType = response.headers['content-type'] ?? '';
    final body = response.body;
    log("Response Body:", name: '📦');

    if (contentType.contains("application/json")) {
      try {
        final decoded = jsonDecode(body);
        log(JsonEncoder.withIndent('  ').convert(decoded), name: '📦 JSON');
      } catch (_) {
        log(body, name: '📦 RAW');
      }
    } else {
      log(body, name: '📦 RAW');
    }
  }
}
