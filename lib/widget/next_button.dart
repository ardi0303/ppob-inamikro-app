import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28.0, left: 28.0, bottom: 40.0),
      child: SizedBox(
        height: 38.0,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFC80009),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0), // Rounded corners
            ),
          ),
          child: const Text(
            'SELANJUTNYA',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
