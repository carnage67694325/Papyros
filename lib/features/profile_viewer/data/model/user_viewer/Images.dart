class Images {
  String? imageId;
  String? image;
  String? id;

  Images({this.imageId, this.image, this.id});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageId: json['imageId'] as String?,
        image: json['image'] as String?,
        id: json['id'] ?? json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'imageId': imageId,
        'image': image,
        'id': id,
      };
}
