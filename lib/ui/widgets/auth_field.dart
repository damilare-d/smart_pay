import 'package:flutter/material.dart';
import 'package:smartpay/ui/styles/colors.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool isVisible;
  final bool isBorderColor;
  final TextInputType? textInputType;
  final Function()? changeVisibilty;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final String? labelText;
  final int? maxLines;

  const AuthField({
    Key? key,
    this.changeVisibilty,
    this.textInputType,
    required this.controller,
    this.onChanged,
    this.isVisible = true,
    this.isBorderColor = false,
    this.borderColor,
    required this.hintText,
    this.labelText,
    this.isPassword = false,
    this.borderRadius,
    this.suffixIcon,
    this.maxLines,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF111827),
            height: 1.5,
          ),
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          controller: controller,
          onChanged: onChanged,
          obscureText: isPassword ? isVisible : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF9FAFB),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: kcAccentLightColor1,
              ),
              borderRadius: borderRadius ?? BorderRadius.zero,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: borderRadius ?? BorderRadius.zero,
            ),
            hintText: hintText,
            labelText: (labelText != null && labelText!.isNotEmpty) ? labelText : null,
            //hintStyle: Theme.of(context).textTheme.labelMedium,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
        if (isPassword)
          Positioned(
            right: 15,
            top: 15,
            child: GestureDetector(
              onTap: changeVisibilty,
              child: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
            ),
          ),
      ],
    );
  }
}
