class OrderModelClass {
  OrderModelClass({
      this.fullName, 
      this.email, 
      this.state, 
      this.city, 
      this.locality, 
      this.productName, 
      this.productPrice, 
      this.quantity, 
      this.category, 
      this.image, 
      this.buyerId, 
      this.vendorId, 
      this.processing, 
      this.delivered, 
      this.createdAt, 
      this.id, 
      this.v,});

  OrderModelClass.fromJson(dynamic json) {
    fullName = json['fullName'];
    email = json['email'];
    state = json['state'];
    city = json['city'];
    locality = json['locality'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    quantity = json['quantity'];
    category = json['category'];
    image = json['image'];
    buyerId = json['buyerId'];
    vendorId = json['vendorId'];
    processing = json['processing'];
    delivered = json['delivered'];
    createdAt = json['createdAt'];
    id = json['_id'];
    v = json['__v'];
  }
  String? fullName;
  String? email;
  String? state;
  String? city;
  String? locality;
  String? productName;
  int? productPrice;
  int? quantity;
  String? category;
  String? image;
  String? buyerId;
  String? vendorId;
  bool? processing;
  bool? delivered;
  int? createdAt;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['email'] = email;
    map['state'] = state;
    map['city'] = city;
    map['locality'] = locality;
    map['productName'] = productName;
    map['productPrice'] = productPrice;
    map['quantity'] = quantity;
    map['category'] = category;
    map['image'] = image;
    map['buyerId'] = buyerId;
    map['vendorId'] = vendorId;
    map['processing'] = processing;
    map['delivered'] = delivered;
    map['createdAt'] = createdAt;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}