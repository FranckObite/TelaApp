import 'package:dio/dio.dart';

const prodBaseUrl = 'http://mobile.telaci.com/api/v1/';
const devBaseUrl = 'http://192.168.1.4:8000/api/v1';
const cinetPayCheckTransactionEndpoint =
    'https://api-checkout.cinetpay.com/v2/payment/check';

class ApiManager {
  static Dio dio = Dio();

  static Future<Map<String, dynamic>?> fetchGet({required String uri}) async {
    try {
      Response response = await dio.get("$devBaseUrl/$uri");
      return response.data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<Map<String, dynamic>?> fetchPost(
      {required String uri, required Map<String, dynamic> data}) async {
    try {
      Response response = await dio.post(uri, data: data);
      return response.data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}