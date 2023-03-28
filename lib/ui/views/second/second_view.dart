import 'package:flutter/material.dart';
import 'package:st_boilerplate_stacked/ui/views/second/second_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:st_boilerplate_stacked/ui/common/app_colors.dart';
import 'package:st_boilerplate_stacked/ui/common/ui_helpers.dart';

class SecondView extends StackedView<SecondViewModel> {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SecondViewModel viewModel,
    Widget? child,
  ) {
    return ViewModelBuilder<SecondViewModel>.reactive(
        viewModelBuilder: () => SecondViewModel(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) async {
          await viewModel.shared();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpaceLarge,
                      Column(
                        children: [
                          const Text(
                            'Second view',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          verticalSpaceMedium,
                          MaterialButton(
                            color: Colors.white,
                            onPressed: viewModel.replace,
                            child: const Text(
                              'navigate',
                            ),
                          ),
                          verticalSpaceMedium,
                          MaterialButton(
                            color: Colors.white,
                            onPressed: viewModel.showBottomSheet,
                            child: const Text(
                              'show bottom sheet',
                            ),
                          ),
                          verticalSpaceMedium,
                          MaterialButton(
                            color: Colors.black,
                            onPressed: viewModel.incrementCounter,
                            child: Text(
                              viewModel.counterLabel,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  SecondViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SecondViewModel();
}
