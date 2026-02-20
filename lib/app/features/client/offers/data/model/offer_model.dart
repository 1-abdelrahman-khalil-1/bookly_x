class OfferModel {
  final String imageUrl;
  final String discount;

  const OfferModel({
    required this.imageUrl,
    required this.discount,
  });
}

final List<OfferModel> offers = const [
  OfferModel(
    imageUrl:
        'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&h=400&fit=crop',
    discount: '40%',
  ),
  OfferModel(
    imageUrl:
        'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?w=800&h=400&fit=crop',
    discount: '40%',
  ),
];
