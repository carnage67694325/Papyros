class CoverImages {
  String? frontImage;
  String? frontImageId;
  String? backgroundImage;
  String? backgroundImageId;

  CoverImages({
    this.frontImage,
    this.frontImageId,
    this.backgroundImage,
    this.backgroundImageId,
  });

  factory CoverImages.fromJson(Map<String, dynamic> json) => CoverImages(
        frontImage: json['frontImage'] as String?,
        frontImageId: json['frontImageId'] as String?,
        backgroundImage: json['backgroundImage'] as String?,
        backgroundImageId: json['backgroundImageId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'frontImage': frontImage,
        'frontImageId': frontImageId,
        'backgroundImage': backgroundImage,
        'backgroundImageId': backgroundImageId,
      };
}
