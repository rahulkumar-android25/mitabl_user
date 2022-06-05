class GetCookProfileModel {
  int? status;
  bool? isSuccess;
  String? message;
  Data? data;

  GetCookProfileModel({this.status, this.isSuccess, this.message, this.data});

  GetCookProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? email;
  int? emailVerified;
  int? roleId;
  String? avatar;
  String? description;
  int? phone;
  String? address;
  String? role;
  Kitchen? kitchen;

  Data(
      {this.firstName,
      this.lastName,
      this.email,
      this.emailVerified,
      this.roleId,
      this.avatar,
      this.description,
      this.phone,
      this.address,
      this.role,
      this.kitchen});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerified = json['email_verified'];
    roleId = json['role_id'];
    avatar = json['avatar'];
    description = json['description'];
    phone = json['phone'];
    address = json['address'];
    role = json['role'];
    kitchen =
        json['kitchen'] != null ? new Kitchen.fromJson(json['kitchen']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified'] = this.emailVerified;
    data['role_id'] = this.roleId;
    data['avatar'] = this.avatar;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['role'] = this.role;
    if (this.kitchen != null) {
      data['kitchen'] = this.kitchen!.toJson();
    }
    return data;
  }
}

class Kitchen {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? phone;
  int? noOfSeats;
  String? timings;
  String? images;
  int? dineIn;
  int? takeAway;
  String? description;
  String? abn;
  String? certificateNo;
  String? certificateDoc;
  String? status;
  int? available;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;
  double? ratingCount;
  List<Reviews>? reviews;

  Kitchen(
      {this.id,
      this.userId,
      this.name,
      this.address,
      this.phone,
      this.noOfSeats,
      this.timings,
      this.images,
      this.dineIn,
      this.takeAway,
      this.description,
      this.abn,
      this.certificateNo,
      this.certificateDoc,
      this.status,
      this.available,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt,
      this.ratingCount,
      this.reviews});

  Kitchen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    noOfSeats = json['no_of_seats'];
    timings = json['timings'];
    images = json['images'];
    dineIn = json['dine_in'];
    takeAway = json['take_away'];
    description = json['description'];
    abn = json['abn'];
    certificateNo = json['certificate_no'];
    certificateDoc = json['certificate_doc'];
    status = json['status'];
    available = json['available'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ratingCount = json['rating_count'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['no_of_seats'] = this.noOfSeats;
    data['timings'] = this.timings;
    data['images'] = this.images;
    data['dine_in'] = this.dineIn;
    data['take_away'] = this.takeAway;
    data['description'] = this.description;
    data['abn'] = this.abn;
    data['certificate_no'] = this.certificateNo;
    data['certificate_doc'] = this.certificateDoc;
    data['status'] = this.status;
    data['available'] = this.available;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rating_count'] = this.ratingCount;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int? id;
  int? mikitchnId;
  int? userId;
  String? rating;
  String? reviewTag;
  String? review;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.id,
      this.mikitchnId,
      this.userId,
      this.rating,
      this.reviewTag,
      this.review,
      this.createdAt,
      this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mikitchnId = json['mikitchn_id'];
    userId = json['user_id'];
    rating = json['rating'].toString();
    reviewTag = json['review_tag'];
    review = json['review'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mikitchn_id'] = this.mikitchnId;
    data['user_id'] = this.userId;
    data['rating'] = this.rating;
    data['review_tag'] = this.reviewTag;
    data['review'] = this.review;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
