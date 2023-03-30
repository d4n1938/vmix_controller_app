import 'package:flutter/material.dart';
import 'package:vmix_controller_app/base_client.dart';
import 'package:vmix_controller_app/pages/controller.dart';

class Addressconfig extends StatefulWidget {
  const Addressconfig({super.key});

  @override
  State<Addressconfig> createState() => _AddressconfigState();
}

class _AddressconfigState extends State<Addressconfig> {
  var fieldIp = "192.168.3.8";
  var fieldPort = "8088";

  var err = false;

  void showErr() {
    setState(() {
      err = true;
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        err = false;
      });
    });
  }

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
            err
                ? const Text(
                    "device not found ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 7, 57), fontSize: 20),
                  )
                : const Text(""),
            ElevatedButton(
                onPressed: () async {
                  var response = await BaseClient(fieldIp, fieldPort)
                      .get()
                      .catchError((err) {});
                  if (response == null) {
                    showErr();
                    return;
                  }

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Controller(response, fieldIp, fieldPort)),
                  );
                },
                child: const Text("start")),
          ],
        ),
      ),
    );
  }
}
