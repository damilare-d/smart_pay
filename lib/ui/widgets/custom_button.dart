import 'package:flutter/material.dart';
import 'package:smartpay/ui/styles/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;

const CustomButton({super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: isEnabled ? kcAccentLightColor2 : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: BorderSide(
          color: isEnabled ? kcAccentLightColor2 : Colors.grey,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: isEnabled ? kcPrimaryTextLightColor : Colors.white,
        ),
      ),
    );
  }
}
