import 'dart:convert';

class TopReatedRestResponse {
  int? status;
  bool? isSuccess;
  String? message;
  List<TopReatedRestList>? topReatedRestList;

  TopReatedRestResponse(
      {this.status, this.isSuccess, this.message, this.topReatedRestList});

  TopReatedRestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      topReatedRestList = <TopReatedRestList>[];
      json['data'].forEach((v) {
        topReatedRestList!.add(new TopReatedRestList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.topReatedRestList != null) {
      data['data'] = this.topReatedRestList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopReatedRestList {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? phone;
  int? noOfSeats;
  String? timings;
  List<dynamic>? images = [];
  int? dineIn;
  int? takeAway;
  dynamic? description;
  String? abn;
  String? certificateNo;
  dynamic? certificateDoc;
  String? status;
  int? available;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;
  dynamic? ratingCount;
  double? distance;

  TopReatedRestList(
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
      this.distance});

  TopReatedRestList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    noOfSeats = json['no_of_seats'];
    timings = json['timings'];
    images = json['images'] != null ? jsonDecode(json['images']) : [];
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
    distance = json['distance'];
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
    data['distance'] = this.distance;
    return data;
  }
}
