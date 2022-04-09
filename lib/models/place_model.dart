class PlaceModel {
  late int id;
  late String name;
  late String city;
  late String country;
  late int price;
  late String imageUrl;
  late int rating;
  late String address;
  late String phone;
  late String mapUrl;
  late List photos;
  late int numberOfKitchens;
  late int numberOfBedrooms;
  late int numberOfCupboards;

  PlaceModel({
  required this.id,
  required this.name,
  required this.city,
  required this.country,
  required this.price,
  required this.imageUrl,
  required this.rating,
  required this.address,
  required this.phone,
  required this.mapUrl,
  required this.photos,
  required this.numberOfKitchens,
  required this.numberOfBedrooms,
  required this.numberOfCupboards,
  });

  PlaceModel.fromJson(json) {
    print(json);
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country  = json['country'];
    price  = json['price'];
    imageUrl = json['image_url'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfKitchens = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
  }
}