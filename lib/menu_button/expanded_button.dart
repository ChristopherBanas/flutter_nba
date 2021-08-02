import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final VoidCallback onFlip;
  final buttonIcon;

  const ExpandedButton({
    required this.onFlip,
    required this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).primaryColor,
          elevation: 4.0,
          child: InkWell(
            onTap: onFlip,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                buttonIcon,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
