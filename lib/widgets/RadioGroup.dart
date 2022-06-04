import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State {

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'ONE';
                  id = 1;
                });
              },
            ),
            Text(
              'رنگ سفید',
              style: new TextStyle(fontSize: 17.0),
            ),

            Radio(
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'TWO';
                  id = 2;
                });
              },
            ),
            Text(
              'رنگ مشکی',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),

            Radio(
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              value: 3,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'THREE';
                  id = 3;
                });
              },
            ),
            Text(
              'رنگ قرمز',
              style: new TextStyle(fontSize: 17.0),
            ),
          ],
        ),
      ],
    );
  }
}