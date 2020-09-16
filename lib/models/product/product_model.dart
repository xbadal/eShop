class ProductModel {
  String id;
  String createdAt;
  String name;
  String image;
  String price;
  int cartQuantity;

  ProductModel({this.id, this.createdAt, this.name, this.image, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    cartQuantity = json['cartQuantity'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['cartQuantity'] = this.cartQuantity;
    return data;
  }
}
