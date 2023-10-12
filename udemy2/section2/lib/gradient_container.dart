import 'package:flutter/material.dart';
import 'package:section2/text_container.dart';
import 'dart:math';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatefulWidget {
  const GradientContainer(this.colora, this.colorb, {Key? key})
      : super(key: key);

  const GradientContainer.purple({super.key})
      : colora = Colors.deepPurple,
        colorb = Colors.indigo;

  final Color colora;
  final Color colorb;

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  var diceNum = 'assets/images/dice1.png';

  void rollDice() {
    var dice = Random().nextInt(6)+1;
    setState(() {
      diceNum = 'assets/images/dice$dice.png';
    });
    print('change');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.colora,
            widget.colorb,
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              diceNum,
              width: 100,
              height: 100,
            ),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 28,
                ),
              ),
              child: const Text('Roll'),
            )
          ],
        ),
      ),
    );
  }
}
