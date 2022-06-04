import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {

  PasswordWidget();

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {

  bool _isHidden = true;
  void _togglePasswordView(){
    setState((){
      _isHidden = !_isHidden;
    });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width /1.25,
        child:  TextField(
          obscureText: _isHidden,
          textAlign: TextAlign.center,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffix: InkWell(
              onTap: _togglePasswordView,
              child: Icon( Icons.visibility),
            ),
            hintText: 'رمز عبور',
            labelStyle: TextStyle(
              color: Colors.black,
            ),

          ),

        ),
      ),
    );
  }
}