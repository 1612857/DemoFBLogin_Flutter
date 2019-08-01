import 'package:flutter/material.dart';
import 'package:flutter_widget_tot/utils/utils.dart';
typedef OnButtonTap();

class AppBarCustom extends StatefulWidget {
  final String label;
  final String subLabel;
  final Widget leftIcon;
  final Widget rightIcon;
  final OnButtonTap onLeftTap;
  final OnButtonTap onRightTap;
  final bool labelOnly;
  final Color color;

  AppBarCustom(
      {this.subLabel,
      this.labelOnly = false,
      this.label,
      this.leftIcon,
      this.rightIcon,
      this.onLeftTap,
      this.onRightTap,
      this.color});

  @override
  State<StatefulWidget> createState() {
    return _AppBarCustomState();
  }
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    Widget leftView = SizedBox(width: 50.0);

    if (widget.labelOnly == false) {
      leftView = InkWell(
          child: Container(
              height: double.infinity,
              width: 50.0,
              child: widget.leftIcon != null
                  ? widget.leftIcon
                  : Icon(
                      Icons.arrow_back_ios,
                      color: primaryColor,
                    )),
          onTap: () {
            if (widget.onLeftTap != null) {
              widget.onLeftTap();
            } else {
              Navigator.pop(context);
            }
          });
    }

    Widget rightView = SizedBox(width: 50.0);
    if (widget.labelOnly == false &&
        (widget.onRightTap != null || widget.rightIcon != null)) {
      rightView = InkWell(
          child: Container(
              height: double.infinity,
              width: 50.0,
              child: widget.rightIcon != null
                  ? widget.rightIcon
                  : Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                    )),
          onTap: () {
            if (widget.onRightTap != null) {
              widget.onRightTap();
            }
          });
    }

    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        height: 50.0,
        child: Row(
          children: <Widget>[
            leftView,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.label,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.black87)),
                  Utils.isNotEmpty(widget.subLabel)
                      ? Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(widget.subLabel,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF8A8A8F))))
                      : Container()
                ],
              ),
            ),
            rightView
          ],
        ));
  }
}
