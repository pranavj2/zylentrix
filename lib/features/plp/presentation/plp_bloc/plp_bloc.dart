import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/execption.dart';
import '../../data/repositories/posts_repository_impl.dart';
import '../../domain/entities/posts_entity.dart';
import '../../domain/repositories/posts_repository.dart';

part 'plp_event.dart';
part 'plp_state.dart';

class PlpBloc extends Bloc<PlpEvent, PlpState> {
  ProductRepository? productRepository;
  PlpBloc([ProductRepository? productRepository]) : super(const PlpInitial()) {
    this.productRepository = productRepository ?? ProductRepositoryImpl();
    on<InitialfetchEvent>(initialfetchEvent);
  }
  FutureOr<void> initialfetchEvent(
      InitialfetchEvent event, Emitter<PlpState> emit) async {
    emit(PlpLoading());
    try {
      var productsResponse = await productRepository!.getAllProducts();

      productsResponse.fold((failure) => emit(ProductsLoadingFailure()),
          (productList) {
        emit(ProductFetchSuccessState(productList: productList));
      });
    } catch (e) {
      throw ServerException();
    }
  }
}
