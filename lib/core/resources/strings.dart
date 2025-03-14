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
}
