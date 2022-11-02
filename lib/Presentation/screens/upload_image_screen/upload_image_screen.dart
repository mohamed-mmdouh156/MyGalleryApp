import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';
import 'package:my_gallery/Presentation/resources/route_manager.dart';
import 'package:my_gallery/Presentation/screens/gallery_screen/gallery_screen.dart';
import 'package:my_gallery/Presentation/widgets/custom_toast.dart';
import 'package:my_gallery/Presentation/widgets/default_button.dart';
import 'package:my_gallery/business_logic/app_cubit/app_cubit.dart';
import 'package:my_gallery/business_logic/app_cubit/app_states.dart';


class UploadImageScreen extends StatelessWidget {

  const UploadImageScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Upload Image",
              style: TextStyle(
                fontSize: SizeConfig.headline4Size,
                fontWeight: FontWeight.bold,
                color: ColorManager.lightBlue,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical :SizeConfig.height*0.02,
              horizontal :SizeConfig.height*0.03,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                // add task from gallery
                Container(
                  height: SizeConfig.height*0.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: ColorManager.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: ColorManager.white,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: FileImage(AppCubit.get(context).uploadedImage!),
                      fit: BoxFit.fill,
                      height: double.maxFinite,
                      width: double.maxFinite,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height*0.05,
                ),





                // upload button
                state is UploadImageGalleryLoadingState?
                const CircularProgressIndicator(): DefaultButton(
                  text: 'Upload',
                  onPressed: (){
                    AppCubit.get(context).uploadImageToGallery().then((value) {
                      if(state is UploadImageGallerySuccessState){
                        customToast(title: 'image uploaded success', color: ColorManager.lightBlue);
                        Navigator.pushReplacementNamed(context, RoutesManager.galleryRoute);
                      }
                    });
                  },
                  color: ColorManager.lightBlue,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
