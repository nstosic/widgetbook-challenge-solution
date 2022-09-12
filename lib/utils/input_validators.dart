/// Umbrella class for all the input validators needed in the app
abstract class InputValidators {
  static final _alphabetLettersOnly = RegExp(r'^[A-Za-z]+$');
  static final _alphabetLettersAndWhitespaces = RegExp(r'^[A-Za-z\s]+$');

  /// Returns `true` if the `input` satisfies all the name requirements
  static bool validateNameInput(String input) {
    return _alphabetLettersAndWhitespaces.hasMatch(input);
  }
}
