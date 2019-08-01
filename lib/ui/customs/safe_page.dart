

import 'package:flutter/material.dart';

class SafePage extends StatefulWidget {
  final Widget child;
  final Color bkgColor;
  final Widget floatButton;
  final FloatingActionButtonLocation floatLocation;
  final bool fullScreen;
  final Drawer drawer;
  final PreferredSizeWidget appBar;

  SafePage({this.child, this.bkgColor, this.floatButton, this.floatLocation, this.fullScreen = false, this.drawer, this.appBar});

  @override
  State<StatefulWidget> createState() {
    return _SafePageState();
  }
}

class _SafePageState extends State<SafePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          bottom: false,
          top: widget.fullScreen ? false : true,
          child: Scaffold(
            appBar: widget.appBar,
            drawer: widget.drawer,
            floatingActionButton: widget.floatButton,
            floatingActionButtonLocation: widget.floatLocation,
            backgroundColor: widget.bkgColor != null ? widget.bkgColor : Colors.white,
            body: widget.child,
          )),
    );
  }
}