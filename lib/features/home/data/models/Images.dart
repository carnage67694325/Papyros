/// imageId : "67c90a32432c4764161efbaa"
/// image : "e82e9ba9-d7ec-44cd-87ec-b824993a5e92-20240702_141012_Kz2lQ7yUG.jpg"
/// _id : "67c90a32a33dc28744a7b363"
library;

class Images {
  Images({
    this.imageId,
    this.image,
    this.id,
  });

  Images.fromJson(dynamic json) {
    imageId = json['imageId'];
    image = json['image'];
    id = json['_id'];
  }
  String? imageId;
  String? image;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageId'] = imageId;
    map['image'] = image;
    map['_id'] = id;
    return map;
  }
}
