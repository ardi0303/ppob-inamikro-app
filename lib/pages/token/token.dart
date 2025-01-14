import 'package:flutter/material.dart';
import 'package:inamikro_app/datas/customer_number.dart';
import 'package:inamikro_app/datas/user.dart';
import 'package:inamikro_app/models/customer_number.dart';
import 'package:inamikro_app/pages/token/app_bar.dart';
import 'package:inamikro_app/pages/token/input_cust_number.dart';
import 'package:inamikro_app/pages/token/payment.dart';
import 'package:inamikro_app/pages/token/select_pulsa.dart';
import 'package:inamikro_app/widget/balance.dart';
import 'package:inamikro_app/widget/next_button.dart';

class TokenPage extends StatefulWidget {
  const TokenPage({super.key});

  @override
  _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  int? _selectedNominal;
  int? _selectedPrice;
  String? _customerNumber;

  // Fungsi untuk mendapatkan nama pelanggan berdasarkan nomor telepon
  String? getCustomerName(String customerNumber) {
    final customer = customerNumberList.firstWhere(
      (customer) => customer.nomor.toString() == customerNumber,
      orElse: () => CustomerNumber(id: -1, nama: 'Unknown', nomor: 0),
    );
    return customer.nama != 'Unknown' ? customer.nama : null;
  }

  void _handleTokenSelected(int nominal, int price) {
    setState(() {
      _selectedNominal = nominal;
      _selectedPrice = price;
    });
  }

  void _handleCustomerNumber(String customerNumber) {
    setState(() {
      _customerNumber = customerNumber;
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
                const AppBarToken(),
                BalanceWidget(user: userData[1]),
                InputCustomerNumber(onCustomerNumber: _handleCustomerNumber),
                SelectTokenWidget(onTokenSelected: _handleTokenSelected),
              ],
            ),
          ),
          NextButton(
            onPressed: () {
              if (_selectedNominal != null &&
                  _selectedPrice != null &&
                  _customerNumber != null &&
                  _customerNumber!.isNotEmpty) {
                final customerName = getCustomerName(_customerNumber!);
                if (customerName != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentWidget(
                        nominal: _selectedNominal!,
                        price: _selectedPrice!,
                        customerNumber: _customerNumber!,
                        customerName: customerName,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Nomor meteran tidak ditemukan')),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Pilih pulsa dan masukkan nomor meteran')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
