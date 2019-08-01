import 'package:flutter/material.dart';
import 'package:flutter_widget_tot/utils/hex_color.dart';

typedef OnButtonTap();

class ButtonCustom extends StatefulWidget {
  final String label;
  final OnButtonTap onTap;
  final EdgeInsets padding;
  final Color color;
  final double radius;
  final bool wrap;
  final double height;
  final bool outLine;

  ButtonCustom(
      {@required this.label,
      this.wrap = false,
      this.onTap,
      this.padding = EdgeInsets.zero,
      this.color,
      this.height = 50.0,
      this.radius = 30.0,
      this.outLine = false});

  @override
  State<StatefulWidget> createState() {
    return _ButtonCustomState();
  }
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    Color bkgColor =
        widget.color == null ? Theme.of(context).primaryColor : widget.color;

    Widget button = Text(widget.label,
        style: TextStyle(
            fontSize: 16.0, color: widget.outLine ? bkgColor : Colors.white));

    return Container(
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          color: Colors.white, // bkgColor,
          gradient: widget.outLine
              ? null
              : LinearGradient(
                  begin: Alignment.topRight, // new
                  end: Alignment.bottomLeft, // new
                  stops: [0.1, 0.9],
                  colors: [HexColor('#70DE3C'), HexColor('#4AB747')],
                ),
          border: widget.outLine
              ? Border.all(color: bkgColor, width: 1.5)
              : Border.all(style: BorderStyle.none)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap();
            }
          },
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          child: widget.wrap
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[button])
              : Center(child: button),
        ),
      ),
    );
  }
}
