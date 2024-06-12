import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartpay/ui/styles/colors.dart';


class EmailCard extends StatefulWidget {
  final String title;
  final String subtitle;


  const EmailCard({
    Key? key,
    required this.title,
    required this.subtitle,

  }) : super(key: key);

  @override
  _EmailCardState createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _isChecked ? const Color(0xFF0A6375) : Colors.grey),
                color: _isChecked ? const Color(0xFF0A6375) : Colors.transparent,
              ),
              child: _isChecked
                  ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 16,
              )
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text(
                  "Email",
                  style:  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kcAccentLightColor2
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Icon(
           Icons.mail,
           size: 24,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
