class AppString {
  AppString._();

  static const radio = 'radio';
  static const dropdown = 'dropdown';
  static const textField = 'textfield';
  static const checkbox = 'checkbox';

  static const titleInputTypes = 'Input Types';
  static const submit = 'Submit';
  static const inputTextFieldHints = 'Type here...';

  static const allRequiredText = 'Please fill all required fields';
  static const requiredText = 'Required';
  static const selectText = 'Select';

  static selectCountShowText(String value) => '$selectText $value';

  static dropDownBlankDash(String value) => '0 $value';

  static const apiData = '''{
  "message": "Success",
  "assignmentInstructionUrl": "https://docs.google.com/document/d/1OXXzoZQsgB_Zfs4ETUeoltf09JX-bV_1Nlfw3e5PPAI/edit#heading=h.v1xdvbwbmyy4",
  "information": "Software Engineer (Flutter - Level I) Coding Test Assignment, Total Time: 4Hr(10am-02pm), All the resources will be activated at 10am, 10 October-2024",
  "json_response": {
    "attributes": [
      {
        "id": "1",
        "title": "House type",
        "type": "radio",
        "options": [
          "Apartment",
          "Single-family",
          "Condo"
        ]
      },
      {
        "id": "2",
        "title": "Number of Bedrooms",
        "type": "dropdown",
        "options": [
          "1",
          "2",
          "3",
          "4",
          "5+"
        ]
      },
      {
        "id": "3",
        "title": "Number of Bathrooms",
        "type": "dropdown",
        "options": [
          "1",
          "2",
          "3",
          "4+"
        ]
      },
      {
        "id": "4",
        "title": "Cleaning Frequency",
        "type": "radio",
        "options": [
          "One-time",
          "Weekly",
          "Bi-weekly",
          "Monthly"
        ]
      },
      {
        "id": "5",
        "title": "Include Garage Cleaning",
        "type": "checkbox",
        "options": [
          "Yes",
          "No"
        ]
      },
      {
        "id": "6",
        "title": "Include Outdoor Area",
        "type": "checkbox",
        "options": [
          "Including",
          "Excluding"
        ]
      },
      {
        "id": "7",
        "title": "Preferred Cleaning Time",
        "type": "textfield",
        "options": [
          
        ]
      },
      {
        "id": "8",
        "title": "Pet-friendly Products",
        "type": "radio",
        "options": [
          "Yes",
          "No"
        ]
      },
      {
        "id": "9",
        "title": "Additional Requests",
        "type": "textfield",
        "options": [
          
        ]
      },
      {
        "id": "10",
        "title": "Parking Space Availability",
        "type": "dropdown",
        "options": [
          "No Parking",
          "Parking Available"
        ]
      }
    ]
  }
}''';


}
