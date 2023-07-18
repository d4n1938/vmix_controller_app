import 'package:flutter/material.dart';

import '../base_client.dart';

class Controller extends StatelessWidget {
  List data;
  String ip;
  String port;
  Map<String, dynamic> newData = {};

  Controller(this.data, this.ip, this.port, {super.key}) {
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('controller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: data
              .map(
                (e) => ElevatedButton(
                    onPressed: () async {
                      var response = await BaseClient(ip, port)
                          .change(e["key"])
                          .catchError((err) {});
                      if (response == null) return;
                    },
                    child: SizedBox(
                      width: 100,
                      height: 80,
                      child: Center(child: Text(e["title"].toString())),
                    )),
              )
              .toList(),
        ),
      ),
    );
  }
}
