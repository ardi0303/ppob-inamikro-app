import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inamikro_app/pages/notif/notif.dart';

class AppBarPPOB extends StatelessWidget {
  const AppBarPPOB({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 28.0, right: 28.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Align the icons and text
        children: [
          SvgPicture.asset(
            'assets/icons/button-back.svg',
          ),
          const Text(
            'PPOB',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Notif(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/icons/notification.svg',
              )),
        ],
      ),
    );
  }
}
