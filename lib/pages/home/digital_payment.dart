import 'package:flutter/material.dart';
import 'package:inamikro_app/datas/icons.dart';
import 'package:inamikro_app/pages/token/token.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DigitalPaymentWidget extends StatelessWidget {
  const DigitalPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Padding(
      padding:
          const EdgeInsets.only(left: 28.0, right: 28.0, top: 10, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pembayaran Digital',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          SizedBox(
            height: orientation == Orientation.portrait ? 200 : 160,
            child: GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 4 : 6,
              childAspectRatio: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2.6)
                  : MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 0.9),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...digitalPaymentIcons.map(
                  (icon) => GestureDetector(
                    onTap: () {
                      if (icon.icon == 'pln') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TokenPage(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child:
                              SvgPicture.asset('assets/icons/${icon.icon}.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(icon.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
