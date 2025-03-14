import 'package:get_it/get_it.dart';

import '../../data/datasources/remote_data_source.dart';
import '../../data/repositories/form_repository_impl.dart';
import '../../domain/repositories/form_repository.dart';
import '../../domain/usecases/fetch_form_data.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());

  getIt.registerLazySingleton<FormRepository>(
    () => FormRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton(() => FetchFormDataUseCase(getIt()));
}
