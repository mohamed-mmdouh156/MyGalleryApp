import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/Presentation/screens/login/widget/login_screen_card.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';
import 'package:my_gallery/Presentation/widgets/decorations.dart';
import 'package:my_gallery/business_logic/login_cubit/login_cubit.dart';
import 'package:my_gallery/business_logic/login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context, state){},
      builder: (context, state){
        return Container(
          decoration: loginBackgroundDecoration,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SizedBox(
                height: SizeConfig.height,
                width: SizeConfig.width,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.height*0.08,
                  ),


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // my gallery text
                      Text(
                        'My \nGallery',
                        style: TextStyle(
                          fontSize: SizeConfig.headline1Size,
                          color: ColorManager.lightBlack,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: SizeConfig.height*0.045,
                      ),


                      // login card
                      const LoginScreenCard(),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
