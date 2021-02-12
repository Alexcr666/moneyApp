import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


final _formKey = GlobalKey<FormState>();

class completeInformationPage extends StatefulWidget {
  @override
  _completeInformationPageState createState() =>
      _completeInformationPageState();
}

class _completeInformationPageState extends State<completeInformationPage> {
  String _dropdownValueCountry = 'Country';
  String _dropdownValueState = 'State';
  String _dropdownValueCity = 'City';
  bool checkSignUp = false;

  List<String> _spinnerItemsCountry = ['Country'];
  List<String> _spinnerItemsState = ['State'];
  List<String> _spinnerItemsCity = ['City'];
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerIdentificationNumber = TextEditingController();
  TextEditingController _controllerAddress = TextEditingController();
  TextEditingController _controllerNameAddress = TextEditingController();
  TextEditingController _controllerPin= TextEditingController();
  TextEditingController _controllerConfirmPin= TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: widgetAppbar(context, AppLocalizations.of(context).completeInformation),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(

          child: Stack(
            children: [

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 70),
                      child: Container(
                        decoration: new BoxDecoration(

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.3),
                              blurRadius: 24.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                4.0, // Move to right 10  horizontally
                                4.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                          ),

                          child: Container(

                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    SizedBox(
                                      height: 90,
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          //                   <--- border color
                                          width: 1.0,
                                        ),
                                        color: Colors.grey.withOpacity(0.1),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            child: Icon(
                                              Icons.camera_alt,
                                              size: 20,
                                            ),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Text(
                                            "Take photo",
                                            style:
                                                styleText(20, Colors.black, true),
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          SizedBox(
                                            width: 60,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      //padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: _controllerName,
                                          style: TextStyle(color: Colors.black),
                                          validator: (value) {
                                            if (value.trim().isEmpty) {
                                              return AppLocalizations.of(context).completeInformation;
                                            }
                                            return null;
                                          },

                                          decoration: decorationTextfield1(AppLocalizations.of(context).name)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      //padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: _controllerLastName,
                                          style: TextStyle(color: Colors.black),
                                          validator: (value) {
                                            if (value.trim().isEmpty) {
                                              return AppLocalizations.of(context).completeInformation;
                                            }
                                            return null;
                                          },

                                          decoration:
                                              decorationTextfield1(AppLocalizations.of(context).lasname)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      //padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: _controllerIdentificationNumber,
                                          keyboardType: TextInputType.number,
                                          inputFormatters:  inputNumber(),
                                          style: TextStyle(color: Colors.black),
                                          validator: (value) {
                                            if (value.trim().isEmpty) {
                                              return AppLocalizations.of(context).completeInformation;
                                            }
                                            return null;
                                          },

                                          decoration: decorationTextfield1(
                                              AppLocalizations.of(context).identificationnumber)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Text(
                                      AppLocalizations.of(context).homeaddres,
                                      style: styleText(20, Colors.black, true),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: decorationContainer(),
                                      padding: EdgeInsets.only(left: 20,right: 20),
                                      width: double.infinity,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: _dropdownValueCountry,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        onChanged: (String data) {
                                          setState(() {
                                            _dropdownValueCountry = data;
                                          });
                                        },
                                        items: _spinnerItemsCountry
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: decorationContainer(),
                                      padding: EdgeInsets.only(left: 20,right: 20),
                                      width: double.infinity,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: _dropdownValueState,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        onChanged: (String data) {
                                          setState(() {
                                            _dropdownValueState = data;
                                          });
                                        },
                                        items: _spinnerItemsState
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: decorationContainer(),
                                      padding: EdgeInsets.only(left: 20,right: 20),
                                      width: double.infinity,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: _dropdownValueCity,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        onChanged: (String data) {
                                          setState(() {
                                            _dropdownValueCity = data;
                                          });
                                        },
                                        items: _spinnerItemsCity
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(assetsSeparator,height: 140),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,

                                                //padding: EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    validator: (value) {
                                                      if (value.trim().isEmpty) {
                                                        return AppLocalizations.of(context).completeInformation;
                                                      }
                                                      return null;
                                                    },

                                                    decoration: decorationTextfield1(
                                                        AppLocalizations.of(context).address)),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                //padding: EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  controller: _controllerAddress,

                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    validator: (value) {
                                                      if (value.trim().isEmpty) {
                                                        return AppLocalizations.of(context).completeInformation;
                                                      }
                                                      return null;
                                                    },

                                                    decoration: decorationTextfield1(
                                                        AppLocalizations.of(context).nameAddress)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).createsaferypin,
                                      style: styleText(20, Colors.black, true),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      //padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: _controllerPin,
                                          keyboardType: TextInputType.number,
                                          inputFormatters:  inputNumber(),
                                          style: TextStyle(color: Colors.black),
                                          validator: (value) {
                                            if (value.trim().isEmpty) {
                                              return AppLocalizations.of(context).completeInformation;
                                            }
                                            return null;
                                          },

                                          decoration:
                                              decorationTextfield1("XXXXX")),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).confirmpin,
                                      style: styleText(20, Colors.black, true),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      //padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: _controllerConfirmPin,
                                          keyboardType: TextInputType.number,
                                          inputFormatters:  inputNumber(),
                                          style: TextStyle(color: Colors.black),
                                          validator: (value) {
                                            if (value.trim().isEmpty) {
                                              return AppLocalizations.of(context).completeInformation;
                                            }
                                            return null;
                                          },

                                          decoration:
                                              decorationTextfield1("XXXXX")),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          shape,
                          height: 270,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 40, right: 40),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: Center(
                                    child: CheckboxListTile(

                                      title: GestureDetector(
                                        onTap: (){
                                          if(_formKey.currentState.validate()){
                                            alertTerms(context);
                                          }

                                        },
                                        child: Text(
                                          AppLocalizations.of(context).accept,
                                          style: styleText(16, Colors.white, false),
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
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, homeRoutes,
                                          arguments: 'Data from home');
                                    },
                                    child: Container(
                                        margin:
                                            EdgeInsets.only(left: 20, right: 20),
                                        child: widgetButtonColor(AppLocalizations.of(context).send,
                                            AppColors.greenColor2, Colors.white))),
                                SizedBox(
                                  height: 30,
                                ),

                                Center(
                                  child: Text(
                                    AppLocalizations.of(context).pleasecompleteinformation,
                                    style: styleText(17, Colors.white, false),
                                  ),
                                ),

                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),

              Center(
                  child: GestureDetector(
                    onTap: (){
                   //   alertDialogImageUser(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        iconProfile,
                        height: 110,
                        width: 110,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
