import 'package:flutter/material.dart';
import 'package:inamikro_app/datas/user.dart';
import 'package:inamikro_app/widget/balance.dart';
import 'package:inamikro_app/widget/merchant_pin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PaymentWidget extends StatelessWidget {
  final int nominal;
  final int price;
  final String customerNumber;
  final String customerName;

  const PaymentWidget(
      {super.key,
      required this.nominal,
      required this.price,
      required this.customerNumber,
      required this.customerName});

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,###', 'en_US');

    // Function to format number with periods as thousands separators
    String formatWithPeriod(int value) {
      final formatted = numberFormat.format(value);
      return formatted.replaceAll(',', '.');
    }

    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 28.0, right: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/button-back.svg',
                      ),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'KONFIRMASI PEMBAYARAN',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BalanceWidget(user: userData[1]),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Token Listrik PLN $nominal',
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            )),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Nomor Meteran',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text(
                                  customerNumber,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Nama Pelanggan',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text(
                                  customerName,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          // Add a divider below phone number
                          thickness: 1.0, // Set the thickness of the line
                          color: Colors.grey, // Set the color of the line
                        ),
                      ],
                    ),
                    // Add further payment details and process here
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Harga Token',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text('Rp ${formatWithPeriod(price)}',
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Saldo Awal',
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Rp ${formatWithPeriod(userData[1].balance.toInt())}',
                              style: const TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Saldo Akhir',
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Rp ${formatWithPeriod(userData[1].balance.toInt() - price)}',
                              style: const TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 28.0, left: 28.0, bottom: 40.0),
          child: SizedBox(
            height: 38.0,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MerchantPinWidget(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC80009),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0), // Rounded corners
                ),
              ),
              child: const Text(
                'BAYAR',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
