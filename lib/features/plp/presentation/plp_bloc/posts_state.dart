part of 'plp_bloc.dart';

@immutable
sealed class PostsState {
  const PostsState();
}

class PostsLoading extends PostsState {
  const PostsLoading();
}

final class PostsInitial extends PostsState {
  const PostsInitial();
}

final class PostsFetchSuccessState extends PostsState {
  final List<PostsEntity> productList;
  PostsFetchSuccessState({required this.productList});
}

class PostsLoadingFailure extends PostsState {
  PostsLoadingFailure();
  @override
  List<Object> get props => [];
}
