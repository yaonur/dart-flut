import 'package:dio/dio.dart';
import 'package:creativebracket/store/store.dart';

class StoreRepository{
  final Dio _client =Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  Future<List<Product>> getProducts() async{
    final Response response = await _client.get('products');
    final List<dynamic> json = response.data as List<dynamic>;
    return json.map((dynamic json) => Product(
      id:json['id'] as int,
      title:json['title'] as String,
      image:json['image'] as String,
    )).toList();
  }
}