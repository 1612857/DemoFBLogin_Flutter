import 'package:flutter/material.dart';
import 'package:flutter_widget_tot/utils/hex_color.dart';

class FabCustom extends StatefulWidget {
  final Function() onPressed;
  final List<String> listChoose;

  FabCustom({this.onPressed, this.listChoose});

  @override
  _FabCustomState createState() => _FabCustomState();
}

class _FabCustomState extends State<FabCustom>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  List<Widget> listOption;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -10.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.7,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget defaultWidget() {
    return Container(
        height: 56.0,
        width: 120.0,
        decoration: new BoxDecoration(
            color: HexColor('000000'),
            borderRadius: new BorderRadius.circular(20)),
        child: Center(
          child: Text(
            'Hãng bất kỳ',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: HexColor('ffffff'), fontSize: 12.0),
          ),
        ));
  }

  Widget option(String label) {
    return Container(
        height: 56.0,
        width: 120.0,
        decoration: new BoxDecoration(
            color: HexColor('8d8d8d'),
            borderRadius: new BorderRadius.circular(20)),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: HexColor('ffffff'), fontSize: 12.0),
          ),
        ));
  }

  Widget main() {
    return InkWell(
      onTap: () {
        animate();
      },
      child: Container(
          height: 56.0,
          width: 120.0,
          decoration: new BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: new BorderRadius.circular(20)),
          child: Center(
            child: Text(
              'Hãng bất kỳ',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: HexColor('ffffff'), fontSize: 12.0),
            ),
          )),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 4.0,
            0.0,
          ),
          child: defaultWidget(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: option('Taxi Mai Linh'),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: option('VNTaxi'),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: option('Vinasun Taxi'),
        ),
        main(),
      ],
    );
  }
}
