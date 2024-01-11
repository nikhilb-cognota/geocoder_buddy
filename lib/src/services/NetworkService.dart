import 'package:geocoder_buddy/src/models/GBData.dart';
import 'package:geocoder_buddy/src/models/GBLatLng.dart';
import 'package:geocoder_buddy/src/models/MapData.dart';
import 'package:http/http.dart' as http;

const PATH = "https://nominatim.openstreetmap.org";

class NetworkService {
  static Future<List<MapData>> searhAddress(
    String query, {
    String? countryCode,
  }) async {
    var uri = Uri.parse("$PATH/search").replace(queryParameters: {
      'q': query,
      'countrycodes': countryCode,
      'format': 'jsonv2',
    });

    var request = http.Request('GET', uri);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      return mapDataFromJson(data);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  static Future<GBData> getDetails(GBLatLng pos) async {
    var uri = Uri.parse("$PATH/reverse").replace(queryParameters: {
      'lat': pos.lat,
      'lon': pos.lng,
      'format': 'jsonv2',
    });

    var request = http.Request('GET', uri);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      return gbDataFromJson(data);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
