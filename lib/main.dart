import 'package:cors_project/data/cubits/popular_cubit.dart';
import 'package:cors_project/data/cubits/popular_info_cubit/popular_info_cubit.dart';
import 'package:cors_project/presentaion/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/cubits/popular_image_cubit/popular_image_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<PopularCubit>(
      create: (BuildContext context) => PopularCubit(),
    ),
    BlocProvider<PopularInfoCubit>(
      create: (BuildContext context) => PopularInfoCubit(),
    ),
    BlocProvider<PopularImageCubit>(
      create: (BuildContext context) => PopularImageCubit(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
