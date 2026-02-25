import 'package:bookly_x_client/app/features/client/home/data/models/category_model.dart';
import 'package:bookly_x_client/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x_client/app/features/client/offers/data/model/offer_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------------------------------------------------------------------
// Mock data – mirrors what the API would return
// ---------------------------------------------------------------------------
const _mockOffers = [
  OfferModel(
    id: 'o1',
    imageUrl:
        'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&h=400&fit=crop',
    discount: '40%',
  ),
  OfferModel(
    id: 'o2',
    imageUrl:
        'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?w=800&h=400&fit=crop',
    discount: '25%',
  ),
];

const _mockProviders = [
  ProviderModel(
    id: 'p1',
    name: 'Ahmed Hassan',
    image:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop',
    description:
        'Professional spa therapist specialized in\ndeep tissue and relaxation massage.',
    rating: '4.8',
    earned: r'$45k+',
    rate: r'$50/hr',
    verified: true,
    category: CategoryModel(id: '1', name: 'SPA', image: ''),
  ),
  ProviderModel(
    id: 'p2',
    name: 'Sara Youssef',
    image:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&h=600&fit=crop',
    description:
        'Certified nail technician and beauty specialist\nwith 8 years of experience.',
    rating: '4.7',
    earned: r'$30k+',
    rate: r'$35/hr',
    verified: false,
    category: CategoryModel(id: '1', name: 'SPA', image: ''),
  ),
  ProviderModel(
    id: 'p3',
    name: 'Omar Khalil',
    image:
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400&h=600&fit=crop',
    description:
        'Expert barber with 10+ years experience in\nmodern cuts and traditional grooming.',
    rating: '4.9',
    earned: r'$52k+',
    rate: r'$45/hr',
    verified: true,
    category: CategoryModel(id: '2', name: 'Barber', image: ''),
  ),
  ProviderModel(
    id: 'p4',
    name: 'Khaled Nasser',
    image:
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=400&h=600&fit=crop',
    description:
        'Traditional barber specializing in fades,\nbeards, and hot towel shaves.',
    rating: '4.6',
    earned: r'$28k+',
    rate: r'$40/hr',
    verified: true,
    category: CategoryModel(id: '2', name: 'Barber', image: ''),
  ),
  ProviderModel(
    id: 'p5',
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: r'$80k+',
    rate: r'$120/hr',
    verified: true,
    category: CategoryModel(id: '3', name: 'Clinic', image: ''),
  ),
  ProviderModel(
    id: 'p5',
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: r'$80k+',
    rate: r'$120/hr',
    verified: true,
    category: CategoryModel(id: '3', name: 'Clinic', image: ''),
  ),
  ProviderModel(
    id: 'p5',
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: r'$80k+',
    rate: r'$120/hr',
    verified: true,
    category: CategoryModel(id: '3', name: 'Clinic', image: ''),
  ),
  ProviderModel(
    id: 'p5',
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: r'$80k+',
    rate: r'$120/hr',
    verified: true,
    category: CategoryModel(id: '3', name: 'Clinic', image: ''),
  ),
  ProviderModel(
    id: 'p5',
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: r'$80k+',
    rate: r'$120/hr',
    verified: true,
    category: CategoryModel(id: '3', name: 'Clinic', image: ''),
  ),
  ProviderModel(
    id: 'p5',
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: r'$80k+',
    rate: r'$120/hr',
    verified: true,
    category: CategoryModel(id: '3', name: 'Clinic', image: ''),
  ),
  ProviderModel(
    id: 'p6',
    name: 'Dr. Nadia Hassan',
    image:
        'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=400&h=600&fit=crop',
    description:
        'General physician with a focus on\npreventive care and wellness programs.',
    rating: '4.8',
    earned: r'$65k+',
    rate: r'$90/hr',
    verified: true,
    category: CategoryModel(id: '3', name: 'Clinic', image: ''),
  ),
];

// ---------------------------------------------------------------------------
// Selected category – simple mutable state; defaults to the first category id
// ---------------------------------------------------------------------------
final selectedCategoryProvider = StateProvider<String>((ref) => '1');

// ---------------------------------------------------------------------------
// Offers – FutureProvider (re-fetch by invalidating the provider)
// ---------------------------------------------------------------------------
final offersFutureProvider = FutureProvider<List<OfferModel>>((ref) async {
  // TODO: replace with real repo call
  await Future.delayed(const Duration(seconds: 1));
  return _mockOffers;
});

// ---------------------------------------------------------------------------
// Providers list – depends on selected category; uses .family for filtering
// ---------------------------------------------------------------------------
final providersFutureProvider =
    FutureProvider.family<List<ProviderModel>, String>(
  (ref, categoryId) async {
    // TODO: replace with real repo call
    await Future.delayed(const Duration(seconds: 1));
    return _mockProviders.where((p) => p.category.id == categoryId).toList();
  },
);
