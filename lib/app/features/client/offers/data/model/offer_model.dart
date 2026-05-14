class OfferModel {
  final String id;
  final String imageUrl;
  final String discount;

  const OfferModel({
    required this.id,
    required this.imageUrl,
    required this.discount,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json['id']?.toString() ?? '',
        imageUrl: json['image_url'] as String? ?? '',
        discount: json['discount'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_url': imageUrl,
        'discount': discount,
      };
}
