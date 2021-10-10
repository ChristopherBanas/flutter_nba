import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../inherited_callback.dart';

class InfoHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Text("Info"),
          Tooltip(
            message: Theme.of(context).brightness == Brightness.light ? "Light mode" : "Dark mode",
            waitDuration: Duration(microseconds: 500000),
            child: new IconButton(
              onPressed: () => {
                if (Theme.of(context).brightness == Brightness.dark)
                  {
                    //currently dark, turn to light
                    InheritedCallBack.of(context).callBack.call(ThemeMode.light),
                  }
                else
                  {
                    //currently light, turn to dark
                    InheritedCallBack.of(context).callBack.call(ThemeMode.dark),
                  }
              },
              icon: new Icon(
                  (Theme.of(context).brightness == Brightness.light) ?
                  Icons.nightlight_round : Icons.wb_sunny
              ),
            ),
          )
        ],
      ),
    );
  }
}
