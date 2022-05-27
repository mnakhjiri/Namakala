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
              Expanded(
                child: LoginWelcome(),
              ),
            ],
          ),
        ],
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
        margin: EdgeInsets.only(top : MediaQuery.of(context).size.height/10),
        child: Text('وارد شوید',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height/30,

        ),
        ),
    );
  }
}
