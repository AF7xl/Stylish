class UpdateModelClass {
  UpdateModelClass({
      this.id, 
      this.fullName, 
      this.email, 
      this.state, 
      this.city, 
      this.locality, 
      this.password, 
      this.v,});

  UpdateModelClass.fromJson(dynamic json) {
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    state = json['state'];
    city = json['city'];
    locality = json['locality'];
    password = json['password'];
    v = json['__v'];
  }
  String? id;
  String? fullName;
  String? email;
  String? state;
  String? city;
  String? locality;
  String? password;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['state'] = state;
    map['city'] = city;
    map['locality'] = locality;
    map['password'] = password;
    map['__v'] = v;
    return map;
  }

}