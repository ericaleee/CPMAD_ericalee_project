// ignore_for_file: deprecated_member_use

import 'package:http/http.dart' as http;
import 'busstops.dart';

class HttpService {
  static const String url =
      'http://datamall2.mytransport.sg/ltaodataservice/BusStops';
      
  static Future<List<Value>> getBusStops() async {
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'AccountKey': 'bEIxEJoTTQKVNKgFaY1PjQ==',
        'accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final BusStops cp = busStopsFromJson(response.body);
        return cp.value;
      } else {
        return <Value>[];
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return <Value>[];
    }
  } //getBusStops
} //HttpService