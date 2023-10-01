import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

/// TODO: I unfortunately could not get this working in time. It would have been great to use the Google Address Validator API to
/// check that the address entered exists and display the result in the UI
class AddressValidatorService {
  late final Dio _dio;

  AddressValidatorService() {
    _initDio();
  }
  void _initDio() async {
    await dotenv.load();
    final BaseOptions options = BaseOptions(
      sendTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      followRedirects: true,
    );
    _dio = Dio(options);
  }

  Future<void> validateAddress(String address) async {
    final String key = dotenv.env['GOOGLE_ADDRESS_VALIDATOR_API_KEY']!;
    var url = 'https://addressvalidation.googleapis.com/v1:validateAddress';

    final queryParameters = {
      'key': key,
    };

    String address = '''
    {
      "address": {
        "regionCode": "US",
        "locality": "Mountain View",
        "addressLines": ["1600 Amphitheatre Pkwy"]
      }
    }''';

    var response = await _dio.post(url,
        queryParameters: queryParameters,
        options: Options(headers: {"Content-Type": "application/json"}),
        data: json.encode(address));

    print("${response.data}");
    print("${response.statusCode}");
  }
}
