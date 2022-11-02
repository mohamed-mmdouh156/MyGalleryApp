import 'package:flutter/material.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';

class LoginTextFormField extends StatelessWidget {
  final String hintText;
  bool isPass ;
  TextEditingController controller = TextEditingController();

  LoginTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(SizeConfig.height*0.05),
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: SizeConfig.headline6Size,
          color: ColorManager.grey,
        ),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: SizeConfig.headline6Size,
              color: ColorManager.grey,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: SizeConfig.height*0.01,
              horizontal: SizeConfig.height*0.02,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
        ),
        controller: controller,
        obscureText: isPass,
        validator: (value){
          if(value!.isEmpty){
            return 'this field must not be Empty';
          }
          return null;
        },
      ),
    );
  }
}
