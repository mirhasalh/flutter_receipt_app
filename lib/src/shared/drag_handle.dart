import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/palette.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8.0, bottom: 12.0),
            height: 4.0,
            width: 45.0,
            decoration: BoxDecoration(
              color: Palette.cultured,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ],
      );
}
