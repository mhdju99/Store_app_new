// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/core/constants/end_points.dart';
import 'package:store_app/models/CountryModel.dart';
import 'package:store_app/models/brand_model.dart';

class CountryService {
  final String _endpoint = EndPoints.Country_endpoint;

  Future<CountryModel> getCountry() async {
    Response? response = await Api().get(endpoint: _endpoint);
    CountryModel item = CountryModel(success: F, countries: [""]);

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = response.data;
        item = CountryModel.fromJson(data);

        return item;
      } else {
        return item;
      }
    } else {
      return item;
    }
  }
}
