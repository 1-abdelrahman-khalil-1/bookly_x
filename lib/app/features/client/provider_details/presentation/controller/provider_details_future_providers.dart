import 'package:bookly_x/app/features/client/provider_details/data/models/available_service_model.dart';
import 'package:bookly_x/app/features/client/provider_details/data/models/provider_detail_model.dart';
import 'package:bookly_x/app/features/client/provider_details/data/models/review_model.dart';
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
    name: 'Grooming & Hair Styling',
    serviceCategory: 'Barber',
    coverImageUrl:
        'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?q=80&w=1170',
    galleryUrls: [
      'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?w=200',
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
      'https://images.unsplash.com/photo-1560869713-7d0a29430803?w=200',
    ],
    description:
        'Samer\'s Grooming Studio specializes in luxury styling and advanced '
        'hair treatments. Offering precision haircuts, scalp therapy, hair '
        'keratin, and more in a relaxing boutique atmosphere.',
    rating: 4.7,
    reviewCount: 210,
    sellerName: 'Samer\'s Grooming Studio',
    ownerName: 'Samer Youssef',
    sellerAvatarUrl:
        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=100',
    isVerified: false,
    totalPrice: 0,
    currency: 'EG',
    services: [
      AvailableServiceModel(
        id: 's4',
        name: 'Precision Haircut',
        imageUrl:
            'https://images.unsplash.com/photo-1605497788044-5a32c7078486?w=200',
      ),
      AvailableServiceModel(
        id: 's5',
        name: 'Hair Keratin',
        imageUrl:
            'https://images.unsplash.com/photo-1560869713-7d0a29430803?w=200',
      ),
    ],
    reviews: [
      ReviewModel(
        id: 'r3',
        reviewerName: 'Larry',
        avatarUrl:
            'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100',
        rating: 5.0,
        comment: 'Amazing haircut! Samer is super talented and professional.',
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
