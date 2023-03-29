import 'package:flutter/material.dart';

import '../base_client.dart';

class Controller extends StatelessWidget {
  List data;
  String ip;
  String port;
  Map<String, dynamic> newData = {};

  Controller(this.data, this.ip, this.port) {
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('controller'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: data
                .map(
                  (e) => ElevatedButton(
                      onPressed: () async {
                        try {
                          var response = await BaseClient(ip, port)
                              .change(e['number'])
                              .catchError((err) {});
                          if (response == null) return;
                        } catch (e) {}
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
      ),
    );
  }
}
