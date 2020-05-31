import 'package:flutter/material.dart';
import 'package:music_player/common/size_config.dart';

class CustomDrawer extends StatefulWidget {
  final Widget navMenu;
  final Widget homeScreen;
  const CustomDrawer({
    @required this.navMenu,
    @required this.homeScreen,
    Key key,
  }) : super(key: key);

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  Widget _navMenu;
  Widget _homeScreen;
  final double maxSlide = 225.0;
  AnimationController _animationController;

  final double minDragStartEdge = 50.0;
  bool _canBeDragged;

  @override
  void initState() {
    // get widgets
    _navMenu = widget.navMenu;
    _homeScreen = widget.homeScreen;

    // init animattion controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    super.initState();
  }

  void toggle() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
    print('toggle');
  }

  void open() {
    _animationController.fling(velocity: 1.0);
  }

  void close() {
    _animationController.fling(velocity: -1.0);
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;

    bool isDragCLoseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > minDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCLoseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    // if animation is already stopped at the beginning or end, do nothing
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }

    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      // control speed of animation according speed of drag
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: toggle,
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          double slide = maxSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);
          return Stack(
            children: <Widget>[
              _navMenu,
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: Material(
                  elevation: 15,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.scaledWidth(30),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(
                      //   SizeConfig.scaledWidth(30),
                      // ),
                      // boxShadow: <BoxShadow>[
                      //   BoxShadow(
                      //     color: Colors.black54,
                      //     blurRadius: 15.0,
                      //     offset: Offset(0.0, 0.75),
                      //   )
                      // ],
                    ),
                    child: _homeScreen,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
