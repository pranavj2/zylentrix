import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/posts_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<PostsEntity>>> getAllProducts();
}
