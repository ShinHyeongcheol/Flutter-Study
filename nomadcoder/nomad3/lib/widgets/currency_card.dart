import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  CurrencyCard(this.name, this.code, this.amount, this.icon, this.isInverted,
      {Key? key})
      : super(key: key);

  String name, code, amount;
  IconData icon;
  bool isInverted;

  Color black = Color(0xFF1F2123);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: isInverted ? black : Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color:
                            isInverted ? black : Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      code,
                      style: TextStyle(
                        color:
                            isInverted ? black : Colors.white.withOpacity(0.6),
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Transform.scale(
              scale: 2.2,
              child: Transform.translate(
                offset: Offset(
                  -5,
                  10,
                ),
                child: Icon(
                  icon,
                  color: isInverted ? black : Colors.white,
                  size: 78,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
