part of 'plp_bloc.dart';

@immutable
sealed class PlpState {
  const PlpState();
}

class PlpLoading extends PlpState {
  const PlpLoading();
}

final class PlpInitial extends PlpState {
  const PlpInitial();
}

final class ProductFetchSuccessState extends PlpState {
  final List<PostsEntity> productList;
  ProductFetchSuccessState({required this.productList});
}

class ProductsLoadingFailure extends PlpState {
  ProductsLoadingFailure();
  @override
  List<Object> get props => [];
}
