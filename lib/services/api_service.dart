import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:free_blood_donation/utils/api_response.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ApiResponse<dynamic>> get({
    required String url,
    Map<String, String>? headers,
  }) async {

    developer.log(url.toString());
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.get(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');

    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> post({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  }) async {

    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.post(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> postWithoutData({
    required String url,
    Map<String, String>? headers,
  }) async {

    developer.log(url.toString());
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.post(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> postMultipart({
    required String url,
    required dynamic data,
    File? file, // File can be null if no image is selected
    Map<String, String>? headers,
  }) async {

    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('File: $file'); // This will log `null` if no file is selected
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final multipartRequest = http.MultipartRequest('POST', Uri.parse(url));
    multipartRequest.headers.addAll(headers ?? AppUrls.requestHeader);

    // Add each text field to the form-data
    multipartRequest.fields.addAll(data);

    // Add file only if it's not null
    if (file != null) {
      String fileField = 'photo'; // Ensure this matches the backend expectation
      multipartRequest.files
          .add(await http.MultipartFile.fromPath(fileField, file.path));
    }

    // Send the request
    final response = await multipartRequest.send();
    final streamResponse = await http.Response.fromStream(response);

    developer.log('Status Code: ${streamResponse.statusCode}');
    developer.log('Body: ${streamResponse.body}');
    return _handleApiResponse(streamResponse);
  }

  Future<ApiResponse<dynamic>> patch({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  }) async {

    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final response = await http.patch(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    developer.log('Status Code: ${response.statusCode}');
    developer.log('Body: ${response.body}');
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> patchMultipart({
    required String url,
    required dynamic data,
    File? file, // File can be null if no image is selected
    Map<String, String>? headers,
  }) async {

    developer.log(url.toString());
    developer.log('Data: $data');
    developer.log('File: $file'); // This will log `null` if no file is selected
    developer.log('Headers: ${headers?.toString() ?? AppUrls.requestHeader}');

    final multipartRequest = http.MultipartRequest('PATCH', Uri.parse(url));
    multipartRequest.headers.addAll(headers ?? AppUrls.requestHeader);

    // Add each text field to the form-data
    multipartRequest.fields.addAll(data);

    // Add file only if it's not null
    if (file != null) {
      String fileField = 'photo'; // Ensure this matches the backend expectation
      multipartRequest.files
          .add(await http.MultipartFile.fromPath(fileField, file.path));
    }

    // Send the request
    final response = await multipartRequest.send();
    final streamResponse = await http.Response.fromStream(response);

    developer.log('Status Code: ${streamResponse.statusCode}');
    developer.log('Body: ${streamResponse.body}');
    return _handleApiResponse(streamResponse);
  }

  ApiResponse<dynamic> _handleApiResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse.success(data: jsonDecode(response.body));
    } else {
      return ApiResponse.error(
          statusCode: response.statusCode, message: jsonDecode(response.body));
    }
  }

}
