import 'package:dartz/dartz.dart';
import 'package:poc_one/core/failure.dart';
import 'package:poc_one/features/plp/domain/entities/posts_entity.dart';

import '../../domain/repositories/posts_repository.dart';
import '../datasource/posts_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductDataSource? productDataSource;

  ProductRepositoryImpl([ProductDataSource? productDataSource]) {
    this.productDataSource = productDataSource ?? ProductDataSourceImpl();
  }

  @override
  Future<Either<Failure, List<PostsEntity>>> getAllProducts() async {
    try {
      final productsData = await productDataSource!.getAllProducts();
      final List<PostsEntity> remoteProductEntity = List.from(
          productsData.map((e) => postsEntity(
              e.userId,
              e.id,
              e.title,
              e.body,
              )));

      return Right(remoteProductEntity);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  PostsEntity postsEntity(
    int userId,
    int id,
    String title,
    String body,

  ) {
    return PostsEntity(
      userId: userId,
      id: id,
      title: title,
      body: body,

    );
  }
}
