import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:transport/src/errors/request_error.dart';
import 'package:transport/src/errors/service_error.dart';
import 'package:transport/src/utils/helpers/agent_helper.dart';

import '../../errors/user_error.dart';
import '../enums/request_type.dart';

class HttpHelper {
  HttpHelper._();

  static Future<http.Response?> doUserRequest({
    required RequestType requestType,
    required Uri requestUri,
    required bool addAuthorization,
    Map<String, String>? requestBody,
  }) async {
    http.Response? response;
    try {
      if (requestType == RequestType.get) {
        response = await http.get(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: addAuthorization,
          ),
        );
      } else if (requestType == RequestType.post) {
        response = await http.post(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: addAuthorization,
          ),
          body: requestBody,
        );
      } else if (requestType == RequestType.put) {
        response = await http.put(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: addAuthorization,
          ),
          body: requestBody,
        );
      } else {
        response = await http.delete(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: addAuthorization,
          ),
          body: requestBody,
        );
      }
      if (response.statusCode == 200) {
        return response;
      } else {
        throw UserError(response.body.toString());
      }
    } catch (e) {
      if (e.runtimeType == UserError) {
        rethrow;
      } else {
        throw Exception(e.toString());
      }
    }
  }

  static Future<http.Response?> doRequestRequest({
    required RequestType requestType,
    required Uri requestUri,
    Map<String, String>? requestBody,
  }) async {
    http.Response? response;
    try {
      if (requestType == RequestType.get) {
        response = await http.get(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: true,
          ),
        );
      } else if (requestType == RequestType.post) {
        response = await http.post(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: true,
          ),
          body: requestBody,
        );
      } else if (requestType == RequestType.put) {
        response = await http.put(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: true,
          ),
          body: requestBody,
        );
      } else {
        response = await http.delete(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: true,
          ),
          body: requestBody,
        );
      }
      if (response.statusCode == 200) {
        return response;
      } else {
        throw RequestError(response.body.toString());
      }
    } catch (e) {
      if (e.runtimeType == SocketException) {
        throw RequestError(
          e.toString(),
          // errorType: ErrorType.networkError,
        );
      } else {
        throw RequestError(e.toString());
      }
    }
  }

  static Future<http.Response?> doServiceRequest({
    required RequestType requestType,
    required Uri requestUri,
    Map<String, String>? requestBody,
  }) async {
    http.Response? response;
    try {
      if (requestType == RequestType.get) {
        response = await http.get(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: true,
          ),
        );
      } else if (requestType == RequestType.post) {
        response = await http.post(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: true,
          ),
          body: requestBody,
        );
      } else if (requestType == RequestType.put) {
        response = await http.put(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: true,
          ),
          body: requestBody,
        );
      } else {
        response = await http.delete(
          requestUri,
          headers: await _buildHeaders(
            setAuthorization: true,
          ),
          body: requestBody,
        );
      }
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServiceError(response.body.toString());
      }
    } catch (e) {
      if (e.runtimeType == SocketException) {
        throw ServiceError(
          e.toString(),
          // errorType: ErrorType.networkError,
        );
      } else {
        throw ServiceError(e.toString());
      }
    }
  }

  static Future<Map<String, String>> _buildHeaders({
    required bool setAuthorization,
  }) async {
    Map<String, String> headers = {};
    if (setAuthorization) {
      // headers.addAll(currentUser.authHeader());
    }

    headers.addAll(await AgentHelper.buildUserAgentHeader());

    return headers;
  }
}
