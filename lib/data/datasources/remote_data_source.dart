import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/resources/api_constants.dart';
import '../models/form_data_model.dart';

class RemoteDataSource {
  Future<FormDataModel> fetchFormData() async {
    final response = await http.get(Uri.parse(ApiConstants.baseUrl + ApiConstants.formDataEndpoint));

    if (response.statusCode == 200) {
      return FormDataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load form data: ${response.statusCode}');
    }
  }
}