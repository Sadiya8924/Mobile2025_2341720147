import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/pizza_model.dart';

class HttpHelper {
  final String authority = '24y6w.wiremockapi.cloud';
  final String path = 'pizzalist';

  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  Future<bool> deletePizza(int id) async {
    final deletePath = '/$path/$id';
    Uri url = Uri.https(authority, deletePath);
    final http.Response r = await http.delete(url);
    // debug log
    print('DELETE $url -> ${r.statusCode} ${r.body}');
    return r.statusCode == HttpStatus.ok || r.statusCode == HttpStatus.noContent;
  }

  Future<String> putPizza(Pizza pizza) async {
    final putPath = '/$path';
    String put = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, putPath);
    http.Response r = await http.put(url, headers: {'Content-Type': 'application/json'}, body: put);
    print('PUT $url -> ${r.statusCode} ${r.body}');
    return r.body;
  }

  Future<String> postPizza(Pizza pizza) async {
    final postPath = '/$path';
    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, postPath);
    http.Response r = await http.post(url, headers: {'Content-Type': 'application/json'}, body: post);
    print('POST $url -> ${r.statusCode} ${r.body}');
    return r.body;
  }

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);

    final http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);

      List<Pizza> pizzas = jsonResponse
          .map<Pizza>((i) => Pizza.fromJson(i))
          .toList();

      return pizzas;
    } else {
      return [];
    }
  }
}
