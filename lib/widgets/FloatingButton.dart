import 'package:flutter/material.dart';

import '../pages/Cart.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  CartPage()));
      },
      child: Icon(Icons.shopping_bag_outlined),
      backgroundColor: Colors.red,
    );
  }
}
