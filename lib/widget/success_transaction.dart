import 'package:flutter/material.dart';
import 'package:inamikro_app/pages/home/home_page.dart';

class SuccessTransactionWidget extends StatelessWidget {
  const SuccessTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/success_img.png',
                    width: 320,
                    height: 320,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Transaksi Berhasil!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC80009),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                ),
                child: const Text(
                  'SELESAI',
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
