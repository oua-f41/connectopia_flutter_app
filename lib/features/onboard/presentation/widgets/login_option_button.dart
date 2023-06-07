import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginOptionButton extends StatelessWidget {
  const LoginOptionButton({
    super.key,
    required this.symbol,
    required this.text,
    required this.onPressed,
  });

  final Widget symbol;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: context.verticalPaddingLow,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        ),
        onPressed: () {
          onPressed();
        },
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(26, 56, 56, 56)),
          ),
          width: context.dynamicWidth(0.8),
          height: context.dynamicHeight(0.06),
          child: Container(
            padding: context.horizontalPaddingNormal,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: symbol,
                ),
                Container(
                  padding: context.horizontalPaddingMedium,
                  child: Text(text,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 17)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
