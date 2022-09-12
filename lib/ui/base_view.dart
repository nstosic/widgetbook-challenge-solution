import 'package:flutter/material.dart';

import 'package:widgetbook_challenge/ui/base_viewmodel.dart';

/// Base class for all screen-level widgets
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  /// Creates a new instance of [BaseView].
  const BaseView({
    required this.builder,
    required this.viewModel,
    this.child,
    Key? key,
  }) : super(key: key);

  /// Builder used to build the current UI state for this [BaseView] instance.
  final Widget Function(BuildContext, T, Widget?) builder;

  /// Optional, static child [Widget] to speed up UI building for the parts
  /// of the UI that do not depend on the state inside the `viewModel`.
  final Widget? child;

  /// [BaseViewModel] derived class that contains the state fields and business
  /// logic for this [BaseView].
  final T viewModel;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_updateUI);
  }

  void _updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      widget.viewModel,
      widget.child,
    );
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_updateUI);
    widget.viewModel.dispose();
    super.dispose();
  }
}
