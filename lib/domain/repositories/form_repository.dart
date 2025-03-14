import '../entities/form_data.dart';

abstract class FormRepository {
  Future<FormData> fetchFormData();
}