// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/io_client.dart';

const String HTTP_METHOD_GET = 'GET';
const String HTTP_METHOD_POST = 'POST';
const String HTTP_METHOD_PUT = 'PUT';
const String HTTP_METHOD_DELETE = 'DELETE';
const String HTTP_METHOD_PATCH = 'PATCH';

const API_BASE_URL = 'http://localhost:8080/stream_api';
const API_VERSION = 'v1';

class CustomHttpClient {
  // Function to create an HTTP client with SSL overrides
  static Future<IOClient> createClient() async {
    // Create a SecurityContext that allows trusting the self-signed certificate
    SecurityContext customContext = SecurityContext(withTrustedRoots: true);

    final Uint8List cert =
        (await rootBundle.load('assets/certificates/flutter.pem'))
            .buffer
            .asUint8List();

    // Load your self-signed certificate
    customContext.setTrustedCertificatesBytes(cert);

    // Wrap the HttpClient with the http.Client for convenience
    return IOClient(HttpClient(context: customContext));
  }
}
