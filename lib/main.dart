import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_gallery/Data/core/local/cache_helper.dart';
import 'package:my_gallery/Data/core/remote/dio_helper.dart';
import 'package:my_gallery/Presentation/screens/gallery_screen/gallery_screen.dart';
import 'package:my_gallery/Presentation/screens/login/login_screen.dart';
import 'package:my_gallery/business_logic/app_cubit/app_cubit.dart';
import 'package:my_gallery/business_logic/app_localization.dart';
import 'package:my_gallery/business_logic/localization_cubit/localization_cubit.dart';
import 'package:my_gallery/business_logic/localization_cubit/localization_states.dart';
import 'package:my_gallery/business_logic/login_cubit/login_cubit.dart';

import 'Presentation/resources/route_manager.dart';
import 'Presentation/resources/theme_manager.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  await DioHelper.init();

  String languageCode = CacheHelper.getData(key: CacheHelper.languageKey).toString();
  debugPrint('language code is : $languageCode');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()..getGallery()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => LocalizationCubit()..fetchLocalization()),
      ],

      child: BlocConsumer<LocalizationCubit,LocalizationStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Gallery',
            theme: AppTheme.lightTheme,
            onGenerateRoute: RoutesGenerator.getRoutes,
            initialRoute: RoutesManager.loginRoute,

            /// App localization
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("en",""),
              Locale("ar",""),
            ],
            locale: LocalizationCubit.get(context).appLocal,
            localeResolutionCallback: (currentLang , supportLang){
              if(currentLang != null) {
                for(Locale locale in supportLang){
                  if(locale.languageCode == currentLang.languageCode){
                    return currentLang;
                  }
                }
              }
              return supportLang.first;
            },
          );
        },
      ),
    );
  }
}

