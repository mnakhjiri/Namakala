import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {

  var radioName;
  var radioItems;

  @override
  State<RadioGroup> createState() => _RadioGroupWidget();
  RadioGroup(this.radioName, this.radioItems);

}

class _RadioGroupWidget extends State<RadioGroup> {

  var name ;
  var items;
  int? _value = 1;
  // List<Widget> list = [Text(widget.radioName)]
  int i = 0;

  @override
  Widget build(BuildContext context) {
    // for(var item in items ){
    //   list.add(
    //       Radio(
    //         fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
    //         value: i,
    //         groupValue: _value,
    //         onChanged: (int? value) {
    //           setState(() {
    //             _value = value;
    //             print(_value);
    //           });
    //         },
    //       )
    //   );
    //   list.add(
    //     Text(
    //       item,
    //       style: new TextStyle(fontSize: 17.0),
    //     ),
    //   );
    //   i++;
    // }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for(int i = 0 ; i < widget.radioItems.length ; i++)
          Expanded(
            child: Directionality(
              
              textDirection: TextDirection.rtl,
              child: ListTile(
                title: Text(
                  widget.radioItems[i],
                ),
                leading: Radio(
                  value: i,
                  groupValue: _value,
                  activeColor: Colors.red,
                  onChanged: i == widget.radioItems.length ? null : (int? value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
            ),
          ),
      ]
    );
  }
}


// <Widget>[
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
//
// Radio(
// fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
// value: 1,
// groupValue: id,
// onChanged: (val) {
// setState(() {
// radioButtonItem = 'ONE';
// id = 1;
// });
// },
// ),
// Text(
// 'رنگ سفید',
// style: new TextStyle(fontSize: 17.0),
// ),
//
// Radio(
// fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
// value: 2,
// groupValue: id,
// onChanged: (val) {
// setState(() {
// radioButtonItem = 'TWO';
// id = 2;
// });
// },
// ),
// Text(
// 'رنگ مشکی',
// style: new TextStyle(
// fontSize: 17.0,
// ),
// ),
//
// Radio(
// fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
// value: 3,
// groupValue: id,
// onChanged: (val) {
// setState(() {
// radioButtonItem = 'THREE';
// id = 3;
// });
// },
// ),
// Text(
// 'رنگ قرمز',
// style: new TextStyle(fontSize: 17.0),
// ),
// ],
// ),
// ],