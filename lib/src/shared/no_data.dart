import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No data',
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(color: Colors.black54),
      ),
    );
  }
}
