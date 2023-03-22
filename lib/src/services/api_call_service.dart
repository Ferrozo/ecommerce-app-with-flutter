import 'package:ecommerce_app_with_flutter/src/data/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../core/api_constant.dart';

class APICallService {
  static Future<List<ProductModel>?> getProduct() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ProductModel> model = productModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      (e.toString());
    }
    return null;
  }
}
