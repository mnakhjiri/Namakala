import 'package:flutter/material.dart';

import '../widgets/NavigationBar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginWelcome(),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
          child: SizedBox(
            width: MediaQuery.of(context).size.width /1.25,
            child: const TextField(
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'شماره تماس',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),

              ),

            ),
          ),
        ),
        PasswordWidget(),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
          child: SizedBox(
            width: MediaQuery.of(context).size.width /1.25,
            height: MediaQuery.of(context).size.height / 15,
            child: ElevatedButton(onPressed: (){}, child:
            Text('ورود', style: TextStyle(color: Colors.white, fontFamily: 'vazirbold' , fontSize: 17),),
              style:
              ElevatedButton.styleFrom(
                primary: Color(0xFFf72500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
          child: SizedBox(
            width: MediaQuery.of(context).size.width /1.50,
            height: MediaQuery.of(context).size.height / 20,
            child: ElevatedButton(onPressed: (){}, child:
            Text('ثبت نام', style: TextStyle(color: Colors.white, fontFamily: 'vazirbold' , fontSize: 17),),
              style:
              ElevatedButton.styleFrom(
                primary: Color(0xFF050400
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
        );
  }
}

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({
    Key? key,
  }) : super(key: key);

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

class LoginWelcome extends StatelessWidget {
  const LoginWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top : MediaQuery.of(context).size.height/5),
        child: Text('وارد شوید',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height/20,
          fontFamily: 'vazirbold',
        ),
          textAlign: TextAlign.center,
        ),
    );
  }
}