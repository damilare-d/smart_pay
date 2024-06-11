import 'package:flutter/material.dart';
import 'package:smartpay/ui/screens/onboarding/onboarding_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
        viewModelBuilder: () => OnboardingViewModel(),
        builder: (
          BuildContext context,
          OnboardingViewModel viewModel,
          Widget? child,
        ) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: viewModel.skip,
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: kcAccentLightColor1),
                  ),
                ),
              ],
            ),
            body: PageView(
              controller: viewModel.pageController,
              children: [
                 OnboardingPage(
                  currentPage: viewModel.currentPage,
                  imagePath: 'assets/images/onboarding01.png',
                  bigText: 'Finance app the safest and most trusted',
                  smallText:
                      'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
                ),
                 OnboardingPage(
                  currentPage: viewModel.currentPage,
                  imagePath: 'assets/images/onboarding1.png',
                  bigText: 'The fastest transaction process only here',
                  smallText:
                      'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
                ),
              ],
            ),
            floatingActionButton: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16.0),
              margin: const EdgeInsets.only(left: 16.0),
              child: CustomButton(
                text: 'Get Started',
                onPressed: () {
                  viewModel.navigateToSignIn();
                },
              ),
            ),
          );
        });
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String bigText;
  final String smallText;

  final int currentPage;

  const OnboardingPage({
    required this.imagePath,
    required this.bigText,
    required this.smallText,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          const SizedBox(height: 24.0),
          Text(
            bigText,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            smallText,
            style: const TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
         const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: currentPage == index ? 32.0 : 6.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? kcAccentLightColor2
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(6.0),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
