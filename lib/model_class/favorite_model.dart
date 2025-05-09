class FavouriteBusinessList {
  final String address;
  final String name;
  final String sId;
  final List<dynamic> image;
  final String ratting;

  FavouriteBusinessList({
    required this.address,
    required this.name,
    required this.sId,
    required this.image,
    required this.ratting,
  });

  factory FavouriteBusinessList.fromJson(Map<String, dynamic> json) {
    return FavouriteBusinessList(
      address: json['address'] ?? '',
      name: json['name'] ?? '',
      sId: json['sId'] ?? '',
      image: List<dynamic>.from(json['image'] ?? []),
      ratting: json['ratting'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'name': name,
      'sId': sId,
      'image': image,
      'ratting': ratting,
    };
  }
}
