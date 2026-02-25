class ReviewModel {
  final String id;
  final String reviewerName;
  final String avatarUrl;
  final double rating;
  final String comment;

  const ReviewModel({
    required this.id,
    required this.reviewerName,
    required this.avatarUrl,
    required this.rating,
    required this.comment,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json['id']?.toString() ?? '',
        reviewerName: json['reviewerName'] as String? ?? '',
        avatarUrl: json['avatarUrl'] as String? ?? '',
        rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
        comment: json['comment'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'reviewerName': reviewerName,
        'avatarUrl': avatarUrl,
        'rating': rating,
        'comment': comment,
      };
}
