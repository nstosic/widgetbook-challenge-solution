import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/ui/base_viewmodel.dart';
import 'package:widgetbook_challenge/ui/home_view.dart';
import 'package:widgetbook_challenge/utils/input_validators.dart';

/// View model for the [HomeView] screen.
class HomeViewModel extends BaseViewModel {
  /// Creates a new instance of [HomeViewModel] class
  HomeViewModel({required this.api});

  /// Controller used to capture or interact with user's input in the text field
  final TextEditingController nameInputController = TextEditingController();

  /// API instance used to handle external service requests and responses
  final WidgetbookApi api;

  String? _statusMessage;

  /// Latest response message from the API
  String get statusMessage => _statusMessage ?? '';

  bool _errorEncountered = false;

  /// Returns `true` if there has been any error with the latest submit request
  bool get errorEncountered => _errorEncountered;

  /// Called when the user taps on the Submit button
  Future<void> onSubmitPressed() async {
    isBusy = true;
    _errorEncountered = false;
    _statusMessage = '';
    notifyListeners();
    if (_checkIfInputIsValid()) {
      try {
        final input = nameInputController.text;
        final res = await api.welcomeToWidgetbook(message: input);
        _statusMessage = res;
      } on Exception catch (e) {
        _statusMessage = '$e';
        _errorEncountered = true;
      }
    } else {
      _errorEncountered = true;
    }
    isBusy = false;
    notifyListeners();
  }

  bool _checkIfInputIsValid() {
    final input = nameInputController.text;
    if (input.isEmpty) {
      _statusMessage = 'Name must not be empty';
      return false;
    }
    if (!InputValidators.validateNameInput(input)) {
      _statusMessage = 'Name can only contain alphabet letters (a-z or A-Z)';
      return false;
    }
    return true;
  }
}
