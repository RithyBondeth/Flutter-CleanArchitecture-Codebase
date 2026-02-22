import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppEnvironment { dev, staging, prod }

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

AppEnvironment _parseAppEnvironment(String value) {
  switch (value.toLowerCase()) {
    case 'dev':
      return AppEnvironment.dev;
    case 'staging':
      return AppEnvironment.staging;
    case 'prod':
      return AppEnvironment.prod;
    default:
      return AppEnvironment.dev;
  }
}

// Pick which env you are building
const _environmentStr = String.fromEnvironment('APP_ENV', defaultValue: 'dev');

// Base URLs (can be overridden per build command)
const _devBaseUrl = String.fromEnvironment(
  'DEV_BASE_URL',
  defaultValue: 'https://jsonplaceholder.typicode.com',
);
const _stagingBaseUrl = String.fromEnvironment(
  'STAGING_BASE_URL',
  defaultValue: 'https://jsonplaceholder.typicode.com',
);
const _prodBaseUrl = String.fromEnvironment(
  'PROD_BASE_URL',
  defaultValue: 'https://jsonplaceholder.typicode.com',
);

const _devDummyDomainBaseUrl = String.fromEnvironment(
  'DEV_DUMMY_DOMAIN_BASE_URL',
  defaultValue: 'https://dummyjson.com/',
);

const _stagingDummyDomainBaseUrl = String.fromEnvironment(
  'STAGING_DUMMY_DOMAIN_BASE_URL',
  defaultValue: 'https://dummyjson.com/',
);

const _prodDummyDomainBaseUrl = String.fromEnvironment(
  'PROD_DUMMY_DOMAIN_BASE_URL',
  defaultValue: 'https://dummyjson.com/',
);

final appEnvProvider = Provider<AppEnvironment>(
  (ref) => _parseAppEnvironment(_environmentStr),
);

final apiConfigProvider = Provider<ApiConfig>((ref) {
  final env = ref.watch(appEnvProvider);

  final baseUrl = switch (env) {
    AppEnvironment.dev => _devBaseUrl,
    AppEnvironment.staging => _stagingBaseUrl,
    AppEnvironment.prod => _prodBaseUrl,
  };

  return ApiConfig(baseUrl: baseUrl);
});

final apiConfigDummyDomainProvider = Provider<ApiConfig>((ref) {
  final env = ref.watch(appEnvProvider);

  final baseUrl = switch (env) {
    AppEnvironment.dev => _devDummyDomainBaseUrl,
    AppEnvironment.staging => _stagingDummyDomainBaseUrl,
    AppEnvironment.prod => _prodDummyDomainBaseUrl,
  };

  return ApiConfig(baseUrl: baseUrl);
});

// Run Commands
// flutter run \
//   --dart-define=APP_ENV=dev \
//   --dart-define=DEV_BASE_URL=https://dev.myapi.com

// flutter run \
//   --dart-define=APP_ENV=staging \
//   --dart-define=STAGING_BASE_URL=https://staging.myapi.com

// flutter run \
//   --dart-define=APP_ENV=prod \
//   --dart-define=PROD_BASE_URL=https://api.myapi.com

// Build Commands

// Andriod APK
// flutter build apk --release \
//   --dart-define=APP_ENV=prod \
//   --dart-define=PROD_BASE_URL=https://api.myapi.com

// Andriod AppBundle
// flutter build appbundle --release \
//   --dart-define=APP_ENV=prod \
//   --dart-define=PROD_BASE_URL=https://api.myapi.com

// IOS
// flutter build ios --release \
//   --dart-define=APP_ENV=prod \
//   --dart-define=PROD_BASE_URL=https://api.myapi.com
