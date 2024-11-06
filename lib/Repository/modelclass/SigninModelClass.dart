
class SigninModelClass {
  String? token;
  String? id;
  String? fullName;
  String? email;
  String? state;
  String? city;
  String? locality;
  int? v;

  SigninModelClass({this.token, this.id, this.fullName, this.email, this.state, this.city, this.locality, this.v});

  SigninModelClass.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    id = json["_id"];
    fullName = json["fullName"];
    email = json["email"];
    state = json["state"];
    city = json["city"];
    locality = json["locality"];
    v = (json["__v"] as num).toInt();
  }

  static List<SigninModelClass> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SigninModelClass.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    _data["_id"] = id;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["state"] = state;
    _data["city"] = city;
    _data["locality"] = locality;
    _data["__v"] = v;
    return _data;
  }
}