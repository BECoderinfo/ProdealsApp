import 'package:pro_deals1/imports.dart';

class ApiService {
  static Future<dynamic> getApi(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await get(
        url,
        headers: headers,
      ).timeout(Apis.timeoutDuration);
      return _processResponse(response);
    } on SocketException {
      handleSocketException();
    } on TimeoutException {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Request timed out. Please try again.",
      );
      return null;
    } catch (e) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Unexpected error occurred: $e",
      );

      return null;
    }
  }

  static Future<dynamic> multipartApi(
    Uri url,
    dynamic imageParamName,
    dynamic imagePath, {
    Map<String, String>? body,
    String method = 'POST',
  }) async {
    try {
      var request = MultipartRequest(
        method,
        url,
      );

      if (body != null) {
        request.fields.addAll(body);
      }
      if (imageParamName is String && imagePath is String) {
        if (imageParamName.isNotEmpty) {
          request.files
              .add(await MultipartFile.fromPath(imageParamName, imagePath));
        }
      } else if (imageParamName is List && imageParamName.isNotEmpty) {
        for (int i = 0; i < imageParamName.length; i++) {
          request.files.add(
              await MultipartFile.fromPath(imageParamName[i], imagePath[i]));
        }
      }
      request.headers.addAll(Apis.headersValue);

      StreamedResponse response1 =
          await request.send().timeout(Apis.timeoutDuration);
      String s = await response1.stream.bytesToString();
      return _processResponse(Response(
        s,
        response1.statusCode,
        request: response1.request,
      ));
    } on SocketException {
      handleSocketException();
    } on TimeoutException {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Request timed out. Please try again.",
      );
      return null;
    } catch (e) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Unexpected error occurred: $e",
      );

      return null;
    }
  }

  static Future<dynamic> putApi(
    Uri url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      var response;
      if (body == null) {
        response = await put(
          url,
        ).timeout(Apis.timeoutDuration);
      } else {
        response = await put(
          url,
          body: jsonEncode(body),
          headers: Apis.headersValue,
        ).timeout(Apis.timeoutDuration);
      }
      return _processResponse(response);
    } on SocketException {
      handleSocketException();
    } on TimeoutException {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Request timed out. Please try again.",
      );
      return null;
    } catch (e) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Unexpected error occurred: $e",
      );

      return null;
    }
  }

  static Future<dynamic> deleteApi(
    Uri url,
  ) async {
    try {
      final response = await delete(
        url,
      ).timeout(Apis.timeoutDuration);
      return _processResponse(response);
    } on SocketException {
      handleSocketException();
    } on TimeoutException {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Request timed out. Please try again.",
      );
      return null;
    } catch (e) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Unexpected error occurred: $e",
      );

      return null;
    }
  }

  static Future<dynamic> deleteApiBody(
    Uri url,
    Map<String, List<String>> body,
  ) async {
    try {
      final response = await delete(
        url,
        headers: Apis.headersValue,
        body: jsonEncode(body),
      ).timeout(Apis.timeoutDuration);

      return _processResponse(response);
    } on SocketException {
      handleSocketException();
    } on TimeoutException {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Request timed out. Please try again.",
      );
      return null;
    } catch (e) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Unexpected error occurred: $e",
      );

      return null;
    }
  }

  static Future<dynamic> postApi(
    Uri url, {
    dynamic body,
  }) async {
    try {
      var response;
      if (body != null) {
        response = await post(
          url,
          headers: Apis.headersValue,
          body: jsonEncode(body),
        ).timeout(Apis.timeoutDuration);
      } else {
        response = await post(
          url,
          headers: Apis.headersValue,
        ).timeout(Apis.timeoutDuration);
      }

      return _processResponse(response);
    } on SocketException {
      handleSocketException();
    } on TimeoutException {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Request timed out. Please try again.",
      );
      return null;
    } catch (e) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Unexpected error occurred: $e",
      );
      return null;
    }
  }

  static dynamic _processResponse(
    Response response,
  ) {
    print("S :: ${response.body}");
    print("S :: ${response.statusCode}");
    print("S :: ${response.request?.url}");
    switch (response.statusCode) {
      case 200 || 201:
        return jsonDecode(response.body);
      case 400:
        if (jsonDecode(response.body)['message'] != null) {
          ShowToast.errorSnackbar(
            title: "Error",
            msg:
                "${jsonDecode(response.body)['message'] ?? "Something went wrong.Please try again."}",
          );

          return null;
        }
        throw BadRequestException('Bad request: ${response.body}');
      case 401:
      case 404:
        if (response.request!.url.toString().contains("/hestory/salesData")) {
          return jsonDecode(response.body)['error'] ?? "";
        }
        ShowToast.errorSnackbar(
          title: "Error",
          msg:
              'Error occurred while communicating with server. Status code: ${response.statusCode}',
        );
        return null;
      case 403:
        throw UnauthorisedException('Unauthorized: ${response.body}');
      case 500:
        if (response.request!.url.toString().contains("/order/create") &&
            jsonDecode(response.body)['message'] ==
                "Invalid or inactive promocode") {
          return jsonDecode(response.body)['message'];
        } else if (!(response.request!.url
                .toString()
                .contains("/offer/bussinessGet/") ||
            response.request!.url.toString().contains("/cart/get/") ||
            response.request!.url.toString().contains("/banner/getbanners/") ||
            response.request!.url.toString().contains("/business/getByCity/") ||
            response.request!.url
                .toString()
                .contains("/business/getByCategory") ||
            response.request!.url.toString().contains("/banner/getAll"))) {
          if (jsonDecode(response.body)['message'] != null) {
            ShowToast.errorSnackbar(
              title: "Error",
              msg:
                  "${jsonDecode(response.body)['message'] ?? "Something went wrong.Please try again."}",
            );
          }
          return null;
        }

      default:
        ShowToast.errorSnackbar(
          title: "Error",
          msg:
              'Error occurred while communicating with server. Status code: ${response.statusCode}',
        );
        return null;
    }
  }

  static dynamic handleSocketException() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Something went wrong. Please try again.",
      );
      return null;
    }
    ShowToast.errorSnackbar(
      title: "Error",
      msg: "No internet connection.",
    );
    return null;
  }
}

class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);
}

class UnauthorisedException implements Exception {
  final String message;

  UnauthorisedException(this.message);
}
