import 'package:flutter/material.dart';
import 'package:smartpay/ui/screens/onboarding/onboarding_viewmodel.dart';
import 'package:stacked/stacked.dart';

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
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: viewModel.skip,
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: PageView(
              controller: viewModel.pageController,
              children: const [
                OnboardingPage(
                  imagePath: 'assets/images/onboarding01.png', // Add your image path here
                  bigText: 'Finance app the safest and most trusted',
                  smallText: 'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
                ),
                OnboardingPage(
                  imagePath: 'assets/images/onboarding1.png', // Add your image path here
                  bigText: 'The fastest transaction process only here',
                  smallText: 'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ReusableButton(
              text: 'Get Started',
              onPressed: () {
                // Handle button press
              },
            ),
          ),
        );

      }
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String bigText;
  final String smallText;

 const OnboardingPage({
    required this.imagePath,
    required this.bigText,
    required this.smallText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

class ReusableButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  ReusableButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: Text(text),
    );
  }
}