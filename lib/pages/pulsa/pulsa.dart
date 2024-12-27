// pulsa_page.dart
import 'package:flutter/material.dart';
import 'package:inamikro_app/datas/user.dart';
import 'package:inamikro_app/pages/pulsa/app_bar.dart';
import 'package:inamikro_app/pages/pulsa/payment.dart';
import 'package:inamikro_app/widget/balance.dart';
import 'package:inamikro_app/pages/pulsa/input_telp.dart';
import 'package:inamikro_app/widget/next_button.dart';
import 'package:inamikro_app/pages/pulsa/select_pulsa.dart';

class PulsaPage extends StatefulWidget {
  const PulsaPage({super.key});

  @override
  _PulsaPageState createState() => _PulsaPageState();
}

class _PulsaPageState extends State<PulsaPage> {
  int? _selectedNominal;
  int? _selectedPrice;
  String? _phoneNumber;

  void _handlePulsaSelected(int nominal, int price) {
    setState(() {
      _selectedNominal = nominal;
      _selectedPrice = price;
    });
  }

  void _handlePhoneNumberChanged(String phoneNumber) {
    setState(() {
      _phoneNumber = phoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                const AppBarPulsa(),
                BalanceWidget(user: userData[1]),
                InputTelpWidget(onPhoneNumberChanged: _handlePhoneNumberChanged),
                SelectPulsaWidget(onPulsaSelected: _handlePulsaSelected),
              ],
            ),
          ),
          NextButton(
            onPressed: () {
              if (_selectedNominal != null && _selectedPrice != null && _phoneNumber != null && _phoneNumber!.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentWidget(
                      nominal: _selectedNominal!,
                      price: _selectedPrice!,
                      phoneNumber: _phoneNumber!,
                    ),
                  ),
                );
              } else {
                // Handle if any required field is not filled
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pilih pulsa dan masukkan nomor telepon')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
