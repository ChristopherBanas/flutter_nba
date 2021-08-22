import 'package:flutter/cupertino.dart';

class CustomDataCell extends StatelessWidget {
  final dynamic data;

  const CustomDataCell({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(
          '$data',
          textAlign: TextAlign.right,
        ),
    );
  }
}
