import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback customTab;
  final String texto;

  const CustomButton({
    super.key,
    required this.texto,
    required this.customTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FilledButton(
            child: Text(
              texto,
              style: TextStyle(fontSize: 15),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: customTab,
          ),
        ));
  }
}
