import 'package:http/http.dart' as http;

class APIServices {
  static String url = "http://10.0.2.2:53285/api/Products";

  static Future fetchProducts() async {
    return await http.get(url);
  }
}
