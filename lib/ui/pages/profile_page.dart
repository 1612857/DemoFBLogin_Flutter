import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_tot/blocs/application_bloc.dart';
import 'package:flutter_widget_tot/blocs/bloc_provider.dart';
import 'package:flutter_widget_tot/ui/customs/button_custom.dart';
import 'package:flutter_widget_tot/ui/customs/fab_custom.dart';
import 'package:flutter_widget_tot/ui/customs/safe_page.dart';
import 'package:flutter_widget_tot/utils/hex_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarTypeModel {
  final String id;
  final String size;
  final String money;
  final String distance;

  CarTypeModel({this.id, this.size, this.money, this.distance});

  CarTypeModel copyWith(
      {String id, String size, String money, String distance}) {
    return CarTypeModel(
        id: id ?? this.id,
        size: size ?? this.size,
        money: money ?? this.money,
        distance: distance ?? this.distance);
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage();

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with WidgetsBindingObserver {
  static const double APP_BAR_HEIGHT = 200.0;
  ApplicationBloc _appBloc;
  bool showFullSearch = false;
  bool showChooseLocationOnMap = true;
  String from = '';
  String to = '';
  double height = 0.0;
  List<Marker> listmarkers;
  List<LatLng> latlng = List();
  List<CarTypeModel> listCarType;

  CameraPosition _initialPosition = CameraPosition(
      target: LatLng(10.77729, 106.71082), zoom: 15.151926040649414);
  GoogleMapController controller;
  MapType _defaultMapType = MapType.normal;
  FocusNode myFocusNode;

  @override
  void initState() {
    _appBloc = BlocProvider.of<ApplicationBloc>(context);

    listCarType = [
      new CarTypeModel(id: '1', size: '4', money: '12000', distance: '1.2'),
      new CarTypeModel(id: '2', size: '7', money: '20000', distance: '1.2')
    ];
    _setpolyline();
    super.initState();
    myFocusNode = FocusNode();

    WidgetsBinding.instance.addObserver(this);
  }

  void _setpolyline() {
    latlng.add(new LatLng(10.77729, 106.71082));
    latlng.add(new LatLng(10.77735, 106.71075));
    latlng.add(new LatLng(10.77736, 106.71065));
    latlng.add(new LatLng(10.77733, 106.71053));
    latlng.add(new LatLng(10.7774, 106.71049));
    latlng.add(new LatLng(10.7776, 106.71032));
    latlng.add(new LatLng(10.77772, 106.7103));
    latlng.add(new LatLng(10.77895, 106.71087));
    latlng.add(new LatLng(10.77926, 106.71105));
    latlng.add(new LatLng(10.77929, 106.7111));
    latlng.add(new LatLng(10.77931, 106.71118));
    latlng.add(new LatLng(10.77931, 106.71126));
    latlng.add(new LatLng(10.7787, 106.71235));
    latlng.add(new LatLng(10.77868, 106.71243));
    latlng.add(new LatLng(10.77873, 106.71253));
    latlng.add(new LatLng(10.77902, 106.7127));
    latlng.add(new LatLng(10.77948, 106.71304));
    latlng.add(new LatLng(10.78043, 106.71387));
    latlng.add(new LatLng(10.78123, 106.71486));
    latlng.add(new LatLng(10.78127, 106.71495));
    latlng.add(new LatLng(10.78129, 106.71504));
    latlng.add(new LatLng(10.78128, 106.71514));
    latlng.add(new LatLng(10.7812, 106.71527));
    latlng.add(new LatLng(10.77982, 106.71626));
    latlng.add(new LatLng(10.77954, 106.71644));
    latlng.add(new LatLng(10.7795, 106.71645));
    latlng.add(new LatLng(10.77938, 106.71644));
    latlng.add(new LatLng(10.77923, 106.7164));
    latlng.add(new LatLng(10.77912, 106.71641));
    latlng.add(new LatLng(10.77888, 106.71649));
    latlng.add(new LatLng(10.77846, 106.71669));
    latlng.add(new LatLng(10.77829, 106.71684));
    latlng.add(new LatLng(10.77806, 106.71708));
    latlng.add(new LatLng(10.7778, 106.71726));
    latlng.add(new LatLng(10.77743, 106.71745));
    latlng.add(new LatLng(10.77712, 106.71763));
    latlng.add(new LatLng(10.77704, 106.71764));
    latlng.add(new LatLng(10.77696, 106.71762));
    latlng.add(new LatLng(10.77677, 106.71751));
    latlng.add(new LatLng(10.7767, 106.71749));
    latlng.add(new LatLng(10.77654, 106.71752));
    latlng.add(new LatLng(10.77589, 106.71707));
    latlng.add(new LatLng(10.77515, 106.7167));
    latlng.add(new LatLng(10.77432, 106.71649));
    latlng.add(new LatLng(10.77356, 106.71642));
    latlng.add(new LatLng(10.77302, 106.71644));
    latlng.add(new LatLng(10.77258, 106.71648));
    latlng.add(new LatLng(10.77236, 106.71653));
    latlng.add(new LatLng(10.77154, 106.71679));
    latlng.add(new LatLng(10.77136, 106.71684));
    latlng.add(new LatLng(10.77087, 106.7147));
    latlng.add(new LatLng(10.77071, 106.71371));
    latlng.add(new LatLng(10.77058, 106.71289));
    latlng.add(new LatLng(10.77032, 106.71147));
    latlng.add(new LatLng(10.76969, 106.70806));
    latlng.add(new LatLng(10.76937, 106.70626));
    latlng.add(new LatLng(10.76908, 106.70471));
    latlng.add(new LatLng(10.76894, 106.70419));
    latlng.add(new LatLng(10.76886, 106.70392));
    latlng.add(new LatLng(10.76856, 106.70325));
    latlng.add(new LatLng(10.76826, 106.70272));
    latlng.add(new LatLng(10.76797, 106.70233));
    latlng.add(new LatLng(10.76783, 106.70217));
    latlng.add(new LatLng(10.7671, 106.70161));
    latlng.add(new LatLng(10.76643, 106.70123));
    latlng.add(new LatLng(10.76602, 106.70095));
    latlng.add(new LatLng(10.76576, 106.70071));
    latlng.add(new LatLng(10.76554, 106.70043));
    latlng.add(new LatLng(10.7653, 106.7001));
    latlng.add(new LatLng(10.76495, 106.69952));
    latlng.add(new LatLng(10.76421, 106.69829));
    latlng.add(new LatLng(10.76406, 106.69808));
    latlng.add(new LatLng(10.76378, 106.69781));
    latlng.add(new LatLng(10.76291, 106.69713));
    latlng.add(new LatLng(10.76127, 106.69591));
    latlng.add(new LatLng(10.76092, 106.69565));
    latlng.add(new LatLng(10.7607, 106.69544));
    latlng.add(new LatLng(10.76027, 106.69492));
    latlng.add(new LatLng(10.7599, 106.69431));
    latlng.add(new LatLng(10.75913, 106.69299));
    latlng.add(new LatLng(10.75879, 106.69243));
    latlng.add(new LatLng(10.75841, 106.69187));
    latlng.add(new LatLng(10.75796, 106.69127));
    latlng.add(new LatLng(10.75728, 106.69044));
    latlng.add(new LatLng(10.7567, 106.68975));
    latlng.add(new LatLng(10.75593, 106.68891));
    latlng.add(new LatLng(10.75466, 106.6876));
    latlng.add(new LatLng(10.75414, 106.68704));
    latlng.add(new LatLng(10.7539, 106.68679));
    latlng.add(new LatLng(10.75351, 106.68647));
    latlng.add(new LatLng(10.75309, 106.68622));
    latlng.add(new LatLng(10.75251, 106.68597));
    latlng.add(new LatLng(10.75233, 106.68585));
    latlng.add(new LatLng(10.75216, 106.6857));
    latlng.add(new LatLng(10.75193, 106.68535));
    latlng.add(new LatLng(10.75177, 106.68497));
    latlng.add(new LatLng(10.75168, 106.6846));
    latlng.add(new LatLng(10.75169, 106.68417));
    latlng.add(new LatLng(10.75173, 106.68392));
    latlng.add(new LatLng(10.7518, 106.68365));
    latlng.add(new LatLng(10.75227, 106.68209));
    latlng.add(new LatLng(10.75245, 106.68142));
    latlng.add(new LatLng(10.75248, 106.68122));
    latlng.add(new LatLng(10.75248, 106.68082));
    latlng.add(new LatLng(10.75245, 106.6805));
    latlng.add(new LatLng(10.75229, 106.67954));
    latlng.add(new LatLng(10.75218, 106.67859));
    latlng.add(new LatLng(10.75218, 106.67827));
    latlng.add(new LatLng(10.75219, 106.67788));
    latlng.add(new LatLng(10.75216, 106.67769));
    latlng.add(new LatLng(10.75212, 106.67749));
    latlng.add(new LatLng(10.75203, 106.67725));
    latlng.add(new LatLng(10.75182, 106.67688));
    latlng.add(new LatLng(10.75151, 106.67658));
    latlng.add(new LatLng(10.75114, 106.67632));
    latlng.add(new LatLng(10.75092, 106.67622));
    latlng.add(new LatLng(10.75062, 106.67614));
    latlng.add(new LatLng(10.75024, 106.67602));
    latlng.add(new LatLng(10.7499, 106.6758));
    latlng.add(new LatLng(10.74959, 106.6755));
    latlng.add(new LatLng(10.74938, 106.67517));
    latlng.add(new LatLng(10.74928, 106.6749));
    latlng.add(new LatLng(10.74922, 106.67464));
    latlng.add(new LatLng(10.74918, 106.67431));
    latlng.add(new LatLng(10.74919, 106.67402));
    latlng.add(new LatLng(10.74927, 106.67342));
    latlng.add(new LatLng(10.74943, 106.67278));
    latlng.add(new LatLng(10.74995, 106.67142));
    latlng.add(new LatLng(10.75011, 106.67089));
    latlng.add(new LatLng(10.75016, 106.6706));
    latlng.add(new LatLng(10.75025, 106.66994));
    latlng.add(new LatLng(10.75032, 106.66938));
    latlng.add(new LatLng(10.75041, 106.66938));
    latlng.add(new LatLng(10.75048, 106.66901));
    latlng.add(new LatLng(10.75067, 106.66746));
    latlng.add(new LatLng(10.75069, 106.66717));
    latlng.add(new LatLng(10.75073, 106.66693));
    latlng.add(new LatLng(10.7509, 106.66694));
    latlng.add(new LatLng(10.75176, 106.66684));
    latlng.add(new LatLng(10.75217, 106.66678));
    latlng.add(new LatLng(10.75224, 106.6668));
    latlng.add(new LatLng(10.75338, 106.66666));
    latlng.add(new LatLng(10.75513, 106.66642));
    latlng.add(new LatLng(10.75602, 106.66631));
    latlng.add(new LatLng(10.75632, 106.6663));
    latlng.add(new LatLng(10.75765, 106.66596));
    latlng.add(new LatLng(10.75822, 106.66584));
    latlng.add(new LatLng(10.75865, 106.66572));
    latlng.add(new LatLng(10.75924, 106.66558));
    latlng.add(new LatLng(10.7591, 106.66495));
    latlng.add(new LatLng(10.75887, 106.66377));
    latlng.add(new LatLng(10.75866, 106.66274));
    latlng.add(new LatLng(10.75956, 106.6626));
    latlng.add(new LatLng(10.76054, 106.66242));
    latlng.add(new LatLng(10.76142, 106.66224));
    latlng.add(new LatLng(10.76175, 106.66215));
    latlng.add(new LatLng(10.76198, 106.6621));
    latlng.add(new LatLng(10.76238, 106.66202));
    latlng.add(new LatLng(10.76304, 106.6619));
    latlng.add(new LatLng(10.76326, 106.66186));
    latlng.add(new LatLng(10.76323, 106.66159));
    latlng.add(new LatLng(10.76313, 106.66114));
    latlng.add(new LatLng(10.76361, 106.66104));
    latlng.add(new LatLng(10.76378, 106.66101));

    _add_end_place(new LatLng(10.76378, 106.66101));
  }

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    myFocusNode.dispose();
    super.dispose();
  }

  _renderSearch(bool isShowFullSearch, bool isShowChooseLocationOnMap) {
    return Container(
      margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
      height: 220.0,
      decoration: new BoxDecoration(
        color: HexColor('ffffff00'),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 60.0,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: new BoxDecoration(
                color: HexColor('ffffff'),
                boxShadow: [
                  new BoxShadow(
                    color: HexColor('00000070'),
                    blurRadius: 10.0,
                  ),
                ],
                gradient: new LinearGradient(
                  colors: [Colors.white, Theme.of(context).primaryColor],
                  begin: Alignment.center,
                  end: new Alignment(1.0, -1.0),
                ),
                borderRadius: new BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  width: 300.0,
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Bạn đang ở đâu ? ',
                      fillColor: HexColor('ffffff'),
                      filled: true,
                    ),
                    onChanged: (String text) {
                      setState(() {
                        from = text;
                      });
                    },
                    onEditingComplete: () {
                      if (from.length == 0) {
                        setState(() {
                          isShowFullSearch = false;
                        });
                      }
                    },
                    onSubmitted: (String text) {
                      if (text.length > 0) {
                        setState(() {
                          showFullSearch = true;
                          height = 60.0;
                        });
                      } else {
                        setState(() {
                          showFullSearch = false;
                          height = 0.0;
                        });
                      }
                    },
                    style: TextStyle(fontSize: 16.0, color: HexColor('000000')),
                  ),
                ),
                from.length > 0
                    ? Icon(
                        Icons.cancel,
                        size: 30.0,
                        color: HexColor('00000070'),
                      )
                    : Container()
              ],
            ),
          ),
          Divider(),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: height,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: new BoxDecoration(
                color: HexColor('ffffff'),
                boxShadow: [
                  new BoxShadow(
                    color: HexColor('00000070'),
                    blurRadius: 10.0,
                  ),
                ],
                gradient: new LinearGradient(
                  colors: [Colors.white, Theme.of(context).primaryColor],
                  begin: Alignment.center,
                  end: new Alignment(1.0, -1.0),
                ),
                borderRadius: new BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                height > 0
                    ? Icon(
                        Icons.location_on,
                        size: 30.0,
                        color: Colors.red,
                      )
                    : Container(),
                Container(
                    width: 300.0,
                    child: height > 0
                        ? TextField(
                            focusNode: myFocusNode,
                            onChanged: (String text) {
                              setState(() {
                                to = text;
                              });
                            },
                            onSubmitted: (String text) {
                              if (text.length > 0) {
                                setState(() {
                                  showChooseLocationOnMap = false;
                                });
                              } else {}
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Bạn muốn đi đâu ?',
                              fillColor: HexColor('ffffff'),
                              filled: true,
                            ),
                            style: TextStyle(
                                fontSize: 16.0, color: HexColor('000000')),
                          )
                        : Container()),
                to.length > 0
                    ? Icon(
                        Icons.cancel,
                        size: 30.0,
                        color: HexColor('00000070'),
                      )
                    : Container()
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          showChooseLocationOnMap
              ? InkWell(
                  onTap: () {
                    // Routing().navigate2(context, MapLocationPicker(cameraPosition: _initialPosition,), replace: false);
                  },
                  child: Container(
                    height: 40.0,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: new BoxDecoration(
                        color: HexColor('ffffff'),
                        boxShadow: [
                          new BoxShadow(
                            color: HexColor('00000070'),
                            blurRadius: 10.0,
                          ),
                        ],
                        gradient: new LinearGradient(
                          colors: [
                            Colors.white,
                            Theme.of(context).primaryColor
                          ],
                          begin: Alignment.center,
                          end: new Alignment(1.0, -1.0),
                        ),
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.map,
                          size: 30.0,
                          color: HexColor('000000'),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text('Chọn vị trí trên bản đồ')
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  static final LatLng center = const LatLng(10.77729, 106.71082);
  final Set<Polyline> _polyline = {};

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 1;

  void _add_car(LatLng newPosition) {
    final String markerIdVal = 'Taxi_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.fromAsset("assets/images/car_picker.png"),
      position: LatLng(newPosition.latitude, newPosition.longitude),
      infoWindow: InfoWindow(title: markerIdVal, snippet: ''),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }
  void _add_end_place(LatLng newPosition) {
    final String markerIdVal = 'Taxi_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.fromAsset("assets/images/end_picker.png"),
      position: LatLng(newPosition.latitude, newPosition.longitude),
      infoWindow: InfoWindow(title: markerIdVal, snippet: ''),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  void _addMyLocal() {
    final String markerIdVal = 'You are here';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        center.latitude,
        center.longitude,
      ),
      infoWindow: InfoWindow(title: markerIdVal),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueGreen,
      ),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  void _remove() {
    setState(() {
      if (markers.containsKey(selectedMarker)) {
        markers.remove(selectedMarker);
      }
    });
  }

  _renderMap() {
    _addMyLocal();

    ///polyline
    _polyline.add(Polyline(
        polylineId: PolylineId(center.toString()),
        visible: true,
        //latlng is List<LatLng>
        points: latlng,
        color: Colors.blue,
        width: 3));
    return GoogleMap(
      markers: Set<Marker>.of(markers.values),
      polylines: [
        Polyline(
            polylineId: PolylineId('abc'),
            visible: true,
            points: latlng,
            color: Colors.blue,
            width: 5)
      ].toSet(),
      onMapCreated: _onMapCreated,
      initialCameraPosition: _initialPosition,
      myLocationButtonEnabled: true,
      compassEnabled: true,
      myLocationEnabled: true,
      mapType: _defaultMapType,
      rotateGesturesEnabled: true,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: true,
      zoomGesturesEnabled: true,
    );
  }

  _renderChooseCarType(List<CarTypeModel> listCarType) {
    return InkWell(
      onTap: () {
        _showModalChooseCarType(listCarType);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 60.0,
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: new BoxDecoration(
          color: HexColor('ffffff'),
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: [
            new BoxShadow(
              color: HexColor('00000070'),
              blurRadius: 10.0,
            ),
          ],
          gradient: new LinearGradient(
            colors: [Colors.white, HexColor('e5e5e5')],
            begin: Alignment.center,
            end: new Alignment(1.0, -1.0),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.network(
              'http://clipart-library.com/img/1239129.png',
              height: 60.0,
              width: 60.0,
              fit: BoxFit.contain,
            ),
            Column(
              children: <Widget>[
                Text(
                  'Phương tiện',
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: HexColor('00000070'), fontSize: 12.0),
                ),
                Text(
                  'Taxi ' + listCarType[0].size + ' Chỗ',
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: HexColor('00000070'), fontSize: 16.0),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Tạm tính',
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: HexColor('00000070'), fontSize: 12.0),
                ),
                Text(
                  listCarType[0].money + 'đ',
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: HexColor('00000070'), fontSize: 16.0),
                ),
                Text(
                  listCarType[0].distance + 'km',
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: HexColor('00000070'), fontSize: 12.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showModalChooseCarType(List<CarTypeModel> listCarType) {}

  _renderBottomButton() {
    return Container(
        width: MediaQuery.of(context).size.width - 60.0,
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: HexColor('00000070'),
              blurRadius: 10.0,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: ButtonCustom(
          label: 'ĐẶT XE',
          height: 50.0,
          radius: 5.0,
          color: HexColor('08b3e5'),
          padding: EdgeInsets.symmetric(horizontal: 40.0),
        ));
  }

  _renderChooseCompany() {
    return FabCustom(
      listChoose: ['Taxi Mai Linh', 'VNTaxi', 'Taxi Vinasun'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafePage(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            _renderMap(),
            // MapsDemo(),
            _renderSearch(showFullSearch, showChooseLocationOnMap),
            Positioned(
              bottom: 180.0,
              right: 30.0,
              child: _renderChooseCompany(),
            ),
            Positioned(
              bottom: 100.0,
              child: _renderChooseCarType(listCarType),
            ),
            Positioned(
              bottom: 30.0,
              child: _renderBottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}
