import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ExampleParallax(),
        ),
      ),
    );
  }
}

class ExampleParallax extends StatelessWidget {
  const ExampleParallax({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final location in locations)
            LocationListItem(
              imageUrl: location.imageUrl,
              name: location.name,
              country: location.place,
            ),
        ],
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  LocationListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.country,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final String country;
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
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.network(
          imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
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

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const locations = [
  Location(
    name: 'Celtics',
    place: 'Boston',
    imageUrl: 'images/celtics.jpg',
  ),
  Location(
    name: 'Knicks',
    place: 'New York',
    imageUrl: 'images/knicks.jpg',
  ),
  Location(
    name: 'Nets',
    place: 'Brooklyn',
    imageUrl: 'images/nets.jpg',
  ),
  Location(
    name: 'Sixers',
    place: 'Philadelphia',
    imageUrl: 'images/sixers.jpg',
  ),
  Location(
    name: 'Raptors',
    place: 'Toronto',
    imageUrl: 'images/raptors.jpg',
  ),
  Location(
    name: 'Bulls',
    place: 'Chicago',
    imageUrl: 'images/bulls.jpg',
  ),
  Location(
    name: 'Cavaliers',
    place: 'Cleveland',
    imageUrl: 'images/cavs.jpg',
  ),
  Location(
    name: 'Pistons',
    place: 'Detroit',
    imageUrl: 'images/pistons.jpg',
  ),
  Location(
    name: 'Pacers',
    place: 'Indianapolis',
    imageUrl: 'images/pacers.jpg',
  ),
  Location(
    name: 'Bucks',
    place: 'Milwaukee',
    imageUrl: 'images/bucks.jpg',
  ),
  Location(
    name: 'Hawks',
    place: 'Atlanta',
    imageUrl: 'images/hawks.jpeg',
  ),
  Location(
    name: 'Hornets',
    place: 'Charlotte',
    imageUrl: 'images/hornets.jpg',
  ),
  Location(
    name: 'Heat',
    place: 'Miami',
    imageUrl: 'images/heat.jpg',
  ),
  Location(
    name: 'Magic',
    place: 'Orlando',
    imageUrl: 'images/magic.jpg',
  ),
  Location(
    name: 'Wizards',
    place: 'Washington',
    imageUrl: 'images/wizards.jpg',
  ),
  Location(
    name: 'Nuggets',
    place: 'Denver',
    imageUrl: 'images/nuggets.jpeg',
  ),
  Location(
    name: 'Timberwolves',
    place: 'Minneapolis',
    imageUrl: 'images/timberwolves.jpg',
  ),
  Location(
    name: 'Thunder',
    place: 'Oklahoma City',
    imageUrl: 'images/thunder.jpg',
  ),
  Location(
    name: 'Blazers',
    place: 'Portland',
    imageUrl: 'images/blazers.jpg',
  ),
  Location(
    name: 'Jazz',
    place: 'Salt Lake City',
    imageUrl: 'images/jazz.jpg',
  ),
  Location(
    name: 'Warriors',
    place: 'San Francisco',
    imageUrl: 'images/warriors.jpg',
  ),
  Location(
    name: 'Clippers',
    place: 'Los Angeles',
    imageUrl: 'images/clippers.jpg',
  ),
  Location(
    name: 'Lakers',
    place: 'Los Angeles',
    imageUrl: 'images/lakers.jpg',
  ),
  Location(
    name: 'Suns',
    place: 'Phoenix',
    imageUrl: 'images/suns.jpg',
  ),
  Location(
    name: 'Kings',
    place: 'Sacramento',
    imageUrl: 'images/kings.jpg',
  ),
  Location(
    name: 'Mavericks',
    place: 'Dallas',
    imageUrl: 'images/mavericks.jpg',
  ),
  Location(
    name: 'Rockets',
    place: 'Houston',
    imageUrl: 'images/rockets.jpg',
  ),
  Location(
    name: 'Grizzlies',
    place: 'Memphis',
    imageUrl: 'images/grizzlies.jpg',
  ),
  Location(
    name: 'Spurs',
    place: 'San Antonio',
    imageUrl: 'images/spurs.jpeg',
  ),
  Location(
    name: 'Pelicans',
    place: 'New Orleans',
    imageUrl: 'images/pelicans.jpg',
  ),
];
