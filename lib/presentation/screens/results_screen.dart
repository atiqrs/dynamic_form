import 'package:flutter/material.dart';

import '../../core/resources/strings.dart';
import '../../domain/entities/form_data.dart';
import '../widgets/edit_selections_bottomsheet.dart';

class ResultsScreen extends StatelessWidget {
  final Map<String, List<String>> formValues;
  final FormData model;

  const ResultsScreen({super.key, required this.formValues, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              '${formValues.length} items',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.selectedInputText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Light grey background
                borderRadius: BorderRadius.circular(16), // Rounded corners
                border: Border.all(
                  color: Colors.grey[200]!, // Light border color
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...formValues.entries.map((entry) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          // Icons.add_box_rounded,
                          Icons.radio_button_checked_rounded,
                          color: Colors.green,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${entry.key}: ',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[800], height: 2),
                              ),
                              TextSpan(
                                text: entry.value.join(', '),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey[800], height: 2),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                  SizedBox(height: 8),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  InkWell(
                    onTap: () {
                      _openEditBottomSheet(context);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.editSelection,
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[800], height: 2),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        AppString.titleInputTypes,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                  Expanded(
                    child: EditSelectionsBottomSheet(
                      model: model,
                      formValues: formValues,
                      onUpdate: (updatedValues) {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultsScreen(
                              formValues: updatedValues,
                              model: model,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
