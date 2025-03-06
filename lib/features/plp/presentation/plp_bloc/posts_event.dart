part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();
}

class InitialfetchEvent extends PostsEvent {
  const InitialfetchEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
