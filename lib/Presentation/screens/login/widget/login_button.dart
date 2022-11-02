import 'package:flutter/material.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const LoginButton({
    required this.buttonText,
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      height: SizeConfig.height*0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
        color: ColorManager.blue,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: SizeConfig.headline5Size,
            fontWeight: FontWeight.bold,
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
