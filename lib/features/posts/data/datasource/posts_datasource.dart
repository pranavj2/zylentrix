import 'package:network_package/network_package.dart';
import '../model/posts_model.dart';

abstract class PostsDataSource {
  Future<List<PostsModel>> getAllPosts();
}

class PostsDataSourceImpl extends PostsDataSource {
  NetworkPackage networkPackage = NetworkPackage();
  @override
  Future<List<PostsModel>> getAllPosts() async {
    return networkPackage.fetchPosts();
  }
}
