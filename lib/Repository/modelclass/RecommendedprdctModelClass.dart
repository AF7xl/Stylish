class RecommendedprdctModelClass {
  RecommendedprdctModelClass({
    this.id,
    this.productName,
    this.productPrice,
    this.quantity,
    this.description,
    this.category,
    this.subCategory,
    this.images,
    this.popular,
    this.recommend,
    this.v,
  });

  RecommendedprdctModelClass.fromJson(dynamic json) {
    id = json['_id'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    quantity = json['quantity'];
    description = json['description'];
    category = json['category'];
    subCategory = json['subCategory'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(v);
      });
    }
    popular = json['popular'];
    recommend = json['recommend'];
    v = json['__v'];
  }

  String? id;
  String? productName;
  int? productPrice;
  int? quantity;
  String? description;
  String? category;
  String? subCategory;
  List<dynamic>? images;
  bool? popular;
  bool? recommend;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['productName'] = productName;
    map['productPrice'] = productPrice;
    map['quantity'] = quantity;
    map['description'] = description;
    map['category'] = category;
    map['subCategory'] = subCategory;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['popular'] = popular;
    map['recommend'] = recommend;
    map['__v'] = v;
    return map;
  }

  static List<RecommendedprdctModelClass> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json
            .map((value) => RecommendedprdctModelClass.fromJson(value))
            .toList();
  }
}
