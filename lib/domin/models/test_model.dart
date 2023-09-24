class TestModel {
  TestModel({
      this.status, 
      this.message, 
      this.data, 
      this.errors, 
      this.pagination, 
      this.overview,});

  TestModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors'];
    pagination = json['pagination'];
    overview = json['overview'];
  }
  num? status;
  String? message;
  Data? data;
  dynamic errors;
  dynamic pagination;
  dynamic overview;
TestModel copyWith({  num? status,
  String? message,
  Data? data,
  dynamic errors,
  dynamic pagination,
  dynamic overview,
}) => TestModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
  errors: errors ?? this.errors,
  pagination: pagination ?? this.pagination,
  overview: overview ?? this.overview,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['errors'] = errors;
    map['pagination'] = pagination;
    map['overview'] = overview;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.fullName, 
      this.email, 
      this.phone, 
      this.token, 
      this.rememberToken,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
    rememberToken = json['remember_token'];
  }
  num? id;
  String? fullName;
  String? email;
  String? phone;
  String? token;
  String? rememberToken;
Data copyWith({  num? id,
  String? fullName,
  String? email,
  String? phone,
  String? token,
  String? rememberToken,
}) => Data(  id: id ?? this.id,
  fullName: fullName ?? this.fullName,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  token: token ?? this.token,
  rememberToken: rememberToken ?? this.rememberToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['email'] = email;
    map['phone'] = phone;
    map['token'] = token;
    map['remember_token'] = rememberToken;
    return map;
  }

}