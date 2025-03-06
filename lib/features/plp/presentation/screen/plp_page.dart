import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_one/features/plp/presentation/plp_bloc/posts_bloc.dart';

import '../widgets/posts_list_tile.dart';

class PlpPage extends StatefulWidget {
  const PlpPage({super.key});

  @override
  State<PlpPage> createState() => _PlpPageState();
}

class _PlpPageState extends State<PlpPage> {
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
