import 'package:flutter/material.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';

class GalleryButtonWithIcon extends StatelessWidget {
  final String text;
  final String iconBackground;
  final String icon;
  final VoidCallback onPressed;

  const GalleryButtonWithIcon({
    Key? key,
    required this.text,
    required this.iconBackground,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : SizeConfig.height*0.16,
      height: SizeConfig.height*0.04,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.height*0.019),
        color: ColorManager.white,
      ),

      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: SizeConfig.height*0.03,
              width: SizeConfig.height*0.03,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(iconBackground),
                ),
              ),
              child: Image(
                image: AssetImage(icon),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: SizeConfig.headline4Size,
                fontWeight: FontWeight.w400,
                color: ColorManager.lightBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
