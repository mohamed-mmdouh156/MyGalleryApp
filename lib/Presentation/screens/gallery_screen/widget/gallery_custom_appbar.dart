import 'package:flutter/material.dart';
import 'package:my_gallery/Data/core/local/cache_helper.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/assets_manager.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';

class GalleryCustomAppbar extends StatelessWidget {
  const GalleryCustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.height*0.03,
        vertical: SizeConfig.height*0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // welcome text and user name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // welcome text
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: SizeConfig.headline3Size,
                  color: ColorManager.lightBlack,
                  fontWeight: FontWeight.w300,
                ),
              ),

              // user name
              Text(
                CacheHelper.getData(key: CacheHelper.userNameKey)== null ?'UserName' : CacheHelper.getData(key: CacheHelper.userNameKey).toString(),
                style: TextStyle(
                  fontSize: SizeConfig.headline2Size,
                  color: ColorManager.lightBlack,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),

          // user image
          CircleAvatar(
            backgroundImage: const AssetImage(AssetsManager.userImage),
            radius: SizeConfig.height*0.025,
          ),
        ],
      ),
    );
  }
}
