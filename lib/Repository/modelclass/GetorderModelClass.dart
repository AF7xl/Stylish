class GetorderModelClass {
  GetorderModelClass({
      this.id, 
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
      this.v,});

  GetorderModelClass.fromJson(dynamic json) {
    id = json['_id'];
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
    v = json['__v'];
  }
  String? id;
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
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
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
    map['__v'] = v;
    return map;
  }
  static List<GetorderModelClass> listFromJson(List<dynamic> json) {
    return json == null
     ? []
    : json.map((value) => GetorderModelClass.fromJson(value)).toList();
    }

}