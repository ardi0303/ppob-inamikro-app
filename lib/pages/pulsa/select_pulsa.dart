import 'package:flutter/material.dart';
import 'package:inamikro_app/datas/pulsa.dart';
import 'package:intl/intl.dart';

class SelectPulsaWidget extends StatefulWidget {
  final Function(int nominal, int price) onPulsaSelected; // Add this callback

  const SelectPulsaWidget({super.key, required this.onPulsaSelected});

  @override
  _SelectPulsaWidgetState createState() => _SelectPulsaWidgetState();
}

class _SelectPulsaWidgetState extends State<SelectPulsaWidget> {
  int? _selectedPulsaIndex;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    final numberFormat = NumberFormat('#,###', 'en_US');

    String formatWithPeriod(int value) {
      final formatted = numberFormat.format(value);
      return formatted.replaceAll(',', '.');
    }

    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28.0),
      child: SizedBox(
        height: 200,
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 4)
              : MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 0.9),
          children: [
            ...pulsaReguler[0].pulsa.asMap().entries.map(
              (entry) {
                int index = entry.key;
                var pulsa = entry.value;

                bool isSelected = _selectedPulsaIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPulsaIndex = index;
                    });
                    widget.onPulsaSelected(pulsa.nominal, pulsa.price); // Pass the selected nominal and price
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF1F9C81) : Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          formatWithPeriod(pulsa.nominal),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          "Bayar Rp ${formatWithPeriod(pulsa.price)}",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
