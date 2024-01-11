// Geocoder Buddy Data Model
import 'dart:convert';

GBData gbDataFromJson(String str) => GBData.fromJson(json.decode(str));

String gbDataToJson(GBData data) => json.encode(data.toJson());

class GBData {
  GBData({
    required this.placeId,
    required this.osmType,
    required this.id,
    required this.lat,
    required this.lon,
    required this.placeRank,
    required this.importance,
    required this.displayName,
    required this.address,
    required this.boundingbox,
  });

  int placeId;
  String? osmType;
  int? id;
  String lat;
  String lon;
  int placeRank;
  double importance;
  String displayName;
  Address address;
  List<String> boundingbox;

  factory GBData.fromJson(Map<String, dynamic> json) => GBData(
        placeId: json["place_id"],
        osmType: json["osm_type"],
        id: json["osm_id"],
        lat: json["lat"],
        lon: json["lon"],
        placeRank: json["place_rank"],
        importance: json["importance"].toDouble(),
        displayName: json["display_name"],
        address: Address.fromJson(json["address"]),
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "osm_type": osmType,
        "osm_id": id,
        "lat": lat,
        "lon": lon,
        "place_rank": placeRank,
        "importance": importance,
        "display_name": displayName,
        "address": address.toJson(),
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
      };
}

class Address {
  Address({
    this.houseNumber,
    this.road,
    this.neighbourhood,
    this.village,
    this.cityDistrict,
    this.city,
    this.county,
    this.stateDistrict,
    this.state,
    this.iso31662Lvl4,
    this.region,
    this.iso31662Lvl6,
    this.postcode,
    this.country,
    this.countryCode,
  });

  String? houseNumber;
  String? road;
  String? neighbourhood;
  String? village;
  String? cityDistrict;
  String? city;
  String? county;
  String? stateDistrict;
  String? state;
  String? iso31662Lvl4;
  String? region;
  String? iso31662Lvl6;
  String? postcode;
  String? country;
  String? countryCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        houseNumber: json["house_number"],
        road: json["road"],
        neighbourhood: json["neighbourhood"],
        village: json["village"],
        cityDistrict: json["city_district"],
        city: json["city"],
        county: json["county"],
        stateDistrict: json["state_district"],
        state: json["state"],
        iso31662Lvl4: json["iso3166-2-lvl4"],
        region: json["region"],
        iso31662Lvl6: json["iso3166-2-lvl6"],
        postcode: json["postcode"],
        country: json["country"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "house_number": houseNumber,
        "road": road,
        "neighbourhood": neighbourhood,
        "village": village,
        "city_district": cityDistrict,
        "city": city,
        "county": county,
        "state_district": stateDistrict,
        "state": state,
        "ISO3166-2-lvl4": iso31662Lvl4,
        "region": region,
        "ISO3166-2-lvl6": iso31662Lvl6,
        "postcode": postcode,
        "country": country,
        "country_code": countryCode,
      };
}
