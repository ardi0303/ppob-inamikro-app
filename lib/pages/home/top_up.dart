import 'package:flutter/material.dart';
import 'package:inamikro_app/datas/icons.dart';
import 'package:inamikro_app/pages/pulsa/pulsa.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopUpWidget extends StatelessWidget {
  const TopUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    int itemCount = topUpIcons.length;

    int crossAxisCount = orientation == Orientation.portrait ? 4 : 6;
    int rowCount = (itemCount / crossAxisCount).ceil();
    double boxHeight = rowCount * 74;

    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Isi Ulang',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          SizedBox(
            height: boxHeight,
            child: GridView.count(
              crossAxisCount: crossAxisCount,
              childAspectRatio: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2.6)
                  : MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 0.9),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...topUpIcons.map(
                  (icon) => GestureDetector(
                    onTap: () {
                      if (icon.icon == 'pulsa') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PulsaPage(),
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
