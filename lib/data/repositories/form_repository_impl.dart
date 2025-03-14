import '../../domain/repositories/form_repository.dart';
import '../../domain/entities/form_data.dart';
import '../datasources/remote_data_source.dart';
import '../models/form_data_model.dart';

class FormRepositoryImpl implements FormRepository {
  final RemoteDataSource remoteDataSource;

  FormRepositoryImpl({required this.remoteDataSource});

  @override
  Future<FormData> fetchFormData() async {
    try {
      // Fetch data model from the remote data source
      final FormDataModel formDataModel = await remoteDataSource.fetchFormData();

      // Convert data model to entity
      return FormData(
        message: formDataModel.message,
        assignmentInstructionUrl: formDataModel.assignmentInstructionUrl,
        information: formDataModel.information,
        jsonResponse: JsonResponse(
          attributes: formDataModel.jsonResponse.attributes.map((attributeModel) {
            return Attribute(
              id: attributeModel.id,
              title: attributeModel.title,
              type: attributeModel.type,
              options: attributeModel.options,
            );
          }).toList(),
        ),
      );
    } catch (e) {
      // Handle errors (e.g., network errors, parsing errors)
      throw Exception('Failed to fetch form data: $e');
    }
  }
}