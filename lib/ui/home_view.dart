import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/ui/base_view.dart';
import 'package:widgetbook_challenge/ui/home_viewmodel.dart';

/// UI implementation for the Home screen.
class HomeView extends StatelessWidget {
  /// Creates a new instance of [HomeView] class.
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Text(
                  'Please enter your name',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: viewModel.nameInputController,
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue,
                  ),
                  height: 48,
                  child: TextButton(
                    onPressed: viewModel.isBusy ? null : viewModel.onSubmitPressed,
                    child: viewModel.isBusy
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Submit'.toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  viewModel.statusMessage,
                  style: viewModel.errorEncountered
                      ? const TextStyle(
                          color: Colors.redAccent,
                        )
                      : const TextStyle(
                          color: Colors.black,
                        ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
      viewModel: HomeViewModel(
        api: WidgetbookApi(
          randomNumberGenerator: Random(),
        ),
      ),
    );
  }
}
