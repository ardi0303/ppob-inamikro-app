import 'package:flutter/material.dart';
import 'package:inamikro_app/widget/success_transaction.dart';
import 'package:pinput/pinput.dart';

class MerchantPinWidget extends StatelessWidget {
  const MerchantPinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 48,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 124),
                  child: Column(
                    children: [
                      Image.asset('assets/images/inamikro_logo.png',
                          width: 196, height: 50),
                      const SizedBox(height: 30),
                      const Text(
                        'Masukkan PIN Anda',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        obscureText: true,
                        obscuringCharacter: '*',
                        // ignore: avoid_print
                        onCompleted: (pin) => print('Entered PIN: $pin'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 28.0, left: 28.0, bottom: 40.0),
            child: SizedBox(
              height: 38.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessTransactionWidget(),
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
      ),
    );
  }
}
