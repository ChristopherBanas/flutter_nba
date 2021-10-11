import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoBody extends StatelessWidget {

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url, forceSafariVC: false);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Special thanks to Bellair, Hayden, Christ, Mooch, Holmes, Queen E\n",
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "Built by Chris Banas at RIT with Dart + Flutter in 2021\n"
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Linkify(
              textAlign: TextAlign.left,
              onOpen: (link) => {_onOpen(link)},
              text: "Backend API supported by https://github.com/swar/nba_api",
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Linkify(
              textAlign: TextAlign.left,
              onOpen: (link) => {_onOpen(link)},
              text: "Loading screen based on https://github.com/ShreeyansB/fontina",
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "\nThank you to Ben Simmons for inspiring me not to be a quitter\n"
            ),
          ),
        ]
      ),
    );
  }
}
