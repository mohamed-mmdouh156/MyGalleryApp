import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/Presentation/resources/app_size_config.dart';
import 'package:my_gallery/Presentation/resources/color_manager.dart';
import 'package:my_gallery/Presentation/resources/route_manager.dart';
import 'package:my_gallery/Presentation/widgets/custom_toast.dart';
import 'package:my_gallery/business_logic/login_cubit/login_cubit.dart';
import 'package:my_gallery/business_logic/login_cubit/login_state.dart';
import 'login_button.dart';
import 'login_text_formfield.dart';

class LoginScreenCard extends StatelessWidget {
  const LoginScreenCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context, state){},
      builder: (context, state){
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              height: SizeConfig.height*0.46,
              width:  SizeConfig.height*0.37,
              decoration: BoxDecoration(
                color: ColorManager.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(SizeConfig.height*0.03),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  SizeConfig.height*0.03,
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // login text
                    Text(
                      'LOG IN',
                      style: TextStyle(
                        fontSize: SizeConfig.headline3Size,
                        color: ColorManager.lightBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // user name text formField
                    LoginTextFormField(
                        hintText: 'User Name',
                        controller: LoginCubit.get(context).userNameController,
                    ),


                    // password text formField
                    LoginTextFormField(
                      hintText: 'Password',
                      controller: LoginCubit.get(context).passwordController,
                      isPass: true,
                    ),


                    // submit button
                    state is UserLoginLoadingState? const Center(
                      child: CircularProgressIndicator(),
                    ) :LoginButton(
                      buttonText: 'SUBMIT',
                      onPressed: ()=>LoginCubit.get(context).userLogin().then((value){
                        if(state is UserLoginSuccessState){
                          customToast(
                            title: 'Login Success',
                            color: ColorManager.blue,
                          );
                          Navigator.pushReplacementNamed(context, RoutesManager.galleryRoute);
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
