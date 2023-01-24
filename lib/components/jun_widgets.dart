import 'package:flutter/material.dart';

import 'jun_constants.dart';

class BottomoSheetBody extends StatelessWidget {
  const BottomoSheetBody({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: pagePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
