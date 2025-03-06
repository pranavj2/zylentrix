import 'package:dartz/dartz.dart';
import 'package:poc_one/core/failure.dart';
import 'package:poc_one/features/plp/domain/entities/posts_entity.dart';

import '../../domain/repositories/posts_repository.dart';
import '../datasource/posts_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  PostsDataSource? productDataSource;

  ProductRepositoryImpl([PostsDataSource? productDataSource]) {
    this.productDataSource = productDataSource ?? PostsDataSourceImpl();
  }

  @override
  Future<Either<Failure, List<PostsEntity>>> getAllProducts() async {
    try {
      final productsData = await productDataSource!.getAllPosts();
      final List<PostsEntity> remotePostsEntity = List.from(
          productsData.map((e) => postsEntity(
              e.userId,
              e.id,
              e.title,
              e.body,
              )));

      return Right(remotePostsEntity);
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
