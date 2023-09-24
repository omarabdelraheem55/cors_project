import 'dart:developer';
import 'package:cors_project/app/app_colors.dart';
import 'package:cors_project/app/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../../data/cubits/popular_cubit.dart';
import '../../data/cubits/popular_image_cubit/popular_image_cubit.dart';

class ImagePreview extends StatefulWidget {
  final int id;
  final String name;
  final String path;
  final num height, width;
  const ImagePreview({
    super.key,
    required this.id,
    required this.path,
    required this.name,
    required this.height,
    required this.width,
  });

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  void initState() {
    PopularCubit.get(context).getPopular();
    PopularImageCubit.get(context).getPopularImage(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularCubit, PopularState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state is PopularLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.mainColor,
                  iconTheme: const IconThemeData(
                    color: AppColors.whiteColor,
                  ),
                  actions: [
                    InkWell(
                      onTap: () async {
                       try{
                         log("Url msg${AppConsts.imageBaseUrl + widget.path}");
                         await GallerySaver.saveImage(
                             albumName: "Cors Image",
                             AppConsts.imageBaseUrl + widget.path)
                             .then((success) {
                               if (success!=null){
                                 log("Image Saved..");
                                 // showDialog(context: (context), builder: (contex){
                                 //   return Container(child: Text("Image Saved"),);
                                 // });
                               }
                         });
                       }
                           catch(e){
                         log("this is error:$e");
                           }
                      },
                      child: const Icon(
                        Icons.download,
                        color: AppColors.whiteColor,
                      ),
                    )
                  ],
                ),
                body: state == PopularLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        AppConsts.imageBaseUrl + widget.path,
                        width: widget.width.toDouble(),
                        height: widget.height.toDouble(),
                      ),
                    ),
              );
      },
    );
  }
}
