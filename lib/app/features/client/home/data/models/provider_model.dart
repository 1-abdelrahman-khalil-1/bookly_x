import 'package:bookly_x_client/app/features/client/home/data/models/category_model.dart';

class ProviderModel {
  final String name;
  final String image;
  final String description;
  final String rating;
  final String earned;
  final String rate;
  final bool verified;
  final CategoryModel category;

  const ProviderModel({
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
    required this.earned,
    required this.rate,
    required this.verified,
    required this.category,
  });
}

final List<ProviderModel> providers = const [
  ProviderModel(
    name: 'Ahmed Hassan',
    image:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop',
    description:
        'Professional spa therapist specialized in\ndeep tissue and relaxation massage.',
    rating: '4.8',
    earned: '\$45k+',
    rate: '\$50/hr',
    verified: true,
    category: CategoryModel(name: 'SPA', image: '', id: '1'),
  ),
  ProviderModel(
    name: 'Omar Khalil',
    image:
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400&h=600&fit=crop',
    description:
        'Expert barber with 10+ years experience in\nmodern cuts and traditional grooming.',
    rating: '4.9',
    earned: '\$52k+',
    rate: '\$45/hr',
    verified: true,
    category: CategoryModel(name: 'Barber', image: '', id: '2'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
  ProviderModel(
    name: 'Dr. Mahmoud Ali',
    image:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
    description:
        'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
    rating: '5.0',
    earned: '\$80k+',
    rate: '\$120/hr',
    verified: true,
    category: CategoryModel(name: 'Clinic', image: '', id: '3'),
  ),
];
