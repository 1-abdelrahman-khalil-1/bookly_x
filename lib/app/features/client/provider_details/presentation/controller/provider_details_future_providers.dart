import 'package:bookly_x_client/app/features/client/provider_details/data/models/available_service_model.dart';
import 'package:bookly_x_client/app/features/client/provider_details/data/models/provider_detail_model.dart';
import 'package:bookly_x_client/app/features/client/provider_details/data/models/review_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------------------------------------------------------------------
// Mock data – mirrors what the API would return per provider id
// ---------------------------------------------------------------------------
final _mockProviderDetails = <String, ProviderDetailModel>{
  'p1': const ProviderDetailModel(
    id: 'p1',
    name: 'Oil Massage',
    serviceCategory: 'Service info',
    coverImageUrl:
        'https://plus.unsplash.com/premium_photo-1670574873484-bf0923c33a24?q=80&w=1170',
    galleryUrls: [
      'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?w=200',
      'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=200',
      'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?w=200',
      'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=200',
    ],
    description:
        'The Spa at Four Seasons Hotel Cairo at Nile Plaza offers authentic '
        'Balinese massage, facial treatments, Hammam experiences, beauty '
        'packages and much more in a serene, luxurious environment.',
    rating: 4.8,
    reviewCount: 400,
    sellerName: 'Spa Center',
    ownerName: 'Ahmed Mahmed',
    sellerAvatarUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
    isVerified: true,
    totalPrice: 0,
    currency: 'EG',
    services: [
      AvailableServiceModel(
        id: 's1',
        name: 'Massage',
        imageUrl:
            'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=200',
      ),
      AvailableServiceModel(
        id: 's2',
        name: 'Facial',
        imageUrl:
            'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=200',
      ),
      AvailableServiceModel(
        id: 's3',
        name: 'Hammam',
        imageUrl:
            'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?w=200',
      ),
    ],
    reviews: [
      ReviewModel(
        id: 'r1',
        reviewerName: 'Mr. Jack',
        avatarUrl:
            'https://images.unsplash.com/photo-1552058544-f2b08422138a?w=100',
        rating: 5.0,
        comment:
            'The rental car was clean, reliable, and the service was quick and efficient.',
      ),
      ReviewModel(
        id: 'r2',
        reviewerName: 'Robert',
        avatarUrl:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
        rating: 5.0,
        comment:
            'The rental car was clean, reliable, and the service was quick and efficient.',
      ),
    ],
  ),
  'p2': const ProviderDetailModel(
    id: 'p2',
    name: 'Hair & Nail Care',
    serviceCategory: 'Beauty',
    coverImageUrl:
        'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?q=80&w=1170',
    galleryUrls: [
      'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?w=200',
      'https://images.unsplash.com/photo-1487412947147-5cebf100ffc2?w=200',
      'https://images.unsplash.com/photo-1560869713-7d0a29430803?w=200',
    ],
    description:
        'Sara\'s Beauty Studio specializes in luxury nail art and advanced '
        'hair treatments. Offering gel nails, acrylic extensions, keratin '
        'therapy, and more in a relaxing boutique atmosphere.',
    rating: 4.7,
    reviewCount: 210,
    sellerName: 'Sara\'s Beauty Studio',
    ownerName: 'Sara Youssef',
    sellerAvatarUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
    isVerified: false,
    totalPrice: 0,
    currency: 'EG',
    services: [
      AvailableServiceModel(
        id: 's4',
        name: 'Gel Nails',
        imageUrl:
            'https://images.unsplash.com/photo-1604654894610-df63bc536371?w=200',
      ),
      AvailableServiceModel(
        id: 's5',
        name: 'Keratin',
        imageUrl:
            'https://images.unsplash.com/photo-1560869713-7d0a29430803?w=200',
      ),
    ],
    reviews: [
      ReviewModel(
        id: 'r3',
        reviewerName: 'Laura',
        avatarUrl:
            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100',
        rating: 5.0,
        comment: 'Amazing nail art! Sara is super talented and professional.',
      ),
    ],
  ),
};

// ---------------------------------------------------------------------------
// Riverpod provider — family so any providerId can be fetched independently
// ---------------------------------------------------------------------------
final providerDetailProvider =
    FutureProvider.family<ProviderDetailModel, String>(
  (ref, providerId) async {
    // TODO: replace with real repo call
    // e.g. return ref.read(providerDetailRepoProvider).getDetail(providerId);
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockProviderDetails[providerId] ??
        _mockProviderDetails.values.first;
  },
);
