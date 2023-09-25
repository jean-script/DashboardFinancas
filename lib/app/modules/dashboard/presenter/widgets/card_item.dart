import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  final Widget childWidget;

  const CartItem({
    super.key,
    required this.widthSize,
    required this.heightSize,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize,
      width: widthSize,
      child: Card(
        color: const Color.fromARGB(255, 16, 16, 16),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: childWidget,
        ),
      ),
    );
  }
}
