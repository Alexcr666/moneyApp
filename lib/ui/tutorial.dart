import 'dart:async';
import 'dart:io';

import 'package:custom_switch/custom_switch.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../app/app_colors.dart';
import '../assets/assets.dart';
import '../generated/l10n.dart';
import '../styles/style.dart';

void main() => runApp(MaterialApp(home: QRViewExample()));

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode result;
  QRViewController controller;
  String _dropdownValueCountry = 'Card';

  bool checkSignUp = false;

  List<String> _spinnerItemsCountry = ['Card'];

  int _groupValue = -1;
  bool status = false;

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      //contentPadding: EdgeInsets.all(0),
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppbar(context, "QR"),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: SizedBox(),
          )
          /* Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                  else
                    Text('Scan a code'),
                 /* Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data)}');
                                } else {
                                  return Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),*/
                 /* Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: Text('pause', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: Text('resume', style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),*/
                ],
              ),
            ),
          )*/
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 250.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.back,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 10,
        borderLength: 300,
        borderWidth: 3,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  List<String> _tempListOfCities;

  //1
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textController = new TextEditingController();

  //2
  static List<String> _listOfCities = <String>[
    "Tokyo",
    "New York",
    "London",
    "Paris",
    "Madrid",
    "Dubai",
    "Rome",
    "Barcelona",
    "Cologne",
    "Monte Carlo",
    "Puebla",
    "Florence"
  ];

  void _showModal(context) {
    showModalBottomSheet(
        enableDrag: true,
        barrierColor: Colors.black.withAlpha(1),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        //isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          //3
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return WillPopScope(
              onWillPop: () {
                fuctionBack(context);
                fuctionBack(context);
              },
              child: DraggableScrollableSheet(
                  expand: false,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Column(mainAxisSize: MainAxisSize.min, children: <
                        Widget>[
                      SizedBox(
                        height: 130,
                      ),
                      GestureDetector(
                        onTap: () {
                          alertScanQrCode(context);
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(),
                            ),
                            Icon(
                              Icons.keyboard,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              AppLocalizations.of(context).entermanually,
                              style: styleText(20, Colors.white, false),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            controller: scrollController,
                            //shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (_, index) {
                              return Container(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.keyboard_arrow_up_rounded,
                                        size: 40,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          AppLocalizations.of(context).myqrcode,
                                          style:
                                              styleText(20, Colors.black, true),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Jhon Smith",
                                        style: styleText(
                                            15, AppColors.primaryColor, false),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "189.01",
                                        style: styleText(
                                            25, AppColors.primaryColor, true),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)
                                            .yourbalance,
                                        style: styleText(
                                            15, AppColors.primaryColor, false),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 130,
                                        height: 130,
                                        margin: EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                          assetsQrCode,
                                          color: Colors.black,
                                          allowDrawingOutsideViewBox: true,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            margin: EdgeInsets.all(10),
                                            child: SvgPicture.asset(
                                              assetsQrCode,
                                              color: Colors.black,
                                              allowDrawingOutsideViewBox: true,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          CustomSwitch(
                                            activeColor: AppColors.primaryColor,
                                            value: status,
                                            onChanged: (value) {
                                              print("VALUE : $value");
                                              setState(() {
                                                status = value;
                                              });
                                            },
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            margin: EdgeInsets.all(10),
                                            child: SvgPicture.asset(
                                              assetsQrCode,
                                              color: Colors.black,
                                              allowDrawingOutsideViewBox: true,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .ifbalancedescription,
                                          style: styleText(15,
                                              AppColors.primaryColor, false),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          /* Container(
                                     width: 30,height: 30,
                                     margin: EdgeInsets.only(bottom: 20),
                                     child: CheckboxListTile(


                                                title: GestureDetector(
                                                  onTap: (){
                                                    alertTerms(context);
                                                  },
                                                  child: Text(
                                                    "Accept terms and conditions",
                                                    style: styleText(17, Colors.white, false),
                                                  ),
                                                ),
                                                value: checkSignUp,
                                                onChanged: (newValue) {
                                                  checkSignUp = newValue;
                                                  setState(() {});
                                                },
                                                controlAffinity: ListTileControlAffinity
                                                    .leading, //  <-- leading Checkbox
                                              ),
                                   ),*/
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Flexible(
                                            child: Container(
                                              decoration: decorationContainer(),
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              width: double.infinity,
                                              child: DropdownButton<String>(
                                                isExpanded: true,
                                                value: _dropdownValueCountry,
                                                icon:
                                                    Icon(Icons.arrow_drop_down),
                                                iconSize: 24,
                                                elevation: 16,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18),
                                                underline: Container(
                                                  height: 2,
                                                  color: Colors.white,
                                                ),
                                                onChanged: (String data) {
                                                  setState(() {
                                                    _dropdownValueCountry =
                                                        data;
                                                  });
                                                },
                                                items: _spinnerItemsCountry.map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]);
                  }),
            );
          });
        }).whenComplete(() {
      _showModal(context);
    });
  }

  //8
  Widget _showBottomSheetWithSearch(int index, List<String> listOfCities) {
    return Text(listOfCities[index],
        style: TextStyle(color: Colors.black, fontSize: 16),
        textAlign: TextAlign.center);
  }

  //9
  List<String> _buildSearchList(String userSearchTerm) {
    List<String> _searchList = List();

    for (int i = 0; i < _listOfCities.length; i++) {
      String name = _listOfCities[i];
      if (name.toLowerCase().contains(userSearchTerm.toLowerCase())) {
        _searchList.add(_listOfCities[i]);
      }
    }
    return _searchList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() {
      _showModal(context);
    });
  }
}
