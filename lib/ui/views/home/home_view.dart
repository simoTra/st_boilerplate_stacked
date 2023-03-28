import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:st_boilerplate_stacked/ui/common/app_colors.dart';
import 'package:st_boilerplate_stacked/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      verticalSpaceLarge,
                      Column(
                        children: [
                          const Text(
                            'Hello',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          verticalSpaceMedium,
                          const Text(
                            'This is the first view',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          verticalSpaceMedium,
                          MaterialButton(
                            color: Colors.white,
                            onPressed: viewModel.navigateBack,
                            child: const Text(
                              'navigate back',
                            ),
                          ),
                          MaterialButton(
                            color: Colors.white,
                            onPressed: viewModel.navigate,
                            child: const Text(
                              'navigate',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            color: kcDarkGreyColor,
                            child: const Text(
                              'Show Dialog',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: viewModel.showDialog,
                          ),
                          MaterialButton(
                            color: kcDarkGreyColor,
                            child: const Text(
                              'Show Bottom Sheet',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: viewModel.showBottomSheet,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
