import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poc_one/core/execption.dart';
import 'package:poc_one/features/plp/data/model/posts_model.dart';
import 'package:poc_one/core/constants/api_endpoints/urls.dart';

class NetworkPackage {
  http.Client? client;

  NetworkPackage([http.Client? client]) {
    this.client = client ?? http.Client();
  }
  Future<List<PostsModel>> fetchPosts() async {
    String url = Urls.postsUrl;

    final response = await client!.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final product = json.decode(response.body);
      return List<PostsModel>.from(
          product.map((i) => PostsModel.fromJson(i)));
    } else {
      throw ServerException();
    }
  }
}
