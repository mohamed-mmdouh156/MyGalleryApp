import 'package:flutter/material.dart';
import 'package:my_gallery/Presentation/screens/gallery_screen/gallery_screen.dart';
import 'package:my_gallery/Presentation/screens/login/login_screen.dart';
import 'package:my_gallery/Presentation/screens/upload_image_screen/upload_image_screen.dart';

class RoutesManager {
  static const String loginRoute = '/login';
  static const String galleryRoute = '/gallery';
  static const String uploadImageRoute = '/uploadImage';
}

class RoutesGenerator {

  static Route<dynamic> getRoutes (RouteSettings settings)
  {
    switch (settings.name)
    {
      case RoutesManager.loginRoute :
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesManager.galleryRoute :
        return MaterialPageRoute(builder: (_) => const GalleryScreen());
      case RoutesManager.uploadImageRoute :
        return MaterialPageRoute(builder: (_) => const UploadImageScreen());
      default :
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute (){
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text(
          'Undefined Route',
        ),
      ),
      body: const Center(
        child: Text(
            'Undefined Route',
        ),
      ),
    ));

  }

}