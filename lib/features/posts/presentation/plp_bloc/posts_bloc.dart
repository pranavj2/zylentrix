import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/execption.dart';
import '../../data/repositories/posts_repository_impl.dart';
import '../../domain/entities/posts_entity.dart';
import '../../domain/repositories/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  ProductRepository? productRepository;
  PostsBloc([ProductRepository? productRepository]) : super(const PostsInitial()) {
    this.productRepository = productRepository ?? ProductRepositoryImpl();
    on<InitialfetchEvent>(initialfetchEvent);
  }
  FutureOr<void> initialfetchEvent(
      InitialfetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {
      var productsResponse = await productRepository!.getAllProducts();

      productsResponse.fold((failure) => emit(PostsLoadingFailure()),
          (productList) {
        emit(PostsFetchSuccessState(productList: productList));
      });
    } catch (e) {
      throw ServerException();
    }
  }
}
