import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/ui/base_view.dart';

/// Base class for all view models that should correspond 1-1 to
/// all the [BaseView] classes.
abstract class BaseViewModel extends ChangeNotifier {
  bool _isBusy = false;

  /// Returns `true` if the view model is executing an `async` operation.
  bool get isBusy => _isBusy;
  @protected
  set isBusy(bool value) => _isBusy = value;
}
