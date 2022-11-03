import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/Data/core/remote/dio_helper.dart';
import 'package:my_gallery/Data/models/gallery_model.dart';
import 'package:my_gallery/business_logic/app_cubit/app_states.dart';
import 'package:my_gallery/constants/constants.dart';


class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  GalleryModel? galleryModel;
  List<String> galleryImages=[];

  // get gallery form Api
  Future<void> getGallery ()async {
    emit(GetGalleryLoadingState());

    await DioHelper.getData(
        url: AppConstants.getGalleryUrl,
    ).then((value) {

      galleryModel = GalleryModel.fromMap(value.data);

      for (var element in galleryModel!.data.images) {
        final result = element.split('/');
        galleryImages.add(result.last);
      }

      if (kDebugMode) {
        print('get gallery success : ${galleryModel!.data.images.toString()}');
      }
      emit(GetGallerySuccessState());
    }).catchError((error){
      if (kDebugMode) {
        print('Error when get gallery : ${error.toString()}');
      }
      emit(GetGalleryErrorState());
    });
  }



  File? uploadedImage;
  var imagePicker = ImagePicker();

  // get image form my gallery
  Future <void> getImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      uploadedImage = File(pickedFile.path);
      emit(GetImageSuccessState());
    } else {
      if (kDebugMode) {
        print('No Image selected.');
      }
      emit(GetImageErrorState());
    }
  }




  // get image form camera direct
  Future <void> getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      uploadedImage = File(pickedFile.path);
      emit(GetImageSuccessState());
    } else {
      if (kDebugMode) {
        print('No Image selected.');
      }
      emit(GetImageErrorState());
    }
  }





  Future<void> uploadImageToGallery ()async {
    emit(UploadImageGalleryLoadingState());

    FormData formData = FormData.fromMap({
      "img":
      await MultipartFile.fromFile(uploadedImage!.path, filename:uploadedImage!.path.toString()),
    });

    await DioHelper.postImage(
      url: AppConstants.getGalleryUrl,
      body: formData,
    ).then((value) {

      if (kDebugMode) {
        print('Upload image to gallery success');
      }

      emit(UploadImageGallerySuccessState());
    }).catchError((error){
      if (kDebugMode) {
        print('Error when Upload image gallery : ${error.toString()}');
      }
      emit(UploadImageGalleryErrorState());
    });
  }






}