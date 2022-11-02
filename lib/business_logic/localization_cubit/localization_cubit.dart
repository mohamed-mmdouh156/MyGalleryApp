import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/Data/core/local/cache_helper.dart';
import 'package:my_gallery/business_logic/localization_cubit/localization_states.dart';

class LocalizationCubit extends Cubit<LocalizationStates>{

  LocalizationCubit() : super(InitialState());

  static LocalizationCubit get(context) => BlocProvider.of(context);

  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;

  Future<void> fetchLocalization()async{
    String languageCode = CacheHelper.getData(key: CacheHelper.languageKey).toString();

    if(languageCode == 'null'){
      CacheHelper.saveData(key: CacheHelper.languageKey,value: "en");
      _appLocale = const Locale("en");
      changeLanguage(code: "en");
      debugPrint('default language is english');
      emit(FetchLocalizationState());
    }
    else{
      _appLocale = Locale(languageCode);
      debugPrint('default language is $languageCode');
      emit(FetchLocalizationState());
    }
    emit(FetchLocalizationState());
  }




  Future<void> changeLanguage({required String code})async{
    switch(code){
      case "ar":{
        _appLocale = const Locale("ar");
        CacheHelper.saveData(key: CacheHelper.languageKey,value: "ar");
        debugPrint('App language is Arabic');
        emit(ChangeToArabicState());
      }
      break;
      case "en":{
        _appLocale = const Locale("en");
        CacheHelper.saveData(key: CacheHelper.languageKey,value: "en");
        debugPrint('App language is English');
        emit(ChangeToEnglishState());
      }
      break;
    }
    emit(ChangeLanguageState());
  }



}