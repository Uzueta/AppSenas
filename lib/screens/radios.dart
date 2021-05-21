import 'package:flutter/material.dart';

class Radios extends StatefulWidget {
  Radios({Key? key}) : super(key: key);

  @override
  _RadiosState createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
  late int selectedRadio;
  late int selectedRadioTile;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  var correcta = "1";
  var sub = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Radios")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RadioListTile(
              value: 1,
              groupValue: selectedRadioTile,
              title: Text("Radio 1"),
              subtitle: Text("$sub"),
              onChanged: (int? val) {
                print("Radio tile pressed $val");
                setSelectedRadioTile(int.parse("$val"));
              },
              activeColor: Colors.red,
            ),
            RadioListTile(
              value: 2,
              groupValue: selectedRadioTile,
              title: Text("Radio 2"),
              // subtitle: Text("Radio 2 subtitle"),
              onChanged: (int? val) {
                print("Radio tile pressed $val");
                setSelectedRadioTile(int.parse("$val"));
                // setState(() {

                // });
              },
              activeColor: Colors.red,
              // secondary: OutlinedButton(
              //   child: Text("Hi"),
              //   onPressed: () {
              //     print("Hello");
              //   },
              // ),
              // selected: false,
            ),
            Divider(
              height: 20,
              color: Colors.green,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setSelectedRadio(int.parse("$val"));
                  },
                ),
                Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    print("Radio $val");
                    setSelectedRadio(int.parse("$val"));
                  },
                )
              ],
            )
          ],
        ));
  }
}
