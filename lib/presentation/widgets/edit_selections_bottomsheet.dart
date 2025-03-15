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
import '../providers/form_provider.dart';

class EditSelectionsBottomSheet extends StatelessWidget {
  final FormData model;
  final Map<String, List<String>> formValues;
  final Function onUpdate;

  const EditSelectionsBottomSheet({super.key, required this.model, required this.onUpdate, required this.formValues});

  @override
  Widget build(BuildContext context) {
    final trueProvider = Provider.of<FormProvider>(context, listen: true);
    final falseProvider = Provider.of<FormProvider>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => FormProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: model.jsonResponse.attributes.map((attribute) {
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
            label: AppString.update,
            onPressed: () {
              if (falseProvider.validateForm() &&
                  falseProvider.formValues.length == model.jsonResponse.attributes.length) {
                onUpdate(Provider.of<FormProvider>(context, listen: false).formValues);
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
  }
}
