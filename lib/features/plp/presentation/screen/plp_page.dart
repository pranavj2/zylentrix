import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_one/features/plp/presentation/plp_bloc/plp_bloc.dart';

import '../widgets/posts_list_tile.dart';

class PlpPage extends StatefulWidget {
  const PlpPage({super.key});

  @override
  State<PlpPage> createState() => _PlpPageState();
}

class _PlpPageState extends State<PlpPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PlpBloc plpBloc = PlpBloc();
    return Scaffold(
      body: BlocBuilder<PlpBloc, PlpState>(
          bloc: plpBloc..add(const InitialfetchEvent()),
          builder: (context, state) {
            switch (state.runtimeType) {
              case ProductFetchSuccessState:
                final successState = state as ProductFetchSuccessState;
                return PostsListTile( successState: successState,);
              case PlpLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return const SizedBox();
            }
          }),
    );
  }
}
