import 'package:bookly_x/app/core/enums/client_category.dart';
import 'package:bookly_x/app/features/client/home/data/models/category_model.dart';
import 'package:bookly_x/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x/app/features/client/offers/data/model/offer_model.dart';

class ClientDashboardModel {
  final List<CategoryModel> categories;
  final List<OfferModel> offers;
  final List<ProviderModel> nearbyBranches;

  const ClientDashboardModel({
    required this.categories,
    required this.offers,
    required this.nearbyBranches,
  });

  factory ClientDashboardModel.fromJson(Map<String, dynamic> json,
      {String? activeCategory}) {
    final data = json['data'] as Map<String, dynamic>? ?? {};

    // Categories list
    final categoriesList = (data['categories'] as List?)?.map((e) {
          try {
            final catEnum = ClientCategory.fromString(e.toString());
            return CategoryModel(
              id: catEnum.apiKey,
              name: catEnum.displayName,
              image: catEnum.imageUrl,
            );
          } catch (_) {
            final val = e.toString();
            return CategoryModel(id: val, name: val, image: '');
          }
        }).toList() ??
        [];

    // Offers list
    final offersList = (data['offers'] as List?)?.map((e) {
          final map = e as Map<String, dynamic>;
          final id = (map['id'] ?? '').toString();
          final discountValue =
              map['discountValue'] ?? map['discount_value'] ?? '';
          final discountType =
              map['discountType'] ?? map['discount_type'] ?? '';

          String discountLabel = discountValue.toString();
          if (discountType == 'PERCENTAGE') {
            discountLabel = '$discountValue%';
          } else if (discountType == 'FIXED') {
            discountLabel = '\$$discountValue';
          }

          return OfferModel(
            id: id,
            imageUrl:
                'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&h=400&fit=crop',
            discount: discountLabel,
          );
        }).toList() ??
        [];

    // Nearby branches list
    final nearbyBranchesList = (data['nearbyBranches'] as List?)?.map((e) {
          final map = e as Map<String, dynamic>;
          final id = (map['id'] ?? '').toString();
          final businessName =
              map['businessName'] ?? map['business_name'] ?? '';
          final logoUrl = map['logoUrl'] ??
              map['logo_url'] ??
              'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&h=400&fit=crop';
          final distance = (map['distance'] as num?)?.toDouble() ?? 0.0;

          final catId = activeCategory ?? 'SPA';
          CategoryModel branchCategory;
          try {
            final catEnum = ClientCategory.fromString(catId);
            branchCategory = CategoryModel(
              id: catEnum.apiKey,
              name: catEnum.displayName,
              image: catEnum.imageUrl,
            );
          } catch (_) {
            branchCategory = CategoryModel(id: catId, name: catId, image: '');
          }

          return ProviderModel(
            id: id,
            name: businessName,
            image: logoUrl,
            description: 'Branch is ${distance.toStringAsFixed(1)} km away',
            rating: '4.8',
            earned: r'$45k+',
            rate: r'$50/hr',
            verified: true,
            category: branchCategory,
          );
        }).toList() ??
        [];

    return ClientDashboardModel(
      categories: categoriesList,
      offers: offersList,
      nearbyBranches: nearbyBranchesList,
    );
  }
}
