class CategoriesModelClass {
  CategoriesModelClass({
      this.id, 
      this.name, 
      this.image, 
      this.banner, 
      this.v,});

  CategoriesModelClass.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    image = json['image'];
    banner = json['banner'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? image;
  String? banner;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['banner'] = banner;
    map['__v'] = v;
    return map;
  }
  static List<CategoriesModelClass> listFromJson(List<dynamic> json) {
     return json == null
     ? []
    : json.map((value) => CategoriesModelClass.fromJson(value)).toList();
     }
}