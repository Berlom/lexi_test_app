class SchoolModel {
  String? id;
  String? name;
  String? address;
  String? accountStatus;
  String? latitude;
  String? longitude;
  String? gouvornorate;
  String? delegation;
  String? schoolTel;
  String? facebookLink;
  String? instaLink;
  String? schoolNumber;
  String? referredBy;
  List<String>? city;
  List<Photos>? photos;

  SchoolModel(
      {this.id,
      this.name,
      this.address,
      this.accountStatus,
      this.latitude,
      this.longitude,
      this.gouvornorate,
      this.delegation,
      this.schoolTel,
      this.facebookLink,
      this.instaLink,
      this.schoolNumber,
      this.referredBy,
      this.city,
      this.photos});

  SchoolModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    accountStatus = json['accountStatus'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    gouvornorate = json['gouvornorate'];
    delegation = json['delegation'];
    schoolTel = json['schoolTel'];
    facebookLink = json['facebookLink'];
    instaLink = json['instaLink'];
    schoolNumber = json['schoolNumber'];
    referredBy = json['referredBy'];
    city = json['city']?.cast<String>();
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['accountStatus'] = accountStatus;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['gouvornorate'] = gouvornorate;
    data['delegation'] = delegation;
    data['schoolTel'] = schoolTel;
    data['facebookLink'] = facebookLink;
    data['instaLink'] = instaLink;
    data['schoolNumber'] = schoolNumber;
    data['referredBy'] = referredBy;
    data['city'] = city ?? [];
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  String? path;

  Photos({this.path});

  Photos.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    return data;
  }
}
