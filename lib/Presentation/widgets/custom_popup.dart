import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/widgets/custom_button_with_icon.dart';
import 'package:my_gallery/Presentation/widgets/decorations.dart';

class CustomPopUpWidget extends StatelessWidget {
  final String oneButtonName;
  final String oneButtonIcon;
  final String twoButtonName;
  final String twoButtonIcon;
  final void Function() oneOnTap;
  final void Function() twoOnTap;


  const CustomPopUpWidget({
    Key? key,
    required this.oneButtonName,
    required this.twoButtonName,
    required this.oneOnTap,
    required this.twoOnTap,
    required this.oneButtonIcon,
    required this.twoButtonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.height * 0.35,bottom:SizeConfig.height * 0.35,),
      child: Align(
        alignment: Alignment.center,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              height: SizeConfig.height*0.3,
              width:  SizeConfig.height*0.4,
              decoration: popUpDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CustomButtonWithIcon(
                    onPressed: oneOnTap,
                    text: oneButtonName,
                    icon: oneButtonIcon,
                  ),
                  SizedBox(
                    height:SizeConfig.height * 0.04 ,
                  ),
                  CustomButtonWithIcon(
                    onPressed: twoOnTap,
                    text: twoButtonName,
                    icon: twoButtonIcon,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



