import '../repositories/form_repository.dart';
import '../entities/form_data.dart';

class FetchFormDataUseCase {
  final FormRepository repository;

  FetchFormDataUseCase(this.repository);

  Future<FormData> execute() async {
    return await repository.fetchFormData();
  }
}