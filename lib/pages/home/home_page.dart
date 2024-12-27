import 'package:flutter/material.dart';
import 'package:inamikro_app/datas/user.dart';
import 'package:inamikro_app/pages/home/app_bar.dart';
import 'package:inamikro_app/pages/home/carousel.dart';
import 'package:inamikro_app/pages/home/digital_payment.dart';
import 'package:inamikro_app/pages/home/top_up.dart';
import 'package:inamikro_app/widget/balance.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView(
        children: <Widget>[
          const AppBarPPOB(),
          const CarouselWidget(),
          BalanceWidget(user: userData[1]),
          const TopUpWidget(),
          const DigitalPaymentWidget()
        ],
      ),
    );
  }
}
