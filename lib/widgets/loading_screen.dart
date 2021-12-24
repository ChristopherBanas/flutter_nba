// Based on: https://github.com/ShreeyansB/fontina
import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/models/game.dart';
import 'package:flutter_nba/widgets/games_page/games_widget.dart';
import 'package:flutter_nba/widgets/standings_page/standings_widget.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  bool trig = false;
  double _textOpacity = 0;
  double _connOpacity = 0;
  double _fetchOpacity = 0;

  // @override
  // void didChangeDependencies() {
  //   for(final img in globals.imageMap.values){
  //     precacheImage(img.image, context);
  //   }
  //   super.didChangeDependencies();
  // }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-1.4, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutQuart,
  ));

  Future<bool> testFuture() async {
    await Future.delayed(Duration(milliseconds: 4000));
    return true;
  }

  void startAnim() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _controller.forward();
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            _textOpacity = 1;
          });
        });
        Future.delayed(Duration(milliseconds: 1400), () async {
          setState(() {
            _connOpacity = 1;
          });
          List<Game> gamesResult = await Get.put(GamesWidgetState().getAPIData());
          Map<String, dynamic> standingsResult = await Get.put(StandingsWidgetState().getAPIData());
          //setImages(gamesResult);
          // for(final img in globals.imageMap.values){
          //   precacheImage(img.image, context);
          // }
          setState(() {
            _connOpacity = 0;
          });
          await Future.delayed(Duration(milliseconds: 400));
          setState(() {
            _fetchOpacity = 1;
          });
          await Future.delayed(Duration(milliseconds: 2000));
          if (standingsResult.isNotEmpty && gamesResult.isNotEmpty) {
            Get.off(
                  () => HomeScreen(
                      standingsMap: standingsResult,
                      gamesList: gamesResult
                  ),
              transition: Transition.zoom,
              duration: Duration(milliseconds: 600),
              curve: Curves.easeOutQuad,
            );
          }
        });
      });
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      startAnim();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SlideTransition(
                      position: _offsetAnimation,
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: size.height * 0.060,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: AnimatedOpacity(
                        opacity: _textOpacity,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 400),
                        child: Image.asset(
                          "assets/images/secondary_logo.png",
                          height: size.height * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 400),
                    opacity: _connOpacity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 35,
                        ),
                        Text("Connecting to servers "),
                        SizedBox(
                          width: 40,
                          child: AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration(milliseconds: 400),
                            animatedTexts: [
                              TyperAnimatedText("...",
                                  speed: Duration(milliseconds: 400)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 400),
                    opacity: _fetchOpacity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 35,
                        ),
                        Text("Fetching data "),
                        SizedBox(
                          width: 40,
                          child: AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration(milliseconds: 400),
                            animatedTexts: [
                              TyperAnimatedText("...",
                                  speed: Duration(milliseconds: 400)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// setImages(List<Game> games) { //for pre loading
//   List<boxEnums> enumList = [boxEnums.TOP_POINTS, boxEnums.TOP_ASSISTS, boxEnums.TOP_REBOUNDS];
//   List<gameEnums> homeAway = [gameEnums.AWAY, gameEnums.HOME];
//   List<int> indexList  = [0,1,2];
//   for(final game in games){
//     for(final en in enumList){
//       for(final loc in homeAway){
//         for(final indx in indexList){
//           var id = game.valueMap[gameEnums.TOP_PERFORMERS][loc][en][indx].valueMap[boxEnums.PLAYER_ID];
//           Image image = Image.network(
//             'https://cdn.nba.com/headshots/nba/latest/1040x760/$id.png',
//             fit: BoxFit.cover,
//             width: 50,
//             height: 50,
//           );
//           if(!globals.imageMap.containsKey(id)){
//             globals.imageMap[id] = image;
//           }
//         }
//       }
//     }
//   }
// }