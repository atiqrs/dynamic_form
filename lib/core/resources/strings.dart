class AppString {
  AppString._();

  static const radio = 'radio';
  static const dropdown = 'dropdown';
  static const textField = 'textfield';
  static const checkbox = 'checkbox';

  static const titleInputTypes = 'Input Types';
  static const editInputTypes = 'Edit Input Types';
  static const editSelection = 'Edit Selections';
  static const submit = 'Submit';
  static const update = 'Update';
  static const inputTextFieldHints = 'Type here...';

  static const allRequiredText = 'Please fill all required fields';
  static const requiredText = 'Required';
  static const selectText = 'Select';
  static const selectedInputText = 'Selected Input';

  static selectCountShowText(String value) => '$selectText $value';

  static dropDownBlankDash(String value) => '0 $value';
}
