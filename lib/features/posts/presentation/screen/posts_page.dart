import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../posts_bloc/posts_bloc.dart';
import '../widgets/posts_list_tile.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  TextEditingController textEditingController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PostsBloc plpBloc = PostsBloc();
    return Scaffold(
      body: BlocBuilder<PostsBloc, PostsState>(
          bloc: plpBloc..add(const InitialfetchEvent()),
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostsFetchSuccessState:
                final successState = state as PostsFetchSuccessState;
                return PostsListTile( successState: successState,);
              case PostsLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return const Text("api failed please try again later");
            }
          }),
    );
  }
}
