import 'package:flutter/material.dart';

class LayoutCustom extends StatelessWidget {
  final List<Widget> contenido;

  const LayoutCustom({super.key, required this.contenido});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        bool isDesktop = width > 700;

        return Material(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: Colors.black87,
                    width: 2.0,
                  ),
                  right: BorderSide(
                    color: Colors.black87,
                    width: 2.0,
                  ),
                ),
              ),
              width: isDesktop ? 800 : width,
              height: height,
              child: Column(
                children: contenido,
              ),
            ),
          ),
        );
      },
    );
  }
}
