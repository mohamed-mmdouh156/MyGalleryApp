import 'package:flutter/cupertino.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/assets_manager.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';

BoxDecoration loginBackgroundDecoration = const BoxDecoration(
  color: ColorManager.white,
  image: DecorationImage(
    image: AssetImage(AssetsManager.loginBackgroundImage),
    fit: BoxFit.fill,
  ),
);


BoxDecoration homeBackgroundDecoration = const BoxDecoration(
  color: ColorManager.white,
  image: DecorationImage(
    image: AssetImage(AssetsManager.homeBackgroundImage),
    fit: BoxFit.fill,
  ),
);

BoxDecoration popUpDecoration= BoxDecoration(
  color: ColorManager.white.withOpacity(0.2),
  borderRadius: BorderRadius.circular(SizeConfig.height*0.03),
);