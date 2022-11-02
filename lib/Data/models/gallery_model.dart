class GalleryModel {
  GalleryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  final String status;
  final Data data;
  final String message;

  factory GalleryModel.fromMap(Map<String, dynamic> json) => GalleryModel(
    status: json["status"],
    data: Data.fromMap(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": data.toMap(),
    "message": message,
  };
}

class Data {
  Data({
    required this.images,
  });

  final List<String> images;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
