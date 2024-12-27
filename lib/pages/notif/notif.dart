import 'package:flutter/material.dart';
import 'package:inamikro_app/pages/notif/app_bar.dart';
import 'package:inamikro_app/pages/notif/notif_list.dart';

class Notif extends StatelessWidget {
  const Notif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const <Widget>[
                AppBarNotif(),
                NotifList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
