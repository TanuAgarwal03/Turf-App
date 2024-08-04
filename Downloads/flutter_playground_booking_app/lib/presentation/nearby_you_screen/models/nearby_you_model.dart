class NearbyYouModel {
  String? image;
  String? title;
  String? location;
  double? latitude;
  double? longitude;
  String? distance;
  String? googleLocationUrl;

  NearbyYouModel(
      {this.image,
      this.title,
      this.location,
      this.latitude,
      this.longitude,
      this.distance,
      this.googleLocationUrl});

  factory NearbyYouModel.fromJson(Map<String, dynamic> json) {
    return NearbyYouModel(
      title: json['title']['rendered'] as String?,
      image: json['acf']['turf_image'] as String?,
      location: json['acf']['address'] as String?,
      googleLocationUrl: json['acf']['google_location_url'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
