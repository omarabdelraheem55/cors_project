import 'package:cors_project/app/app_colors.dart';
import 'package:cors_project/app/app_words.dart';
import 'package:cors_project/data/cubits/popular_cubit.dart';
import 'package:cors_project/data/cubits/popular_info_cubit/popular_info_cubit.dart';
import 'package:cors_project/presentaion/screens/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app_consts.dart';
import '../../data/cubits/popular_image_cubit/popular_image_cubit.dart';

class InfoScreen extends StatefulWidget {
   int id;
   String name;
   InfoScreen({required this.id,super.key,required this.name});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    PopularInfoCubit.get(context).getPopularInfo(id: widget.id);
    PopularImageCubit.get(context).getPopularImage(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularInfoCubit, PopularInfoState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return state is PopularInfoLoading||state is PopularImageLoading?const Center(child: CircularProgressIndicator(),): Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        title:  Text(
        "${AppWords.detailsAbout} ${PopularInfoCubit.get(context).popularInfoModel.name}",
          style: const TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2-40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
              ),
              child: Column(
                children: [
                  Text(PopularInfoCubit.get(context).popularInfoModel.birthday.toString(),style: const TextStyle(color: AppColors.whiteColor,fontSize: 20),),
                  Text(PopularInfoCubit.get(context).popularInfoModel.gender.toString(),style: const TextStyle(color: AppColors.whiteColor,fontSize: 20),),
                  Text(PopularInfoCubit.get(context).popularInfoModel.placeOfBirth.toString(),style: const TextStyle(color: AppColors.whiteColor,fontSize: 20),),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/2-40,
              child: ListView.separated(itemBuilder: (contex,i){
                return InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (builder)=> ImagePreview(
                    path: PopularImageCubit.get(context).popularImageModel.profiles![i].filePath!.toString()
                    ,name: PopularInfoCubit.get(context).popularInfoModel.name.toString(),
                    height: PopularImageCubit.get(context).popularImageModel.profiles![i].height!??100,
                    width: PopularImageCubit.get(context).popularImageModel.profiles![i].width!??100,
                    id: widget.id,
                  )));},
                    child: Image.network(AppConsts.imageBaseUrl+PopularImageCubit.get(context).popularImageModel.profiles![i].filePath!,height: 200,width: 200,));
              }, separatorBuilder: (contex,i){
                return const SizedBox(height: 16,);
              }, itemCount: PopularImageCubit.get(context).popularImageModel.profiles!.length),
            )
          ],
        ),
      ),
    );
  },
);
  }
}
