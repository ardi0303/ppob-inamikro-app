import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarToken extends StatelessWidget {
  const AppBarToken({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 28.0, right: 28.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/icons/button-back.svg',
            ),
          ),
          const Text(
            'LISTRIK PLN',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            'assets/icons/notification.svg',
          ),
        ],
      ),
    );
  }
}
