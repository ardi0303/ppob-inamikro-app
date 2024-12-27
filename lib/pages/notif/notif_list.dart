import 'package:flutter/material.dart';
import 'package:inamikro_app/datas/notif.dart';

class NotifList extends StatelessWidget {
  const NotifList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 28.0, right: 28.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: notification.length,
          itemBuilder: (context, index) {
            final notif = notification[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, right: 18.0, left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notif.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Text(
                      notif.desc,
                      style: const TextStyle(fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      notif.time,
                      style: const TextStyle(color: Colors.red, fontSize: 11),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
