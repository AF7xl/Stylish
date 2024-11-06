class ReviewModelClass {
  ReviewModelClass({
    this.id,
    this.buyerId,
    this.email,
    this.fullName,
    this.productId,
    this.rating,
    this.review,
    this.v,
  });

  ReviewModelClass.fromJson(dynamic json) {
    id = json['_id'];
    buyerId = json['buyerId'];
    email = json['email'];
    fullName = json['fullName'];
    productId = json['productId'];
    rating = json['rating'];
    review = json['review'];
    v = json['__v'];
  }

  String? id;
  String? buyerId;
  String? email;
  String? fullName;
  String? productId;
  double? rating;
  String? review;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['buyerId'] = buyerId;
    map['email'] = email;
    map['fullName'] = fullName;
    map['productId'] = productId;
    map['rating'] = rating;
    map['review'] = review;
    map['__v'] = v;
    return map;
  }

  static List<ReviewModelClass> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json
            .map((value) => ReviewModelClass.fromJson(value))
            .toList();
  }
}
