import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_one/features/plp/presentation/screen/plp_page.dart';

import 'features/plp/presentation/plp_bloc/plp_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//["flower", "flow", "flight"]
  String longestCommonPrefix(List<String> strs) {
    for (int j = 0; j < strs[0].length; j++) {
      for (int i = 0; i < strs.length; i++) {
        if (strs[0][j] != strs[i][j]) {
          return strs[0].substring(0, j);
        }
      }
    }
    return strs[0];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    longestCommonPrefix(["flower", "flow", "flight"]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlpBloc>(
            create: (context) => PlpBloc()..add(const InitialfetchEvent()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PlpPage(),
      ),
    );
  }
}
