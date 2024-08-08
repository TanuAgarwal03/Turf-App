class NearbyYouModel {
  int? id;
  String? image;
  String? title;
  String? location;
  double? latitude;
  double? longitude;
  String? distance;
  String? googleLocationUrl;
  // String? listOfGround;

  NearbyYouModel(
      {this.id,
        this.image,
      this.title,
      this.location,
      this.latitude,
      this.longitude,
      this.distance,
      this.googleLocationUrl,  
      });

  factory NearbyYouModel.fromJson(Map<String, dynamic> json) {
    return NearbyYouModel(
      id : json['id'] ?? 0,
      title: json['title']['rendered'] as String?,
      image: json['acf']['turf_image'] as String?,
      location: json['acf']['address'] as String?,
      googleLocationUrl: json['acf']['google_location_url'] as String?,
      // listOfGround: json['acf']['list_of_ground'].toString()
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      // 'list_of_ground' : listOfGround,
    };
  }
}
