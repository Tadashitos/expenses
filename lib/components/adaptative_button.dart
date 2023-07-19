import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const AdaptativeButton(this.label, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(label))
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor),
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                  color: Theme.of(context).textTheme.labelLarge?.color),
            ),
          );
  }
}
