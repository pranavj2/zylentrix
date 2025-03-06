import 'package:network_package/network_package.dart';

import '../model/posts_model.dart';

abstract class ProductDataSource {
  Future<List<PostsModel>> getAllProducts();
}

class ProductDataSourceImpl extends ProductDataSource {
  NetworkPackage networkPackage = NetworkPackage();
  @override
  Future<List<PostsModel>> getAllProducts() async {
    return networkPackage.fetchProducts();
  }
}
