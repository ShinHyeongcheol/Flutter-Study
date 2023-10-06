import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'hello World!',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 28,
      ),
    );
  }
}
