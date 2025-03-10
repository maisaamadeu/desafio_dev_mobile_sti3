import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:desafio_dev_mobile_sti3/core/network/network.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const String serverScheme = 'https';
const String serverAuthority = 'desafiotecnicosti3.azurewebsites.net';

class ServerApiClient {
  final NetworkInfoRepository networkInfoRepository;

  ServerApiClient({
    required this.networkInfoRepository,
  });

  final Map<String, String> _authHeader = {};
  Map<String, String> get authHeader => _authHeader;

  Future<http.Response> get(
    path, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final url = Uri(
      scheme: serverScheme,
      host: serverAuthority,
      path: path,
      queryParameters: queryParameters,
    );

    final Map<String, String> allHeaders = _authHeader;
    if (headers != null) {
      allHeaders.addAll(headers);
    }
    if (!allHeaders.containsKey('Content-Type')) {
      allHeaders['Content-Type'] = 'application/json';
    }

    http.Response response;
    try {
      response =
          await http.get(url, headers: _authHeader..addAll(headers ?? {}));
    } catch (ex) {
      final check = await networkInfoRepository.hasConnection;
      if (!check) {
        throw NoConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _processResponse(
      response: response,
      requestFunc: () =>
          get(path, queryParameters: queryParameters, headers: headers),
    );
  }

  Future<T> _processResponse<T>({
    required http.Response response,
    required FutureOr<T> Function() requestFunc,
  }) async {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return response as T;
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else if (response.statusCode == 403) {
      throw ForbiddenException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else {
      throw Exception('An error occurred');
    }
  }

  String _formatResponseLog(http.Response response, {Object? requestBody}) {
    final time = DateTime.now().toUtc().toIso8601String();
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String formattedRequestBody =
        requestBody != null ? encoder.convert(requestBody) : '';
    String formattedBodyJson;
    try {
      final json = jsonDecode(response.body);
      formattedBodyJson = encoder.convert(json);
    } catch (e) {
      formattedBodyJson = response.body;
    }
    return '''
  $time
  Request: ${response.request}${formattedRequestBody.isNotEmpty == true ? '\n  Request body: $formattedRequestBody' : ''}
  Response code: ${response.statusCode}
  Body: $formattedBodyJson
  ''';
  }
}
