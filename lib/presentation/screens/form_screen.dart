import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/commons/widgets/checkbox_input.dart';
import '../../core/commons/widgets/custom_button.dart';
import '../../core/commons/widgets/dropdown/custom_dropdown.dart';
import '../../core/commons/widgets/padding_divider.dart';
import '../../core/commons/widgets/radio_input.dart';
import '../../core/commons/widgets/textfield_input.dart';
import '../../core/resources/strings.dart';
import '../../domain/entities/form_data.dart';
import '../../domain/usecases/fetch_form_data.dart';
import '../providers/form_provider.dart';
import 'results_screen.dart';

class FormScreen extends StatefulWidget {
  final FetchFormDataUseCase fetchFormDataUseCase;

  const FormScreen({super.key, required this.fetchFormDataUseCase});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FormData>(
      future: widget.fetchFormDataUseCase.execute(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(
            body: TextButton(
              onPressed: () => widget.fetchFormDataUseCase.execute(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.restart_alt_sharp),
                  Text('Error: ${snapshot.error}'),
                  Text('\n\nTap this text to Retry'),
                ],
              ),
            ),
          );
        } else if (snapshot.hasData) {
          final formData = snapshot.data!;
          final trueProvider = Provider.of<FormProvider>(context, listen: true);
          final falseProvider = Provider.of<FormProvider>(context, listen: false);
          return ChangeNotifierProvider(
            create: (_) => FormProvider(),
            child: Scaffold(
              appBar: AppBar(title: Text(AppString.titleInputTypes), centerTitle: true),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: formData.jsonResponse.attributes.map((attribute) {
                    switch (attribute.type) {
                      case AppString.radio:
                        return PaddingDivider(
                          widget: RadioInput(
                            title: attribute.title,
                            options: attribute.options,
                            selectedValue: trueProvider.getValues(attribute.title)?.first,
                            onChanged: (value) {
                              falseProvider.setValueById(attribute.title, [value ?? '']);
                            },
                          ),
                        );
                      case AppString.dropdown:
                        return PaddingDivider(
                          bottomPadding: true,
                          widget: CustomDropdown(
                            headerText: attribute.title,
                            selectedItem: trueProvider.getValues(attribute.title)?.first ??
                                (attribute.options.contains(attribute.selectedKey) ? attribute.selectedKey : null),
                            hints: AppString.dropDownBlankDash(attribute.title),
                            items: attribute.options,
                            onSubmit: (value) {
                              falseProvider.setValueById(attribute.title, [value]);
                            },
                          ),
                        );
                      case AppString.textField:
                        return PaddingDivider(
                          bottomPadding: true,
                          widget: TextFieldInput(
                            title: attribute.title,
                            placeholder: AppString.inputTextFieldHints,
                            controller: TextEditingController(
                              text: falseProvider.getValues(attribute.title)?.first ?? attribute.placeholderKey,
                            ),
                            onChanged: (value) {
                              falseProvider.setValueById(attribute.title, [value]);
                            },
                          ),
                        );
                      case AppString.checkbox:
                        return PaddingDivider(
                          widget: CheckboxInput(
                            title: attribute.title,
                            options: attribute.options,
                            selectedValues: trueProvider.getValues(attribute.title) ?? [],
                            onChanged: (value) {
                              falseProvider.toggleValue(attribute.title, value);
                            },
                          ),
                        );
                      default:
                        return SizedBox();
                    }
                  }).toList(),
                ),
              ),
              persistentFooterButtons: [
                CustomButton(
                  label: AppString.submit,
                  onPressed: () {
                    if (falseProvider.validateForm() &&
                        falseProvider.formValues.length == formData.jsonResponse.attributes.length) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsScreen(
                            formValues: falseProvider.formValues,
                            model: snapshot.data!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(AppString.allRequiredText)),
                      );
                    }
                  },
                )
              ],
            ),
          );
        } else {
          return Scaffold(body: Center(child: Text('No data available')));
        }
      },
    );
  }
}
