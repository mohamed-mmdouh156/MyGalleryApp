import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/Presentation/screens/gallery_screen/widget/gallery_button_with_icon.dart';
import 'package:my_gallery/Presentation/screens/gallery_screen/widget/grid_image_widget.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/assets_manager.dart';
import 'package:my_gallery/Presentation/resources/route_manager.dart';
import 'package:my_gallery/Presentation/widgets/custom_popup.dart';
import 'package:my_gallery/Presentation/widgets/decorations.dart';
import 'package:my_gallery/business_logic/app_cubit/app_cubit.dart';
import 'package:my_gallery/business_logic/app_cubit/app_states.dart';

import 'widget/gallery_custom_appbar.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){},
      builder: (context, state){
        return Container(
          decoration: homeBackgroundDecoration,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.topPadding,
              ),
              child: Column(
                children: [

                  // screen custom appbar
                  const GalleryCustomAppbar(),
                  SizedBox(
                    height: SizeConfig.height*0.03,
                  ),

                  // Log out button  and  upload button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [

                      // log out button
                      GalleryButtonWithIcon(
                        text: 'log out',
                        iconBackground: AssetsManager.redBackIconImage,
                        icon: AssetsManager.leftArrowImage,
                        onPressed: ()=>Navigator.pushReplacementNamed(context, RoutesManager.loginRoute),
                      ),

                      // upload button
                      GalleryButtonWithIcon(
                        text: 'upload',
                        iconBackground: AssetsManager.greenBackIconImage,
                        icon: AssetsManager.topArrowImage,
                        onPressed: (){
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return WillPopScope(
                                onWillPop: ()async{
                                  return true;
                                },
                                child: CustomPopUpWidget(
                                  oneButtonName:'Gallery',
                                  oneButtonIcon: AssetsManager.galleryImage,
                                  oneOnTap:(){
                                    AppCubit.get(context).getImageFromGallery().then((value) {
                                      Navigator.pushNamed(context, RoutesManager.uploadImageRoute);
                                    });
                                  } ,
                                  twoButtonName: 'Camera',
                                  twoButtonIcon: AssetsManager.cameraImage,
                                  twoOnTap:(){
                                    AppCubit.get(context).getImageFromCamera().then((value) {
                                      Navigator.pushNamed(context, RoutesManager.uploadImageRoute);
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),

                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height*0.01,
                  ),

                  // image grid view
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.height*0.02,
                      ),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index){
                          return GridImageWidget(image: 'https://img.freepik.com/free-photo/courage-man-jump-through-gap-hill-business-concept-idea_1323-262.jpg',);
                        },
                        itemCount: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
