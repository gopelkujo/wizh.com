import 'package:flutter/services.dart';
import 'package:wizhdotcom/features/trip/models/trip_detail_model.dart';
import 'package:wizhdotcom/features/trip/models/trip_model.dart';

class TripService {
  /// Get trip list data from asset json.
  static Future<List<TripModel>> get() async {
    try {
      final String response = await rootBundle.loadString('assets/data/trip.json');
      final data = tripModelFromJson(response);
      return data;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Get trip detail data from asset json.
  static Future<TripDetailModel> getDetail(String id) async {
    final String response = await rootBundle.loadString(
      'assets/data/trip_details.json',
    );
 
    final datas = tripDetailModelFromJson(response);

    return datas[int.parse(id)];
  }
}
