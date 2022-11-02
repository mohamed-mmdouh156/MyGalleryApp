abstract class AppStates{}

class InitialState extends AppStates{}

class GetGalleryLoadingState extends AppStates{}
class GetGallerySuccessState extends AppStates{}
class GetGalleryErrorState extends AppStates{}

class GetImageSuccessState extends AppStates{}
class GetImageErrorState extends AppStates{}


class UploadImageGalleryLoadingState extends AppStates{}
class UploadImageGallerySuccessState extends AppStates{}
class UploadImageGalleryErrorState extends AppStates{}