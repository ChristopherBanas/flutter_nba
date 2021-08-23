import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/database_models/game.dart';


class GameItem extends StatelessWidget {
  GameItem({
    Key? key,
    required this.image,
    required this.gameModel,
  }) : super(key: key);

  final String image;
  final Game gameModel;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              buildBackground(context),
              //_buildGradient(),
              buildSummary(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.network(
          image,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  // Widget _buildGradient() {
  //   return Positioned.fill(
  //     child: DecoratedBox(
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //           stops: [0.6, 0.95],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget buildSummary(context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned.fill(
          top: 220,
          child: Card(
              color: Theme.of(context).cardColor.withOpacity(.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: IntrinsicWidth(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${gameModel.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY].valueMap[boxEnums.PTS]}',
                            style: TextStyle(
                                //color: Colors.black,
                                fontSize: 20
                            ),
                          ),
                          Text(
                            '${gameModel.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY].valueMap[boxEnums.TEAM_ABBREVIATION]}',
                            style: TextStyle(
                                //color: Colors.black,
                                fontSize: 20
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 20, 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${gameModel.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME].valueMap[boxEnums.PTS]}',
                            style: TextStyle(
                                //color: Colors.black,
                                fontSize: 20
                            ),
                          ),
                          Text(
                            gameModel.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME].valueMap[boxEnums.TEAM_ABBREVIATION],
                            style: TextStyle(
                                //color: Colors.black,
                                fontSize: 20
                            ),
                          )
                        ],
                      ),
                    ),
                    // Expanded(...)
                  ],
                ),
              )
          )
          // child: Row(
          //   children: [
          //     Column(
          //       children: [
          //         Text(
          //           '${gameModel.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY].valueMap[boxEnums.PTS]}',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 40
          //           ),
          //         ),
          //         Text(
          //           gameModel.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY].valueMap[boxEnums.TEAM_ABBREVIATION],
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 40
          //           ),
          //         )
          //       ],
          //     ),
          //     //Spacer(),
          //     Column(
          //       children: [
          //         Text(
          //           '${gameModel.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME].valueMap[boxEnums.PTS]}',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 40
          //           ),
          //         ),
          //         Text(
          //           gameModel.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME].valueMap[boxEnums.TEAM_ABBREVIATION],
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 40
          //           ),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ]
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
    (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
    verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
      Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Parallax extends SingleChildRenderObjectWidget {
  Parallax({
    required Widget background,
  }) : super(child: background);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderParallax(scrollable: Scrollable.of(context)!);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderParallax renderObject) {
    renderObject.scrollable = Scrollable.of(context)!;
  }
}

class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderParallax extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderParallax({
    required ScrollableState scrollable,
  }) : _scrollable = scrollable;

  ScrollableState _scrollable;

  ScrollableState get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    if (value != _scrollable) {
      if (attached) {
        _scrollable.position.removeListener(markNeedsLayout);
      }
      _scrollable = value;
      if (attached) {
        _scrollable.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! ParallaxParentData) {
      child.parentData = ParallaxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    // Force the background to take up all available width
    // and then scale its height based on the image's aspect ratio.
    final background = child!;
    final backgroundImageConstraints =
    BoxConstraints.tightFor(width: size.width);
    background.layout(backgroundImageConstraints, parentUsesSize: true);

    // Set the background's local offset, which is zero.
    (background.parentData as ParallaxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Get the size of the scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;

    // Calculate the global position of this list item.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final backgroundOffset =
    localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final scrollFraction =
    (backgroundOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect =
    verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
        background,
        (background.parentData as ParallaxParentData).offset +
            offset +
            Offset(0.0, childRect.top));
  }
}