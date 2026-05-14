import 'staff_branch_category_enum.dart';

class Branch {
  final int id;
  final String businessName;
  final StaffBranchCategory category;

  const Branch({
    required this.id,
    required this.businessName,
    required this.category,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: (json['id'] as num?)?.toInt() ?? 0,
        businessName: json['business_name']?.toString() ?? '',
        category: StaffBranchCategory.fromString(json['category']?.toString()),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'business_name': businessName,
        'category': category.name,
      };
}
