import 'package:flutter/cupertino.dart';

class CustomDataCell extends StatelessWidget {
  final dynamic data;
  final EdgeInsets padding;

  const CustomDataCell({
    required this.data,
    required this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: padding,
          child: Text(
              '$data',
              textAlign: TextAlign.right,
          ),
        )
    );
  }
}
