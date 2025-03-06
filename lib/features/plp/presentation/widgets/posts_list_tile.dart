

import 'package:flutter/material.dart';

import 'package:poc_one/features/plp/presentation/plp_bloc/posts_bloc.dart';


class PostsListTile extends StatelessWidget {
  final PostsFetchSuccessState successState;
   const PostsListTile({super.key, required this.successState});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.05),
                  itemCount: successState.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        successState.productList[index].title,

                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      leading: Text("${successState.productList[index].id}", style: TextStyle(color: Colors.black),),
                      selected: true,
                      subtitle: Text(successState.productList[index].body, style: TextStyle(color: Colors.grey),),
                    );
                  }),
            ),

          ],
        );
      },
    );
  }
}
