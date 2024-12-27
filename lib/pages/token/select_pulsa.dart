import 'package:flutter/material.dart';
import 'package:inamikro_app/datas/token.dart';
import 'package:intl/intl.dart';

class SelectTokenWidget extends StatefulWidget {
  final Function(int nominal, int price) onTokenSelected; // Add this callback

  const SelectTokenWidget({super.key, required this.onTokenSelected});

  @override
  _SelectTokenWidgetState createState() => _SelectTokenWidgetState();
}

class _SelectTokenWidgetState extends State<SelectTokenWidget> {
  int? _selectedTokenIndex;

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
            ...token.map(
              (tokens) {
                final index = token.indexOf(tokens);
                final isSelected = index == _selectedTokenIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTokenIndex = index;
                    });
                    widget.onTokenSelected(tokens.nominal, tokens.price); // Pass the selected nominal and price
                    print('Nominal: ${tokens.nominal}, Price: ${tokens.price}');
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
                          formatWithPeriod(tokens.nominal),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          "Bayar Rp ${formatWithPeriod(tokens.price)}",
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
