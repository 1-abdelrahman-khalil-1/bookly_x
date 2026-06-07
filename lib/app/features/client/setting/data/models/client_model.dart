class ClientModel {
  final int id;
  final String? profileImageUrl;

  const ClientModel({required this.id, this.profileImageUrl});

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json['id'] as int,
        profileImageUrl: json['profile_image_url'],
      );

  Map<String, dynamic> toJson() =>
      {'id': id, 'profile_image_url': profileImageUrl};
}
