import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/Data/core/local/cache_helper.dart';
import 'package:my_gallery/Data/core/remote/dio_helper.dart';
import 'package:my_gallery/Data/models/user_model.dart';
import 'package:my_gallery/business_logic/login_cubit/login_state.dart';
import 'package:my_gallery/constants/constants.dart';

class LoginCubit extends Cubit<LoginState>{

  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

  UserModel? userModel;

  Future<void> userLogin()async{
    emit(UserLoginLoadingState());

    await DioHelper.postData(
        url: AppConstants.loginUrl,
        body: {
          "email" : userNameController.toString(),
          "password" : passwordController.toString(),
        },)
        .then((value) {
          userModel = UserModel.fromMap(value.data);

          // save user data in cache storage
          CacheHelper.saveData(key: CacheHelper.userTokenKey, value: userModel!.token.toString());
          CacheHelper.saveData(key: CacheHelper.userNameKey, value: userModel!.user.name.toString());
          CacheHelper.saveData(key: CacheHelper.userEmailKey, value: userModel!.user.email.toString());


          if (kDebugMode) {
            print('User Login success : ${userModel!.user.name}');
          }
          emit(UserLoginSuccessState());
    }).catchError((error){
      if (kDebugMode) {
        print('Error when User Login : ${error.toString()}');
      }
      emit(UserLoginErrorState());
    });
  }


}