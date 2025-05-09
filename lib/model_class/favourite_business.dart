class FavouriteBusinessList {
  String? name;
  String? address;
  List<int>? image;
  String? sId;
  String? ratting;

  FavouriteBusinessList({
    this.name,
    this.address,
    this.image,
    this.sId,
    this.ratting,
  });

  FavouriteBusinessList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    image = json['image'].cast<int>();
    sId = json['_id'];
    ratting = json['ratting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['image'] = this.image;
    data['_id'] = this.sId;
    data['ratting'] = this.ratting;
    return data;
  }
}
