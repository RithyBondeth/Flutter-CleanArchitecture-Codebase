import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiConfig {
  final String baseUrl;
  const ApiConfig({required this.baseUrl});

  Uri uri(String path, {Map<String, String>? queryParameters}) {
    return Uri.parse(baseUrl).replace(
      path: path.startsWith('/') ? path : '/$path',
      queryParameters: queryParameters,
    );
  }
}

final apiConfigProvider = Provider<ApiConfig>((ref) {
  return const ApiConfig(
    baseUrl: 'https://jsonplaceholder.typicode.com',
  ); // Domain
});
