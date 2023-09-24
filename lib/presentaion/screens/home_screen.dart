import 'package:cors_project/app/app_colors.dart';
import 'package:cors_project/app/app_words.dart';
import 'package:cors_project/data/cubits/popular_cubit.dart';
import 'package:cors_project/data/cubits/popular_image_cubit/popular_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../componant/home_screen_card.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PopularCubit.get(context).getPopular();
    super.initState();
  }

  @override
  int? id;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppWords.PopularList,
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is PopularLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: ListView.separated(
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => InfoScreen(
                                        name: PopularCubit.get(context)
                                                .PopularList[i]
                                                .name ??
                                            "",
                                        id: int.parse(PopularCubit.get(context)
                                            .PopularList[i]
                                            .id
                                            .toString()),
                                      )),
                            );
                          },
                          child: HomeScreenCard(
                            name:
                                PopularCubit.get(context).PopularList[i].name!,
                          ),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                      itemCount: PopularCubit.get(context).PopularList.length),
                );
        },
      ),
    );
  }
}
