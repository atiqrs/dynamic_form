import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/di/injector.dart';
import 'presentation/providers/form_provider.dart';
import 'presentation/screens/form_screen.dart';
import 'domain/usecases/fetch_form_data.dart';

void main() {
  setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FormProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Form',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FormScreen(
        fetchFormDataUseCase: getIt<FetchFormDataUseCase>(),
      ),
    );
  }
}
