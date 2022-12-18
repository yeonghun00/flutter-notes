import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final double yPosition;
  final bool isInverted;

  final blackColor = const Color(0xFF1F2123);

  const CurrencyCard(
      {super.key,
      required this.name,
      required this.code,
      required this.amount,
      required this.icon,
      required this.isInverted,
      required this.yPosition});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -yPosition),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25,
          ),
          color: isInverted ? Colors.white : blackColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 25,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: isInverted ? blackColor : Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 20,
                        color: isInverted ? blackColor : Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      code,
                      style: TextStyle(
                        color: isInverted
                            ? blackColor
                            : Colors.white.withOpacity(0.8),
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Transform.scale(
              scale: 2.1,
              child: Transform.translate(
                offset: const Offset(
                  -5,
                  10,
                ),
                child: Icon(
                  icon,
                  color: isInverted ? blackColor : Colors.white,
                  size: 60,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
