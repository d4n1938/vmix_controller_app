import 'package:flutter/material.dart';
import 'package:vmix_controller_app/base_client.dart';

class Addressconfig extends StatefulWidget {
  const Addressconfig({super.key});

  @override
  State<Addressconfig> createState() => _AddressconfigState();
}

class _AddressconfigState extends State<Addressconfig> {
  var fieldIp = "0.0.0.0";
  var fieldPort = "8088";

  late TextEditingController _textEditingControllerIp;
  late TextEditingController _textEditingControllerPort;

  @override
  void initState() {
    super.initState();
    _textEditingControllerIp = TextEditingController(text: fieldIp);
    _textEditingControllerPort = TextEditingController(text: fieldPort);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              style: const TextStyle(
                fontSize: 70,
              ),
              onChanged: (value) => {
                setState(() {
                  fieldIp = value;
                })
              },
              textAlign: TextAlign.center,
              controller: _textEditingControllerIp,
            ),
            TextField(
              style: const TextStyle(
                fontSize: 70,
              ),
              onChanged: (value) => {
                setState(() {
                  fieldPort = value;
                })
              },
              textAlign: TextAlign.center,
              controller: _textEditingControllerPort,
            ),
            ElevatedButton(
                onPressed: () async {
                  print(fieldIp);
                  print(fieldPort);
                  var response = await BaseClient()
                      .get(fieldIp, fieldPort, fieldIp)
                      .catchError((err) {});
                  if (response == null) return;
                  print("success");
                },
                child: const Text("start")),
          ],
        ),
      ),
    );
  }
}
