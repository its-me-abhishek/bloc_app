//app_model.dart
class ImageModel {
    int fileSizeBytes;
    String url;

    ImageModel({
        required this.fileSizeBytes,
        required this.url,
    });

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        fileSizeBytes: json["fileSizeBytes"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "fileSizeBytes": fileSizeBytes,
        "url": url,
    };
}
