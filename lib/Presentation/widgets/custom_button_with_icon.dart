import 'package:flutter/material.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPressed;

  const CustomButtonWithIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : SizeConfig.height*0.22,
      height: SizeConfig.height*0.06,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.height*0.019),
        color: ColorManager.lightBlue2,
      ),

      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.height*0.06,
              width: SizeConfig.height*0.06,
              child: Image(
                image: AssetImage(icon),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: SizeConfig.headline3Size,
                fontWeight: FontWeight.bold,
                color: ColorManager.lightBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
