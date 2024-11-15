
import 'package:dio/dio.dart';
import 'package:kitties_app/models/cat.dart';


class CatService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://api.thecatapi.com/v1/",
    headers: {
      "x-api-key":"live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr"
    }));
  
  
  Future<List<Cat>> getCats() async {
    try {
      final response = await _dio.get("breeds");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Cat.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load cats');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}