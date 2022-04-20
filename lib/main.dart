import 'dart:async';
import 'package:klackr/website.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show Encoding, json, jsonDecode, jsonEncode;
import 'package:universal_html/html.dart' as html;
import 'package:url_strategy/url_strategy.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:mime/mime.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show Base64Decoder, Encoding, json, jsonDecode, jsonEncode;
import 'package:universal_html/html.dart' as html;
import 'package:url_strategy/url_strategy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:async/async.dart';






void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        footerTriggerDistance: 15,
        dragSpeedRatio: 0.91,
        headerBuilder: () => MaterialClassicHeader(),
    footerBuilder: () => ClassicFooter(),
    enableLoadingWhenNoData: false,
    enableRefreshVibrate: false,
    enableLoadMoreVibrate: false,
    shouldFooterFollowWhenNotFull: (state) {
    // If you want load more with noMoreData state ,may be you should return false
    return false;
    },
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
     ),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  final textFieldFocusNode2 = FocusNode();
  bool _obscured2 = true;
  final textFieldFocusNode3 = FocusNode();
  bool _obscured3 = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
      if (textFieldFocusNode2.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode2.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  void _toggleObscured3() {
    setState(() {
      _obscured3 = !_obscured3;
      if (textFieldFocusNode3.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode3.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  var pointToken;
  Future<void> allToken() async {
    var request = new
    http.MultipartRequest("POST",Uri.parse(APItoken));
    request.fields['email'] = 'carloparungao17@gmail.com';
    request.fields['password'] = 'carlo12345';
    http.Response response = await http.Response.fromStream(await
    request.send());
print(response.body+"sdasdasdasdasdasdasd");
    if (response.statusCode == 200) {
      var pointer = response.body; 
      pointToken = jsonDecode(pointer)['tokens']['access'];
      Timer(Duration(seconds: 0), () {
        getRegion();
      });
    }
  }
  String? UsRegion;
  void UselectRegion(){
    if(UregionValue=="REGION I"){
      setState(() {
        UsRegion="01";
      });
    }else  if(UregionValue=="REGION II"){
      setState(() {
        UsRegion="02";
      });
    }else  if(UregionValue=="REGION III"){
      setState(() {
        UsRegion="03";
      });
    }
    else  if(UregionValue=="REGION IV-A"){
      setState(() {
        UsRegion="4A";
      });
    }
    else  if(UregionValue=="REGION IV-B"){
      setState(() {
        UsRegion="4B";
      });
    }
    else  if(UregionValue=="REGION V"){
      setState(() {
        UsRegion="05";
      });
    }
    else  if(UregionValue=="REGION VI"){
      setState(() {
        UsRegion="06";
      });
    }
    else  if(UregionValue=="REGION VII"){
      setState(() {
        UsRegion="07";
      });
    }
    else  if(regionValue=="REGION VIII"){
      setState(() {
        UsRegion="08";
      });
    }
    else  if(UregionValue=="REGION IX"){
      setState(() {
        UsRegion="09";
      });
    }
    else  if(UregionValue=="REGION X"){
      setState(() {
        UsRegion="10";
      });
    }
    else  if(UregionValue=="REGION XI"){
      setState(() {
        UsRegion="11";
      });
    }
    else  if(UregionValue=="REGION XII"){
      setState(() {
        UsRegion="12";
      });
    }
    else  if(UregionValue=="REGION XIII"){
      setState(() {
        UsRegion="13";
      });
    }
    else  if(UregionValue=="BARMM"){
      setState(() {
        UsRegion="BARMM";
      });
    }
    else  if(UregionValue=="CAR"){
      setState(() {
        UsRegion="CAR";
      });
    }
    else  if(UregionValue=="NCR"){
      setState(() {
        UsRegion="NCR";
      });
    }
  }
  String? sRegion;
  void selectRegion(){
    if(regionValue=="REGION I"){
      setState(() {
        sRegion="01";
      });
    }else  if(regionValue=="REGION II"){
      setState(() {
        sRegion="02";
      });
    }else  if(regionValue=="REGION III"){
      setState(() {
        sRegion="03";
      });
    }
    else  if(regionValue=="REGION IV-A"){
      setState(() {
        sRegion="4A";
      });
    }
    else  if(regionValue=="REGION IV-B"){
      setState(() {
        sRegion="4B";
      });
    }
    else  if(regionValue=="REGION V"){
      setState(() {
        sRegion="05";
      });
    }
    else  if(regionValue=="REGION VI"){
      setState(() {
        sRegion="06";
      });
    }
    else  if(regionValue=="REGION VII"){
      setState(() {
        sRegion="07";
      });
    }
    else  if(regionValue=="REGION VIII"){
      setState(() {
        sRegion="08";
      });
    }
    else  if(regionValue=="REGION IX"){
      setState(() {
        sRegion="09";
      });
    }
    else  if(regionValue=="REGION X"){
      setState(() {
        sRegion="10";
      });
    }
    else  if(regionValue=="REGION XI"){
      setState(() {
        sRegion="11";
      });
    }
    else  if(regionValue=="REGION XII"){
      setState(() {
        sRegion="12";
      });
    }
    else  if(regionValue=="REGION XIII"){
      setState(() {
        sRegion="13";
      });
    }
    else  if(regionValue=="BARMM"){
      setState(() {
        sRegion="BARMM";
      });
    }
    else  if(regionValue=="CAR"){
      setState(() {
        sRegion="CAR";
      });
    }
    else  if(regionValue=="NCR"){
      setState(() {
        sRegion="NCR";
      });
    }
  }

  void UgetProvince() async {
    Map<String, dynamic> res = jsonDecode(pointerAll)[UsRegion]['province_list'];
    res.forEach((key, value) {
      setState(() {
        Uprovince.add(key);
      });
    });

  }
  void UgetMunicipality() async {
    Map<String, dynamic> res = jsonDecode(pointerAll)[UsRegion]['province_list'][UprovinceValue]['municipality_list'];
    res.forEach((key, value) {
      setState(() {
        Ucitymunicipality.add(key);
      });
    });
  }
  void UgetBarangay() async {
    var postLength;

    setState(() {
      postLength = jsonDecode(pointerAll)[UsRegion]['province_list'][UprovinceValue]['municipality_list'][UcitymunicipalityValue]['barangay_list'];//get all the data from json string superheros
    });
    for (var i = 0; i <= postLength.length-1; i++) {
      Ubarangay.add(jsonDecode(pointerAll)[UsRegion]['province_list'][UprovinceValue]['municipality_list'][UcitymunicipalityValue]['barangay_list'][i]);
    }
  }
  var pointerAll;
  void getRegion() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    pointerAll = response.body;
    if(response.statusCode==200){
    setState(() {
      selectRegion();
      UselectRegion();
    });
    }
  }
  void getProvince() async {
    Map<String, dynamic> res = jsonDecode(pointerAll)[sRegion]['province_list'];
    res.forEach((key, value) {
      setState(() {
        province.add(key);
      });
    });

  }
  void getMunicipality() async {
    Map<String, dynamic> res = jsonDecode(pointerAll)[sRegion]['province_list'][provinceValue]['municipality_list'];
    res.forEach((key, value) {
      setState(() {
        citymunicipality.add(key);
      });
    });
  }
  void getBarangay() async {

    var postLength;

    setState(() {
      postLength = jsonDecode(pointerAll)[sRegion]['province_list'][provinceValue]['municipality_list'][citymunicipalityValue]['barangay_list'];//get all the data from json string superheros
    });
    for (var i = 0; i <= postLength.length-1; i++) {
      barangay.add(jsonDecode(pointerAll)[sRegion]['province_list'][provinceValue]['municipality_list'][citymunicipalityValue]['barangay_list'][i]);
    }
  }

  void singup() async {

    var request = new
    http.MultipartRequest("POST",Uri.parse(APIregister));
    request.fields['email'] = '${emailRegisterController.text}';
    request.fields['username'] = '${usernameRegisterController.text}';
    request.fields['password'] = '${passwordRegisterController.text}';
    request.fields['first_name'] = '${firstnameRegisterController.text}';
    request.fields['last_name'] = '${lastnameRegisterController.text}';
    request.fields['suffix'] = '${suffixRegisterController.text}';
    request.fields['gender'] = '${genderRegisterController.text}';
    request.fields['birthday'] = monthValue.toString()+" "+dayValue.toString()+","+yearValue.toString();
    request.fields['region'] = '${regionValue.toString()}';
    request.fields['province'] = '${provinceValue.toString()}';
    request.fields['citymunicipality'] = '${citymunicipalityValue.toString()}';
    request.fields['barangay'] = '${barangayTypeRegisterController.text}';
    request.fields['contactnumber'] = '${cellphoneRegisterController.text}';
    http.Response response = await http.Response.fromStream(await
    request.send());
    var pointer = response.body;
    if (response.statusCode == 201) {
      getUser();
      setState(() {
        clickContinue="finish";
        Fluttertoast.showToast(
            msg: "succesfully registered",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 15.0
        );

      });
    }else if(response.statusCode==400){
      setState(() {
        var message = jsonDecode(pointer)['errors']['email'][0];
        Timer(Duration(seconds: 1), () {
          Fluttertoast.showToast(
              msg:message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 15.0
          );
        });
      });
    }else if(response.statusCode==500){
      setState(() {
        Timer(Duration(seconds: 1), () {
          Fluttertoast.showToast(
              msg:"Server internal problem",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 15.0
          );
        });
      });
    }

  }
  String username="";
  String token = "";
  void login() async {
    var request = new
    http.MultipartRequest("POST",Uri.parse(APIlogin));
    request.fields['email'] = '${emailLogin.text}';
    request.fields['password'] = '${passwordLogin.text}';
    http.Response response = await http.Response.fromStream(await
    request.send());
    var pointer = response.body;
    print(pointer);
    if (response.statusCode == 200) {
      plattform="androidiphone";
      var pointToken = jsonDecode(pointer)['tokens']['access'];
      var pointUsername = jsonDecode(pointer)['username'];
      username = pointUsername;
      token = pointToken;
      Fluttertoast.showToast(
          msg: "succesfully login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 15.0
      );
      _Credentials(emailLogin.text,passwordLogin.text);
      lobby="lobby";
      lobbySize = 0;
      setState(() {
        lobby="lobby";
        lobbySize = 0;
        fetchData1();
        getprofile();
        forgot="false";
        lobbyselect="lobbygetpost";
        iconSetting2 = dark;
        iconAdd=dark;
      });
    } else if(response.statusCode==400){

      pointer = response.body;
      setState(() {
        forgot="true";
      });
      var pointToken = jsonDecode(pointer)['email'][0];
      Timer(Duration(seconds: 1), () {
        Fluttertoast.showToast(
            msg: pointToken,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 15.0
        );
      });
    } else if(response.statusCode==401){
      pointer = response.body;
      setState(() {
        forgot="true";
      });
      var pointToken = jsonDecode(pointer)['detail'];
      Timer(Duration(seconds: 1), () {
        Fluttertoast.showToast(
            msg: pointToken,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 15.0
        );
      });
    }
  }
   void resetVicinity() async{
var birthday;
var region=ORegion;
var province=OProvince;
var citymunicipality=OCityMunicipality;
var barangay=Obarangay;
    if(UmonthValue==null||UdayValue==null||UyearValue==null){
      birthday= UbirthdayRegisterController.text;
    }else{
birthday= UmonthValue.toString()+" "+UdayValue.toString()+", "+UyearValue.toString();
    }

  
 
    final response = await http.put(
      Uri.parse("https://data.klackr.world/homepage/profile/$profileID/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "username": UusernameRegisterController.text,
        "contactnumber": UcellphoneRegisterController.text,
        "first_name": UfirstnameRegisterController.text,
        "last_name": UlastnameRegisterController.text,
        "suffix": UsuffixRegisterController.text,
        "genderr": UgenderRegisterController.text,
        "birthday":birthday,
        "region": region,
        "province": province,
        "citymunicipality": citymunicipality,
        "barangay": barangay,

      }
    );
    if (response.statusCode == 200) {
      fetchData1();
      getprofile();
    
      if(allow=="on"){
        allow="off";
        Fluttertoast.showToast(
            msg: "successfuly save",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 15.0
        );
        Timer(Duration(seconds: 2), () {
          allow="on";
        });
      }
    }else if(response.statusCode == 400){
      if(allow=="on"){
        allow="off";
        Fluttertoast.showToast(
            msg: "This field may not be blank.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 15.0
        );
        Timer(Duration(seconds: 2), () {
          allow="on";
        });
      }
    }
  }
   void changeVicinity() async{
var birthday;
var region;
var province;
var citymunicipality;
var barangay;
    if(UmonthValue==null||UdayValue==null||UyearValue==null){
      birthday= UbirthdayRegisterController.text;
    }else{
birthday= UmonthValue.toString()+" "+UdayValue.toString()+", "+UyearValue.toString();
    }

    if(UregionValue==null){
 

        region=VRegion;

           
              
    }else{
    region=UregionValue;
    }
    if(UprovinceValue==null){
  province=VProvince;
    }else{
    province=UprovinceValue;
    }
    if(UcitymunicipalityValue==null){
  citymunicipality=VCityMunicipality;
    }else{
    citymunicipality=UcitymunicipalityValue;
    }
    if(UbarangayValue==null){
  barangay=Vbarangay;
    }else{
    barangay=UbarangayValue;
    }
   
    final response = await http.put(
      Uri.parse("https://data.klackr.world/homepage/profile/$profileID/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "username": UusernameRegisterController.text,
        "contactnumber": UcellphoneRegisterController.text,
        "first_name": UfirstnameRegisterController.text,
        "last_name": UlastnameRegisterController.text,
        "suffix": UsuffixRegisterController.text,
        "genderr": UgenderRegisterController.text,
        "birthday":birthday,
        "region": region,
        "province": province,
        "citymunicipality": citymunicipality,
        "barangay": barangay,

      }
    );
    if (response.statusCode == 200) {
      fetchData1();
      getprofile();
    
      if(allow=="on"){
        allow="off";
        Fluttertoast.showToast(
            msg: "successfuly save",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 15.0
        );
        Timer(Duration(seconds: 2), () {
          allow="on";
        });
      }
    }else if(response.statusCode == 400){
      if(allow=="on"){
        allow="off";
        Fluttertoast.showToast(
            msg: "This field may not be blank.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 15.0
        );
        Timer(Duration(seconds: 2), () {
          allow="on";
        });
      }
    }
  }
  void profile() async{
var birthday;
var region;
var province;
var citymunicipality;
var barangay;
    if(UmonthValue==null||UdayValue==null||UyearValue==null){
      birthday= UbirthdayRegisterController.text;
    }else{
birthday= UmonthValue.toString()+" "+UdayValue.toString()+", "+UyearValue.toString();
    }

    if(UregionValue==null){
 

        region=VRegion;

           
              
    }else{
    region=UregionValue;
    }
    if(UprovinceValue==null){
  province=VProvince;
    }else{
    province=UprovinceValue;
    }
    if(UcitymunicipalityValue==null){
  citymunicipality=VCityMunicipality;
    }else{
    citymunicipality=UcitymunicipalityValue;
    }
    if(UbarangayValue==null){
  barangay=Vbarangay;
    }else{
    barangay=UbarangayValue;
    }
    print(region);
    final response = await http.put(
      Uri.parse("https://data.klackr.world/homepage/profile/$profileID/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "username": UusernameRegisterController.text,
        "contactnumber": UcellphoneRegisterController.text,
        "first_name": UfirstnameRegisterController.text,
        "last_name": UlastnameRegisterController.text,
        "suffix": UsuffixRegisterController.text,
        "genderr": UgenderRegisterController.text,
        "birthday":birthday,
        "region": region,
        "province": province,
        "citymunicipality": citymunicipality,
        "barangay": barangay,

      }
    );
    if (response.statusCode == 200) {
       
          ORegion=region;
      OProvince=province;
      OCityMunicipality=citymunicipality+",";
      Obarangay=barangay;
      _Places(region,province,citymunicipality,barangay);
      fetchData1();
      getprofile();
      if(allow=="on"){
        allow="off";
        Fluttertoast.showToast(
            msg: "successfuly save",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 15.0
        );
        Timer(Duration(seconds: 2), () {
          allow="on";
        });
      }
    }else if(response.statusCode == 400){
      if(allow=="on"){
        allow="off";
        Fluttertoast.showToast(
            msg: "This field may not be blank.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 15.0
        );
        Timer(Duration(seconds: 2), () {
          allow="on";
        });
      }
    }
  }

  void posting() async{
    if(_imageFileList!=null){
      try {
        var _request = http.MultipartRequest('POST', Uri.parse(APIposting));
        _request.headers.addAll({'authorization':'Bearer $token' ,'Content-Type': 'application/formd-ata'});
        _request.files.add(
            http.MultipartFile.fromBytes(
                'image',
                await _imageFileList![0].readAsBytes().then((value) {
                  return value.cast();
                }),
                filename:_imageFileList![0].name
            )
        );
        _request.fields['caption']= postingRegisterController.text;
        return await _request.send().then((value) {
          if(value.statusCode == 201) {
            lobbyselect="";

              setState(() {
                lobbyselect="lobbygetpost";
                iconVicinity=red;
                iconSetting2 = dark;
                iconAdd=dark;

                    fetchData1();


              });

            setState(() {
              fetchData1();
              postingRegisterController.text="";
              _imageFileList=null;
              loading="false";
            });
            return true;
          } else {

          }
        });
      } catch(e) {

      }
    }else if(file!=null){
      try {
        var _request = http.MultipartRequest('POST', Uri.parse(APIposting));
        _request.headers.addAll({'authorization':'Bearer $token' ,'Content-Type': 'application/formd-ata'});
        _request.files.add(
            http.MultipartFile.fromBytes(
                'video',
                await file!.readAsBytes().then((value) {
                  return value.cast();
                }),
                filename:file!.name
            )
        );
        _request.fields['caption']= postingRegisterController.text;
        return await _request.send().then((value) {
          if(value.statusCode == 201) {
            lobbyselect="";

              setState(() {
                lobbyselect="lobbygetpost";
                iconVicinity=red;
                iconSetting2 = dark;
                iconAdd=dark;

                    fetchData1();

              });

            setState(() {
              fetchData1();
              postingRegisterController.text="";
              file=null;
              loading="false";

            });
            return true;
          } else {

          }
        });
      } catch(e) {

      }
    }else{
      try {
        var _request = http.MultipartRequest('POST', Uri.parse(APIposting));
        _request.headers.addAll({'authorization':'Bearer $token' ,'Content-Type': 'application/formd-ata'});
        _request.fields['caption']= postingRegisterController.text;
        return await _request.send().then((value) {
          if(value.statusCode == 201) {
            lobbyselect="";

              setState(() {
                lobbyselect="lobbygetpost";
                iconSetting2 = dark;
                iconAdd=dark;
                iconVicinity=red;

                    fetchData1();

              });

            setState(() {
              postingRegisterController.text="";
              loading="false";
            });
            return true;
          } else {

          }
        });
      } catch(e) {

      }
    }
  }
  final List<Map<String, dynamic>> _allUsers1 = [];
  List<Map<String, dynamic>> _foundUsers1 = [];
  String data1 = "";
  var postLength1;
  void fetchData1() async {
    final response = await http.get(Uri.parse(APIgetpost), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      data1 = response.body; //store response as string
      _allUsers1.clear();
      setState(() {
        postLength1 = jsonDecode(data1)['results']; //get all the data from json string superheros

      });
      for (var i = 0; i <= postLength1.length-1; i++) {
        _allUsers1.add(jsonDecode(data1)['results'][i]);
       // print(jsonDecode(data1)['results'][i]['video']);
             if(jsonDecode(data1)['results'][i]['video']==null){
        _Video.add(VideoPlayerController.network(jsonDecode(data1)['results'][i]['video'].toString()));
       // _Video[_Video.length-1].initialize();
       }
       if(jsonDecode(data1)['results'][i]['video']!=null){
          print(jsonDecode(data1)['results'][i]['video']);
          _Video.add(VideoPlayerController.network(jsonDecode(data1)['results'][i]['video'].toString()));
         _Video[_Video.length-1].initialize();
       }
      
      }
        
      _foundUsers1 = _allUsers1;
      
      refreshing="false";

    }
  }
  void updateposting() async{
    final response = await http.put(
      Uri.parse("https://data.klackr.world/homepage/posts/$IDpost/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
      },
      encoding: Encoding.getByName('utf-8'),
      body: {"caption": UpostController.text},
    );
    if (response.statusCode == 200) {
      edit="false";
      lobbyselect="lobbygetpost";
      iconVicinity=red;
      fetchData1();
      UpostController.text="";
      if(allow=="on"){
        allow="off";
        Fluttertoast.showToast(
            msg: "successfuly save",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 15.0
        );
        Timer(Duration(seconds: 2), () {
          allow="on";
        });
      }
    }
  }
  void deletedposting() async{
    final response = await http.delete(
      Uri.parse("https://data.klackr.world/homepage/posts/$IDpost/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 204) {
      fetchData1();
      lobbyselect="lobbygetpost";
      UpostController.text="";
      UpostController.text="";
      IDpost="";
      CPpost="";
      edit="false";
      if(allow=="on"){
        allow="off";
        Fluttertoast.showToast(
            msg: "deleted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 15.0
        );
        Timer(Duration(seconds: 2), () {
          allow="on";
        });
      }
    }
  }
  void filterSearchResults(String query) {
    List<Map<String, dynamic>> results = [];
    if (query.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers1;

    } else {

      results = _allUsers1
          .where((user) =>
          user["caption"].toLowerCase().contains(query.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers1 = results;
      if(_foundUsers1.toString()=="[]"){
        noPost="true";
      }else{
        noPost="false";
      }
    });
  }


  String data2 = "";
  String profileID = "";
  void getprofile() async {
    final response = await http.get(Uri.parse(APIgetprofile), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      data2 = response.body; //store response as string
      var getID = jsonDecode(data2)['results'][0]['id'];
      var getFirstname = jsonDecode(data2)['results'][0]['first_name'];
      var getLastname = jsonDecode(data2)['results'][0]['last_name'];
      var getSuffix = jsonDecode(data2)['results'][0]['suffix'];
      var getGender = jsonDecode(data2)['results'][0]['gender'];
      var getUsername = jsonDecode(data2)['results'][0]['username'];
      var getBirthday = jsonDecode(data2)['results'][0]['birthday'];
      var getRegion = jsonDecode(data2)['results'][0]['region'];
      var getProvince = jsonDecode(data2)['results'][0]['province'];
      var getCityMunicipality = jsonDecode(data2)['results'][0]['citymunicipality'];
      var getBarangay = jsonDecode(data2)['results'][0]['barangay'];
      var getCellphone = jsonDecode(data2)['results'][0]['contactnumber'];
      var getProfilepic = jsonDecode(data2)['results'][0]['profile_pic'];

      setState(() {
        profileID=getID.toString();
        UfirstnameRegisterController.text=getFirstname;
        UlastnameRegisterController.text=getLastname;
        UsuffixRegisterController.text=getSuffix;
        UgenderRegisterController.text=getGender;
        if(UgenderRegisterController.text=="Male"){
          Umale=true;
          UsuffixRegisterController.text="Male";
        }else if(UgenderRegisterController.text=="Female"){
          Ufemale=true;
          UsuffixRegisterController.text="Female";
        }else{
          Urather=true;
          UsuffixRegisterController.text="Rather not say";
        }
        UbirthdayRegisterController.text=getBirthday;
        UusernameRegisterController.text=getUsername;
        username=getUsername;

        VRegion = getRegion;
        VProvince=getProvince;
        VCityMunicipality=getCityMunicipality;
        Vbarangay=getBarangay;
        UcellphoneRegisterController.text=getCellphone;
        profilePic  = getProfilepic ;

      });
    }
  }

  void whiteTheme(){
    themeBase=Whitebasecolor;
    themeTitle=black;
    themeCard=Whitecardcolor;
    themeInput=whiteinput;
    themeInputText=black;
    themeAppbard=grey;
    themeNewCard=white;
    themeContent=contentWhite;
  }
  Future<void> darkTheme() async {
    themeBase=DarkbaseColor;
    themeTitle =white;
    themeCard=DarkcardColor;
    themeInput=darkinput;
    themeInputText=white;
    themeAppbard=white;
    themeNewCard=DarkcardColor;
    themeContent=contentDark;
  }


  void deleteposting() async{
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Are you sure ?",style: TextStyle(color: Colors.black),),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            deletedposting();
                          },
                          child: Text("ok",style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                              primary:Colors.red),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {

                              Navigator.of(context).pop();
                            },
                            child: Text("cancel", style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });

  }

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
 fetchData1();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }


  void getUser() async {
    var response = await http.get(Uri.parse(APIgetuser), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    var pointer = response.body;
    if(response.statusCode==200) {
      getUserCount=jsonDecode(pointer)["users_count"].toString();
    }

  }



  List<XFile>? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }
  XFile? file = null;
  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (isVideo) {
      file = await _picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      await _playVideo(file);
    } else if (isMultiImage) {
     double? maxWidth;
      double? maxHeight;
      int? quality;
            try {
              final List<XFile>? pickedFileList = await _picker.pickMultiImage(
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                imageQuality: quality,
              );
              setState(() {
                _imageFileList = pickedFileList;
              });
            } catch (e) {
              setState(() {
                _pickImageError = e;
              });
            }
        
    } else {
      double? maxWidth;
      double? maxHeight;
      int? quality;
            try {
              final XFile? pickedFile = await _picker.pickImage(
                source: source,
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                imageQuality: quality,
              );
              setState(() {
                _imageFile = pickedFile;
              });
            } catch (e) {
              setState(() {
                _pickImageError = e;
              });
            }
          
    }
  }


  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
          child: ListView.builder(
            key: UniqueKey(),
            itemBuilder: (BuildContext context, int index) {
              // Why network for web?
              // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
              filename=_imageFileList![index].name;
              imageSelect=_imageFileList![index].path;
              return Container(
                child: Column(
                  children: [    
                    Semantics(
                      label: 'image_picker_example_picked_image',
                      child: kIsWeb
                          ? Image.network(_imageFileList![index].path)
                          : Image.file(File(_imageFileList![index].path)),
                    ),
                  ],
                ),
              );
            },
            itemCount: _imageFileList!.length,
          ),
          label: 'image_picker_example_picked_images');
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    if (isVideo) {
      _imageFileList=null;
      return _previewVideo();
    } else {
      file=null;
      return _previewImages();
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
          _imageFileList = response.files;
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }


  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxWidth if desired'),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxHeight if desired'),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter quality if desired'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }


  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }






  String? emailH = "";
  String? passwordH = "";
  _getCredentials() async {
    SharedPreferences emailP = await SharedPreferences.getInstance();
    SharedPreferences passwordP = await SharedPreferences.getInstance();
    if(emailP.getString("email") == null||emailP.getString("password")==null){
      emailLogin.text="";
      passwordLogin.text="";
     
      setState(() {
          plattform="androidiphone";
      });
     
    }else if (emailP.getString("email") != ""||emailP.getString("password") != "") {
      emailH = emailP.getString("email");
      passwordH = passwordP.getString("password");

      setState(() {
        emailLogin.text=emailH.toString();
        passwordLogin.text=passwordH.toString();

        login();
      });

    }else{   
      setState(() {
          plattform="androidiphone";
      });}
  }
  _Credentials(emailS,passwordS) async {
    SharedPreferences emailP = await SharedPreferences.getInstance();
    SharedPreferences passwordP = await SharedPreferences.getInstance();
    emailP.setString("email", emailS);
    passwordP.setString("password", passwordS);
    return true;
  }
  String? regionH = "";
   String? provinceH = "";
    String? municipalityH = "";
     String? barangayH = "";
  _getPlaces() async {
   SharedPreferences CPregion = await SharedPreferences.getInstance();
    SharedPreferences CPprovince = await SharedPreferences.getInstance();
     SharedPreferences CPmunicipality = await SharedPreferences.getInstance();
    SharedPreferences CPbarangay = await SharedPreferences.getInstance();
    if(CPregion.getString("region") == null||CPprovince.getString("province")==null
    ||CPmunicipality.getString("municipality")==null||CPbarangay.getString("barangay")==null){
      ORegion="";
      OProvince="";
      OCityMunicipality="";
      Obarangay="";
    }else if (CPregion.getString("region") != null||CPprovince.getString("province")!=null
    ||CPmunicipality.getString("municipality")!=null||CPbarangay.getString("barangay")!=null) {
      regionH=CPregion.getString("region");
      provinceH=CPprovince.getString("province");
      municipalityH=CPmunicipality.getString("municipality");
      barangayH=CPbarangay.getString("barangay");
      setState(() {
      ORegion=regionH.toString();
      OProvince=provinceH.toString();
      OCityMunicipality=municipalityH.toString();
      Obarangay=barangayH.toString();
      print("23423423423423");
      });

    }
  }
   _Places(Cregion,Cprovince,Cmunicipality,Cbarangay) async {
    SharedPreferences CPregion = await SharedPreferences.getInstance();
    SharedPreferences CPprovince = await SharedPreferences.getInstance();
     SharedPreferences CPmunicipality = await SharedPreferences.getInstance();
    SharedPreferences CPbarangay = await SharedPreferences.getInstance();
    CPregion.setString("region", Cregion);
    CPprovince.setString("province", Cprovince);
    CPmunicipality.setString("municipality", Cmunicipality);
    CPbarangay.setString("barangay", Cbarangay);
    return true;
  }
  void OSindentifyer(){
    final userAgent = html.window.navigator.userAgent.toString().toLowerCase();
    // smartphone
    if( userAgent.contains("android")||userAgent.contains("iphone")||userAgent.contains("ipad")) {
      setState(() { 
          allToken();
      getUser();
      _getCredentials();
      _getPlaces();
      });
    }else{
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          //  builder: (BuildContext context) =>  SignInDemo(),
          builder: (BuildContext context) =>  website(),
        ),
            (route) => false,//if you want to disable back feature set to false
      );
    }


  }
  @override void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () {
      OSindentifyer();
    
    });

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      backgroundColor: _colorFromHex(themeBase),
      appBar: AppBar(
        backgroundColor:  _colorFromHex(themeBase),
        elevation: 0,
        title:Container(
          child:Column(
            children:[
              if(plattform=="androidiphone")
              Container(
                child:Row(
                    children:[
                      Expanded(
                        flex:3,
                        child:Container(
                          child:Column(
                            children:[
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    clickContinue="login";
                                    iconLogin=red;
                                    iconSignup=dark;
                                    iconSetting=dark;

                                  });
                                },
                                icon: Icon(Icons.login,color:_colorFromHex(iconLogin),size:35),
                              ),
                              Text("login",style:TextStyle(color:_colorFromHex(themeInputText))),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex:3,
                        child:Container(
                          child:Column(
                            children:[
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    clickContinue="false";
                                    iconSignup=red;
                                    iconLogin=dark;
                                    iconSetting=dark;
                                  });
                                },
                                icon: Icon(Icons.assignment,color:_colorFromHex(iconSignup),size:35),
                              ),
                              Text("sign up",style:TextStyle(color:_colorFromHex(themeInputText))),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex:3,
                        child:Container(
                          child:Column(
                            children:[
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    clickContinue="setting";
                                    iconSetting=red;
                                    iconLogin=dark;
                                    iconSignup=dark;
                                  });
                                },
                                icon: Icon(Icons.settings,color:_colorFromHex(iconSetting),size:35),
                              ),
                              Text("settings",style:TextStyle(color:_colorFromHex(themeInputText))),
                            ],
                          ),
                        ),
                      ),
                    ]
                ),
              ),

              
            ]
          ),
        ),
        actions: [
if(plattform=="androidiphone")
          IntrinsicHeight(
            child: Row( children: [
   
            ]),
          ),
         
        ],
        toolbarHeight: lobbySize,
      ),
      body:SingleChildScrollView(
        child:Container(
        child: Column(
          children: [
            if(plattform=="androidiphone")
              Container(
                child: IntrinsicHeight(
                  child: Column( children: [
                    Container(
                      height: 20,
                    ),

                    if(lobby=="editprofile")
                      IntrinsicHeight(
                        child: Column ( children: [
                          Container(
                            child:   IntrinsicHeight(
                              child: Column( children: [
                                Expanded(
                                  child: Column(
                                      children: [
                                        Expanded(
                                          flex:0,
                                          child:Container(
                                            height:10,
                                          ),
                                        ),
                                        Row(children: [
                                          Expanded(
                                            flex:0,
                                            child:Container(
                                              width:10,
                                            ),
                                          ),
                                          Flexible(
                                            flex:3,
                                            child:Container(
                                                height: 70,
                                                child:Image.asset('assets/logo/klackr_logo.png')
                                            ),
                                          ),
                                          
                                          Container(width:7),
                                          Flexible(
                                            flex:5,
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                  Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                  Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                ]),
                                          ),
                                        ]
                                        ),


                                      ]
                                  ),
                                ),

                              ]),
                            ),
                          ),
                          Container(
                            child:   IntrinsicHeight(
                              child: Column( children: [
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 500,
                                          alignment: Alignment.topLeft,
                                          child: IntrinsicHeight(
                                            child: Row( children: [
                                              Container(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 10,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Edit Profile",style: TextStyle(fontSize: 25,color:_colorFromHex(themeContent))),
                                                      Text("Follow friends and discover great",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                      Text("things in your vicinity and beyond",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                    ]),
                                              ),
                                              Expanded(
                                                flex: 10,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        child:   Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                          child:ElevatedButton(
                                                            child: Text('SAVE CHANGES'),
                                                            onPressed: () {
                                                              profile();
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                                primary: _colorFromHex("#2786C9"),
                                                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                                                textStyle: TextStyle(
                                                                    fontWeight: FontWeight.bold)),
                                                          ),
                                                        ),
                                                      ),

                                                    ]),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        Container(
                                          height: 0.2,
                                          color:_colorFromHex(themeContent),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:  Text("Klackr account no. "+profileID.toString(),style: TextStyle(color: _colorFromHex(themeContent))),
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                        ),
                                 Row(children:[
                                   Padding(
                                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                     child:Container(
                                       height:100,
                                       width:100,
                                       child:Image.network(profilePic),
                                     ),
                                   ),
                                 ]),
                                 Container(
                                   height:10,
                                 ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                        child:Text("Profile",style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                  ),
 Container(
                                   height:10,
                                 ),
                                        /*
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: UfirstnameRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: 'First name',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                              ),
                                              style: TextStyle(color: _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: UlastnameRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: 'Last name',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                              ),
                                              style: TextStyle(color: _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: UsuffixRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: 'Suffix',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                        ),
                                        Row(children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Text("Gender",textAlign: TextAlign.start,style: TextStyle(color:_colorFromHex(themeContent))),
                                        ]
                                        ),

                                        Row(children: [
                                          Container(
                                            width: 15,
                                          ),

                                          Flexible(
                                            child:Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: Umale,
                                                checkColor: Colors.white,
                                                activeColor: _colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(Umale==false){
                                                      Umale=true;
                                                      Ufemale=false;
                                                      Urather=false;
                                                      setState(() {
                                                        UgenderRegisterController.text="Male";
                                                      });
                                                    }else{
                                                      Umale=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
                                            flex:9,
                                            child:      Text("Male",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
                                            child: Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: Ufemale,
                                                checkColor: Colors.white,
                                                activeColor:_colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(Ufemale==false){
                                                      Ufemale=true;
                                                      Umale=false;
                                                      Urather=false;
                                                      setState(() {
                                                        UgenderRegisterController.text="Female";
                                                      });
                                                    }else{
                                                      Ufemale=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),

                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
                                            flex:9,
                                            child:      Text("Female",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(

                                            child: Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: Urather,
                                                checkColor: Colors.white,
                                                activeColor:_colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(Urather==false){
                                                      Urather=true;
                                                      Ufemale=false;
                                                      Umale=false;
                                                      setState(() {
                                                        UgenderRegisterController.text="Rather not say";
                                                      });
                                                    }else{
                                                      Urather=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
                                            flex:0  ,
                                            child:Text("Rather not say",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),

                                        ]
                                        ),

                                      
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:  Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child: TextField(
                                                  controller: UusernameRegisterController,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: _colorFromHex(themeInput),
                                                    border: OutlineInputBorder(

                                                    ),
                                                    hintText: 'Username',
                                                    hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                  ),
                                                  style: TextStyle(color: _colorFromHex(themeInputText)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Container(height: 10),
                                        Container(
                                          height: 45,
                                          child:  Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child: TextField(
                                                  enabled: false,
                                                  controller: UbirthdayRegisterController,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: _colorFromHex(themeInput),
                                                    border: OutlineInputBorder(

                                                    ),
                                                    hintText: 'Birthday',
                                                    hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                  ),
                                                  style: TextStyle(color: _colorFromHex(themeInputText)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(height: 20),
                                        Container(
                                          height:100,
                                          child:Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
                                            Container(
                                              alignment: Alignment.center,
                                              child:   Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child: Row(children:[
                                                  Text("Date of birth",style: TextStyle(color:_colorFromHex(themeContent))),
                                                ]),
                                              ),
                                            ),
                                            Container(
                                              height:10,
                                            ),

                                            Row(children: [
                                              Container(
                                                width:20,
                                              ),
                                              Flexible(
                                                flex:2,
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    isExpanded: true,
                                                    items: Umonth
                                                        .map((item) =>
                                                        DropdownMenuItem<String>(
                                                          value: item.toString(),
                                                          child:  Container(
                                                            alignment:Alignment.center,
                                                            child:Text(
                                                              item.toString(),
                                                              style:  TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.bold,
                                                                color:  _colorFromHex(themeInputText),
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ))
                                                        .toList(),
                                                    value: UmonthValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        UmonthValue = value as String;
                                                      });
                                                    },
                                                    iconSize: 14,
                                                    iconEnabledColor:_colorFromHex(themeContent),
                                                    iconDisabledColor: Colors.grey,
                                                    buttonHeight: 30,
                                                    buttonWidth: 100,
                                                    buttonDecoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(0),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color: _colorFromHex(themeInput),
                                                    ),
                                                    buttonElevation: 2,
                                                    itemHeight: 40,
                                                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownWidth: 200,
                                                    dropdownPadding: null,
                                                    dropdownDecoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(0),
                                                      color: _colorFromHex(themeNewCard),
                                                    ),
                                                    dropdownElevation: 8,
                                                    scrollbarRadius: const Radius.circular(40),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,
                                                    offset: const Offset(-20, 0),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:5,
                                              ),
                                              Flexible(
                                                flex:2  ,
                                                child: Text("Month",style: TextStyle(color:_colorFromHex(themeContent))),
                                              ),
                                              Container(
                                                width:15,
                                              ),
                                              Flexible(
                                                flex:2,
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    isExpanded: true,
                                                    items: day
                                                        .map((item) =>
                                                        DropdownMenuItem<String>(
                                                          value: item.toString(),
                                                          child:  Container(
                                                            alignment:Alignment.center,
                                                            child:Text(
                                                              item.toString(),
                                                              style:  TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.bold,
                                                                color:  _colorFromHex(themeInputText),
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ))
                                                        .toList(),
                                                    value: UdayValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        UdayValue = value as String;
                                                      });
                                                    },

                                                    iconSize: 14,
                                                    iconEnabledColor:_colorFromHex(themeContent),
                                                    iconDisabledColor: Colors.grey,
                                                    buttonHeight: 30,
                                                    buttonWidth: 100,

                                                    buttonDecoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(0),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color: _colorFromHex(themeInput),
                                                    ),
                                                    buttonElevation: 2,
                                                    itemHeight: 40,
                                                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownWidth: 200,
                                                    dropdownPadding: null,
                                                    dropdownDecoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(0),
                                                      color: _colorFromHex(themeNewCard),
                                                    ),
                                                    dropdownElevation: 8,
                                                    scrollbarRadius: const Radius.circular(40),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,
                                                    offset: const Offset(-20, 0),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:5,
                                              ),
                                              Flexible(
                                                flex:2,
                                                child: Text("Day",style: TextStyle(color:_colorFromHex(themeContent))),
                                              ),
                                              Container(width: 15),
                                              Flexible(
                                                flex:3,
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    isExpanded: true,
                                                    items: year
                                                        .map((item) =>
                                                        DropdownMenuItem<String>(
                                                          value: item.toString(),
                                                          child:  Container(
                                                            alignment:Alignment.center,
                                                            child:Text(
                                                              item.toString(),
                                                              style:  TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.bold,
                                                                color:  _colorFromHex(themeInputText),
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ))
                                                        .toList(),
                                                    value: UyearValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        UyearValue = value as String;
                                                      });
                                                    },

                                                    iconSize: 14,
                                                    iconEnabledColor:_colorFromHex(themeContent),
                                                    iconDisabledColor: Colors.grey,
                                                    buttonHeight: 30,
                                                    buttonWidth: 100,

                                                    buttonDecoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(0),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color: _colorFromHex(themeInput),
                                                    ),
                                                    buttonElevation: 2,
                                                    itemHeight: 40,
                                                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownWidth: 200,
                                                    dropdownPadding: null,
                                                    dropdownDecoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(0),
                                                      color: _colorFromHex(themeNewCard),
                                                    ),
                                                    dropdownElevation: 8,
                                                    scrollbarRadius: const Radius.circular(40),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,
                                                    offset: const Offset(-20, 0),
                                                  ),
                                                ),
                                              ),
                                              Container(width: 5),
                                              Flexible(
                                                flex:0,
                                                child: Text("Year",style: TextStyle(color:_colorFromHex(themeContent))),
                                              ),
                                            ]
                                            ),

                                          ]
                                          ),
                                        ),
*/

 Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                             // controller: emailRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: 'Email address',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:  Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child: TextField(
                                                  //controller: usernameRegisterController,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: _colorFromHex(themeInput),
                                                    border: OutlineInputBorder(

                                                    ),
                                                    hintText: 'Username',
                                                    hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                  ),
                                                  style: TextStyle(color: _colorFromHex(themeInputText)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                             // controller: passwordRegisterController,
                                              keyboardType: TextInputType.visiblePassword,
                                              obscureText: _obscured,
                                              focusNode: textFieldFocusNode,
                                              decoration: InputDecoration(
                                                floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                                                hintText: 'Password',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                filled: true, // Needed for adding a fill color
                                                fillColor:  _colorFromHex(themeInput),
                                                isDense: true,  // Reduces height a bit
                                                border: OutlineInputBorder(
                                                  // Apply corner radius
                                                ),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: GestureDetector(
                                                    onTap: _toggleObscured,
                                                    child: Icon(
                                                      _obscured ? Icons.visibility_off_rounded: Icons.visibility_rounded ,
                                                      size: 24,
                                                      color: _colorFromHex(themeContent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                             // controller: confirmpasswordRegisterController,
                                              keyboardType: TextInputType.visiblePassword,
                                              obscureText: _obscured2,
                                              focusNode: textFieldFocusNode2,
                                              decoration: InputDecoration(
                                                floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                                                hintText: 'Confirm password',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                filled: true, // Needed for adding a fill color
                                                fillColor:  _colorFromHex(themeInput),
                                                isDense: true,  // Reduces height a bit
                                                border: OutlineInputBorder(
                                                  // Apply corner radius
                                                ),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: GestureDetector(
                                                    onTap: _toggleObscured2,
                                                    child: Icon(
                                                      _obscured2 ? Icons.visibility_off_rounded: Icons.visibility_rounded ,
                                                      size: 24,
                                                      color: _colorFromHex(themeContent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height:10,
                                        ),
                                          Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("Address",style: TextStyle(color:_colorFromHex(themeContent),fontWeight:FontWeight.bold)),
                                          ),
                                        ),
                                         Container(
                                          height:10,
                                        ),
                                      Expanded(
                                          child: Container(
                                            height: 45,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  hint: Row(
                                                    children:  [
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          VRegion,
                                                          style: TextStyle(
                                                              color: _colorFromHex( themeInputText ),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: Uregion
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:  TextStyle(
                                                              color:  _colorFromHex( themeInputText ),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value: UregionValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      Timer(Duration(seconds: 0), () {
                                                        UselectRegion();
                                                        Uprovince.clear();
                                                        Ucitymunicipality.clear();
                                                        UcitymunicipalityValue=null;
                                                        Ubarangay.clear();
                                                        UbarangayValue=null;
                                                        UprovinceValue=null;
                                                        UgetProvince();

                                                         VProvince="Province";
                                                        VCityMunicipality="City/Municipality";
                                                         Vbarangay="Barangay (or nearest barangay)";
                                                        UbarangayTypeRegisterController.text="";
                                                      });
                                                      UregionValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 40,
                                                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color:_colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  style: TextStyle(fontSize: 12),
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                          ),


                                        ),
                                        Container(height: 5),

                                        Expanded(
                                          child: Stack(
                                            children:[
                                              Container(
                                                height: 60,
                                                child:   Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                      isExpanded: true,
                                                      hint: Row(
                                                        children:  [
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              VProvince,
                                                              style: TextStyle(
                                                                  color: _colorFromHex( themeInputText),fontSize: 15
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      items: Uprovince.map((item) =>
                                                          DropdownMenuItem<String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:  TextStyle(
                                                                  color: _colorFromHex(themeInputText),fontSize: 15
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ))
                                                          .toList(),
                                                      value: UprovinceValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          Ucitymunicipality.clear();
                                                          UcitymunicipalityValue=null;
                                                          Ubarangay.clear();
                                                          UbarangayValue=null;
                                                          VCityMunicipality="City/Municipality";
                                                          Vbarangay="Barangay (or nearest barangay)";
                                                          Timer(Duration(seconds: 0), () {
                                                            UgetMunicipality();
                                                            UbarangayTypeRegisterController.text="";
                                                          });
                                                          UprovinceValue = value as String;
                                                        });
                                                      },
                                                      iconSize: 14,
                                                      iconEnabledColor: _colorFromHex(themeContent),
                                                      iconDisabledColor: Colors.grey,
                                                      buttonHeight: 40,
                                                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                      buttonDecoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(0),
                                                        border: Border.all(
                                                          color: Colors.black26,
                                                        ),
                                                        color:_colorFromHex(themeInput),
                                                      ),
                                                      buttonElevation: 2,
                                                      itemHeight: 40,
                                                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                      dropdownMaxHeight: 200,
                                                      dropdownPadding: null,
                                                      style: TextStyle(fontSize: 12),
                                                      dropdownDecoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(0),
                                                        color: _colorFromHex(themeNewCard),
                                                      ),
                                                      dropdownElevation: 8,
                                                      scrollbarRadius: const Radius.circular(40),
                                                      scrollbarThickness: 6,
                                                      scrollbarAlwaysShow: true,
                                                      offset: const Offset(-20, 0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if(UprovinceValue=="NATIONAL CAPITAL REGION - FOURTH DISTRICT"||UprovinceValue=="NATIONAL CAPITAL REGION - MANILA"
                                                  ||UprovinceValue=="NATIONAL CAPITAL REGION - SECOND DISTRICT"||UprovinceValue=="NATIONAL CAPITAL REGION - THIRD DISTRICT"
                                                  ||UprovinceValue=="TAGUIG - PATEROS")
                                                Padding(
                                                  padding: EdgeInsets.only(left: 20, right: 0,top:40),
                                                  child:Text(Ucitymunicipality.join(","),style:TextStyle(fontSize:8,color:_colorFromHex(themeInputText))),
                                                ),
                                            ],
                                          ),


                                        ),
                                        Container(height: 5),

                                        Expanded(
                                          child:
                                          Container(
                                            height: 45,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  hint: Row(
                                                    children:  [
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          VCityMunicipality,
                                                          style: TextStyle(

                                                              color: _colorFromHex( themeInputText ),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: Ucitymunicipality
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(

                                                              color: _colorFromHex(themeInputText),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value:UcitymunicipalityValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      Ubarangay.clear();
                                                      UbarangayValue=null;
                                                
                                                      Vbarangay="Barangay (or nearest barangay)";
                                                      Timer(Duration(seconds: 0), () {
                                                        UgetBarangay();
                                                        UbarangayTypeRegisterController.text="";
                                                      });
                                                      UcitymunicipalityValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 40,
                                                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color:_colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  style: TextStyle(fontSize: 12),
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                          ),




                                        ),

                                        Container(height: 5),

                                        Expanded(
                                          child: Container(
                                            height: 45,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  hint: Row(
                                                    children:  [
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          Vbarangay,
                                                          style: TextStyle(
                                                              color: _colorFromHex(themeInputText),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: Ubarangay
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(

                                                              color:  _colorFromHex(themeInputText),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value:UbarangayValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      UbarangayValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 40,
                                                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color:_colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  style: TextStyle(fontSize: 12),
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                          ),


                                        ),
                                        Container(height: 5,),
                                        /* Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: '  Type here your barangay if not seen when scrolling in the box above',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent),fontSize: 9),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                              onChanged: (value){
                                                setState(() {
                                                  barangayValue=null;
                                                  barangay.clear();
                                                  if(barangayTypeRegisterController.text.toString()==""){
                                                    if(provinceValue!=null){
                                                      getBarangay();
                                                    }
                                                  }
                                                });
                                              },
                                              controller: barangayTypeRegisterController,
                                            ),
                                          ),
                                        ),*/
                                        Container(height: 5,),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: UcellphoneRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: '  Cellphone No.(optional)',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent),fontSize: 15),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText),fontSize: 15),
                                            ),
                                          ),
                                        ),
                                          Container(
                                          height: 15,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("Will you have had at least your first dose before the day of the Makabayan Pilipino Bakuna Raffle Draws planned in May 2022 or later raffle draws?",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                        ),
                                        Row(children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child:Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: yesDraw,
                                                checkColor: Colors.white,
                                                activeColor: _colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(yesDraw==false){
                                                      yesDraw=true;
                                                      noDraw=false;
                                                    }else{
                                                      yesDraw=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),

                                          Flexible(
                                          flex:9,
                                            child: Text("Yes",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
                                            child: Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: noDraw,
                                                checkColor: Colors.white,
                                                activeColor:_colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(noDraw==false){
                                                      noDraw=true;
                                                      yesDraw=false;

                                                    }else{
                                                      noDraw=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),

                                          Flexible(
                                            child: Text("No",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),

                                        ],
                                        ),
                                        Container(height: 10),
                                        Row(children: [
                                          Container(
                                            width: 2,
                                          ),
                                          Flexible(
                                            child:Column(children:[
                                              Theme(
                                                data: ThemeData(
                                                  primarySwatch: Colors.blue,
                                                  unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                ),
                                                child: Checkbox(
                                                  value: wouldFollow,
                                                  checkColor: Colors.white,
                                                  activeColor: _colorFromHex(themeContent),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if(wouldFollow==false){
                                                        wouldFollow=true;
                                                      }else{
                                                        wouldFollow=false;
                                                      }
                                                    });
                                                  },),
                                              ),
                                              Container(
                                                  height:50,
                                              ),
                                            ]),
                                          ),

                                          Flexible(
                                            flex:9,
                                            child:      Text("I would like to join and follow the Makabayan Pilipino Bakuna Raffle Draws for big cash and other prizes. All FREE! Bigger cash and prizes if I am vaccinated. Even if not vaccinated, I can still join and win.",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),

                                        ],
                                        ),

                                        Container(height: 10),
                                        Row(children: [
                                          Container(
                                            width: 2,
                                          ),
                                          Flexible(
                                            child:Column(
                                                children:[
                                              Theme(
                                                data: ThemeData(
                                                  primarySwatch: Colors.blue,
                                                  unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                ),
                                                child: Checkbox(
                                                  value: wouldReview,
                                                  checkColor: Colors.white,
                                                  activeColor: _colorFromHex(themeContent),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if(wouldReview==false){
                                                        wouldReview=true;
                                                      }else{
                                                        wouldReview=false;
                                                      }
                                                    });
                                                  },),
                                              ),
                                                      Container(
                                                    height:20,
                                                  ),
                                            ]
                                            )
                                          ),

                                          Flexible(
                                            flex:9,
                                            child:Text("I would like to review the terms, conditions, and rules of the Klackr.world  platform, then to sign up at the end.",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),

                                        ],
                                        ),
                                        Container(height: 10),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("Unclick any box if you do not agree. ",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10)),
                                          ),
                                        ),
                                       Container(
                                         height:20,
                                       ),
                                         Container(
                                          height: 45,
                                          alignment: Alignment.center,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                            child:ElevatedButton(
                                              child: Text('BACK',style:TextStyle(color: Colors.white)),
                                              onPressed: () {
                                                setState(() {
                                                  lobby="lobby";
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary: _colorFromHex("#2786C9"),
                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                  textStyle: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height:30,
                                        ),
                                      ]
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ]),
                      ),

                    if(lobby=="lobby")//LOBBY
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height-40,
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                
                                  Container(
                                    child:Row(
                                        children:[
                                          Expanded(
                                            flex:3,
                                            child:Container(
                                              child:Column(
                                                children:[
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        lobbyselect="lobbyposting";
                                                        iconSetting2 = dark;
                                                        iconAdd=red;
                                                        iconVicinity=dark;
                                                        iconVicinity="00FFFFFF";
                                                      });
                                                    },
                                                    icon: Icon(Icons.add,color:_colorFromHex(iconAdd),size:35),
                                                  ),
                                                 
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child:Container(
                                              child:Column(
                                                children:[
                                                  Container(height:4),
                                                  Material(
  type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
  child: Ink(
    decoration: BoxDecoration(
   
      color: _colorFromHex(iconVicinity),
      shape: BoxShape.circle,
    ),
    child: InkWell(
      //This keeps the splash effect within the circle
      borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
      onTap: (){     setState(() {
                                                              lobbyselect="";

                                                                setState(() {
                                                                  lobbyselect="lobbygetpost";
                                                                  iconSetting2 = dark;
                                                                  iconAdd=dark;
                                                                  iconVicinity=red;
                                                                });

                                                            });},
      child: Padding(
        padding:EdgeInsets.all(4),
        child: Container(
          height:28,
          child: Tab(icon: new Image.asset("assets/logo/klackr_logo.png")),
        ),
      ),
    ),
  )
),
                                              
                                                
                                                  
                                                 

                                                  
                                                 
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child:Container(
                                              child:Column(
                                                children:[
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        lobbyselect="lobbyhome";
                                                        iconSetting2 = red;
                                                        iconAdd=dark;
                                                        iconVicinity="00FFFFFF";
                                                      });
                                                    },
                                                    icon: Icon(Icons.settings,color:_colorFromHex(iconSetting2),size:35),
                                                  ),
                                            
                                                ],
                                              ),
                                            ),
                                          ),
                                          if(refreshing=="false")
                                          Expanded(
                                            flex:3,
                                            child:Container(
                                              child:Column(
                                                children:[
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                       refreshing="true";
                                                       Timer(Duration(seconds: 2), () {
                                                         fetchData1();
                                                       });
                                                      }); 
                                                    },
                                                    icon: Icon(Icons.refresh,color:_colorFromHex(dark),size:35),
                                                  ),
                                                
                                                ],
                                              ),
                                            ),
                                          ),
                                          if(refreshing=="true")
                                            Expanded(
                                              flex:3,
                                              child:Container(
                                                child:Column(
                                                  children:[
                                                    Container(
                                                    
                                                      child: SizedBox(
                                                        height: 25,
                                                        width:25,
                                                        child: CircularProgressIndicator(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                    
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ]
                                    ),
                                  ),
                                   Container(
                                    child:Row(
                                        children:[
                                          Expanded(
                                            flex:3,
                                            child:Container(
                                              child:Column(
                                                children:[
                                                 
                                                  Text("add post",style:TextStyle(color:_colorFromHex(themeInputText))),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child:Container(
                                              child:Column(
                                                children:[
                                                  Text("vicinity",style:TextStyle(color:_colorFromHex(themeInputText))),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child:Container(
                                              child:Column(
                                                children:[
                                                  Text("settings",style:TextStyle(color:_colorFromHex(themeInputText))),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if(refreshing=="false")
                                          Expanded(
                                            flex:3,
                                            child:Container(
                                              child:Column(
                                                children:[
                                                  Text("refresh",style:TextStyle(color:_colorFromHex(themeInputText))),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if(refreshing=="true")
                                            Expanded(
                                              flex:3,
                                              child:Container(
                                                child:Column(
                                                  children:[
                                                    Text("refresh",style:TextStyle(color:_colorFromHex(themeInputText))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ]
                                    ),
                                  ),
                                  Container(
                                    height:30,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SizedBox(
                                  child:ListView.builder(
                                    controller: ScrollController(),
                                    itemCount: 1,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        child:    IntrinsicHeight(
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                            Expanded(
                                              child: Column(children: [
                                                IntrinsicHeight(
                                                  child: Column( children: [
                                                    if(lobbyselect=="lobbyposting")
                                                      Container(
                                                        child:   IntrinsicHeight(
                                                          child: Column( children: [
                                                            if(info=="false")
                                                              Expanded(
                                                                child: Column(
                                                                    children: [
                                                                      IntrinsicHeight(
                                                                        child: Row( crossAxisAlignment: CrossAxisAlignment.start,children: [
                                                                          Expanded(
                                                                            flex:0,
                                                                            child: Column(
                                                                              children:[
                                                                                Container(
                                                                                  height:45,
                                                                                  width:45,
                                                                                  alignment: Alignment.topLeft,
                                                                                  child: IconButton(onPressed: (){},icon: Icon(Icons.account_circle_rounded,size: 50,color:_colorFromHex(themeContent))),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:0,
                                                                            child:Container(

                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:10,
                                                                          ),
                                                                          Expanded(
                                                                            flex:9,
                                                                            child: IntrinsicHeight(
                                                                              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                Expanded(
                                                                                  child: Column(children: [
                                                                                    Flexible(
                                                                                      flex:0,
                                                                                      child:Container(
                                                                                        alignment: Alignment.topLeft,
                                                                                        child:   Padding(
                                                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                          child:  Text("Hello",style: TextStyle(color:Colors.transparent,fontWeight: FontWeight.bold,fontSize: 13)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                   
                                                                                   Row(
                                                                                      children:[
                                                                                        Container(width:5),
Container(
                                                                                        alignment: Alignment.topLeft,
                                                                                        child:   Padding(
                                                                                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                          child:  Text(username,style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 13)),
                                                                                        ),
                                                                                      ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      children:[
                                                                                        Container(width:5),/*
 Container(


              child:InkWell( child:Text('Edit profile',style:TextStyle(color:_colorFromHex(themeContent))),onTap:(){
                 setState(() {
                                                                                              lobby="editprofile";
                                                                                            });
              } ),
                                                                                     ),*/
                                                                                      ],
                                                                                    ),
                                                                                    
                                                                                  ]
                                                                                  ),
                                                                                ),
                                                                              ]),
                                                                            ),
                                                                          ),

                                                                        ]),
                                                                      ),

                                                                      Container(
                                                                        height: 20,
                                                                      ),
                                                                     
                                                                            if(edit=="true")
                                                                          Padding(
                                                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                                                      child: Container(
                                                                         child:Card(
                                                                           child:Container(
                                        
                                        child:Column(
                                          children:[
       Container(
                                              
                                                                              child:   Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                                child: TextField(
                                                                                  onChanged:(value){
                                                                                UpostController.text=value;
                                                                                 },
                                                                                  keyboardType: TextInputType.multiline,
                                                                                  maxLines: null,
                                                                                  minLines:7,
                                                                                  decoration: InputDecoration(
                                                                                    border: InputBorder.none,
                                                                                   // filled: true,
                                                                                   // fillColor:Colors.white,
                      
                                                                                    hintText: "Post in your vicinity (home barangay)",
                                                                                    hintStyle: TextStyle(color:Colors.black),
                                                                                  ),
                                                                                  style: TextStyle(color: Colors.black),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                                Padding(
                                                                                padding: EdgeInsets.only(left: 6, top:0),
                                                                            child:IntrinsicHeight(
                                                                              child: Row(children: [
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    setState(() {
                                                                                   deleteposting();
                                                                                    });
                                                                                  },
                                                                                  icon:Icon(Icons.delete,color: Colors.red),
                                                                                ),
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    setState(() {
                                                                                        UpostController.text="";
                                                                                          IDpost="";
                                                                                          CPpost="";
                                                                                          edit="false";
                                                                                          lobbyselect="lobbygetpost";
                                                                                    });
                                                                                  },
                                                                                  icon:Icon(Icons.cancel,color: Colors.black),
                                                                                ),

                                                                              ]
                                                                              ),
                                                                            ),
                                                                                   ),
                                          ],
                                        ),
                                                                           ),
                                                                         ),
                                                                      ),
                                                                          ),
                                                                         if(edit=="false")
  Padding(
                                                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                                                      child: Container(
                                                                         child:Card(
                                                                           child:Container(
                                        
                                        child:Column(
                                          children:[
                                           
                                                                       Container(
                                              
                                                                              child:   Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                                child: TextField(
                                                                                  controller: postingRegisterController,
                                                                                  keyboardType: TextInputType.multiline,
                                                                                  maxLines: null,
                                                                                  minLines:7,
                                                                                  decoration: InputDecoration(
                                                                                    border: InputBorder.none,
                                                                                   // filled: true,
                                                                                   // fillColor:Colors.white,
                      
                                                                                    hintText: "Post in your vicinity (home barangay)",
                                                                                    hintStyle: TextStyle(color:Colors.black),
                                                                                  ),
                                                                                  style: TextStyle(color: Colors.black),
                                                                                ),
                                                                              ),
                                                                            ),

                                                                   
                                                                       
                                                                      if(loading=="true")
                                                                        Container(
                                                                          child:Column(
                                                                            children:[
                                                                              CircularProgressIndicator(

                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if(loading=="false")
                                                                        Container(
                                                                          child:Column(
                                                                            children:[
                                                                              if(_imageFileList!=null||file != null)
                                                                                Container(
                                                                                  alignment:Alignment.topRight,
                                                                                  child:IconButton(
                                                                                    onPressed: () {
                                                                                      setState(() {
                                                                                        _imageFileList=null;
                                                                                        file=null;

                                                                                      });
                                                                                    },
                                                                                    icon:Icon(Icons.cancel,color: Colors.black),
                                                                                  ),
                                                                                ),
                                                                              if(_imageFileList!=null||file != null)
                                                                               Padding(
                                                                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                               child: Container(
                                                                                  height:MediaQuery.of(context).size.height-320,
                                                                        
                                                                                  child: Center(
                                                                                    child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
                                                                                        ? FutureBuilder<void>(
                                                                                      future: retrieveLostData(),
                                                                                      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                                                                                        switch (snapshot.connectionState) {
                                                                                          case ConnectionState.none:
                                                                                          case ConnectionState.waiting:
                                                                                            return const Text(
                                                                                              'You have not yet picked an image.',
                                                                                              textAlign: TextAlign.center,
                                                                                            );
                                                                                          case ConnectionState.done:
                                                                                            return _handlePreview();
                                                                                          default:
                                                                                            if (snapshot.hasError) {
                                                                                              return Text(
                                                                                                'Pick image/video error: ${snapshot.error}}',
                                                                                                textAlign: TextAlign.center,
                                                                                              );
                                                                                            } else {
                                                                                              return const Text(
                                                                                                'You have not yet picked an image.',
                                                                                                textAlign: TextAlign.center,
                                                                                              );
                                                                                            }
                                                                                        }
                                                                                      },
                                                                                    )
                                                                                        : _handlePreview(),
                                                                                  ),
                                                                                ),
                                                                               ),

                                                                               
                                                                               Padding(
                                                                                padding: EdgeInsets.only(left: 6, top:0),
                                                                            child:IntrinsicHeight(
                                                                              child: Row(children: [
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    setState(() {
                                                                                      isVideo = true;
                                                                                      _onImageButtonPressed(ImageSource.gallery);
                                                                                    });
                                                                                  },
                                                                                  icon:Icon(Icons.video_collection,color: Colors.black),
                                                                                ),
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    setState(() {
                                                                                      isVideo = false;
                                                                                      _onImageButtonPressed(ImageSource.gallery, context: context);
                                                                                    });
                                                                                  },
                                                                                  icon:Icon(Icons.photo,color: Colors.black),
                                                                                ),

                                                                              ]
                                                                              ),
                                                                            ),
                                                                                   ),
                                                                            ],
                                                                          ),
                                                                        ),
                                          ],
                                        ),
                                      ),

                                                                         ),
                                                                       ),
  ),
                                                                      
                                                                    
                                                                      Container(
                                                                        height: 10,
                                                                      ),
                                                                      if(edit=="false")
                                                                        Container(
                                                                          height: 45,
                                                                          alignment: Alignment.topRight,
                                                                          child:   Padding(
                                                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                            child:ElevatedButton(
                                                                              child: Text('KLACK!',style:TextStyle(color: _colorFromHex("#FFF200"))),
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  if(postingRegisterController.text==""){
                                                                                    if(allow=="on"){
                                                                                      allow="off";
                                                                                      Fluttertoast.showToast(
                                                                                          msg: "Blank spaces not allowed",
                                                                                          toastLength: Toast.LENGTH_SHORT,
                                                                                          gravity: ToastGravity.BOTTOM,
                                                                                          timeInSecForIosWeb: 3,
                                                                                          backgroundColor: Colors.red,
                                                                                          textColor: Colors.black,
                                                                                          fontSize: 15.0
                                                                                      );
                                                                                      Timer(Duration(seconds: 3), () {
                                                                                        allow="on";
                                                                                      });
                                                                                    }
                                                                                  }else{
                                                                                    setState(() {
                                                                                      _Video.clear();
                                                                                    });
                                                                                    if(loading=="false"){
                                                                                      loading="true";
                                                                                      posting();
                                                                                    }
                                                          
                                                          
                                                                                  }
                                                                                });
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                  textStyle: TextStyle(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                     Column(
                                                                       children:[
                                                                         Row(children:[
                                                                           Container(width:15),
                                                                           Expanded(
                                                                           flex:0,
                                                                           child:Padding(
                                                                             padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                             child:Text('Private posts',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                           ),
                                                                           ),
                                                                      
                                                                         ]),
                                                                         Container(height:10),
                                                                         Row(children:[
                                                                           Container(width:16),
                                                                           Expanded(
                                                                             flex:0,
                                                                             child:Container(
                                                                               alignment: Alignment.topLeft,
                                                                               child:   Padding(
                                                                                   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                   child:OutlineButton(
                                                                                     shape: RoundedRectangleBorder(),
                                                                                     textColor: Colors.grey,
                                                                                     child:Text('Terms & Conditions',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                     borderSide: BorderSide(
                                                                                         color: Colors.black, style: BorderStyle.solid,
                                                                                         width: 2),
                                                                                     onPressed: () {
                                                                                       if(role=="influencer"){
                                                                                         setState(() {
                                                                                           info="1";
                                                                                         });
                                                                                       }
                                                                                     },
                                                                                   )
                                                                               ),
                                                                             ),
                                                                           ),
                                                                           Container(width:5),
                                                                           Expanded(
                                                                             flex:0,
                                                                             child:Container(
                                                                               alignment: Alignment.topLeft,
                                                                               child:   Padding(
                                                                                   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                   child:OutlineButton(
                                                                                     shape: RoundedRectangleBorder(),
                                                                                     textColor: Colors.grey,
                                                                                     child:Text('STATS',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                     borderSide: BorderSide(
                                                                                         color: Colors.black, style: BorderStyle.solid,
                                                                                         width: 2),
                                                                                     onPressed: () {
                                                                                       if(role=="influencer"){
                                                                                         setState(() {
                                                                                           info="4";
                                                                                         });
                                                                                       }
                                                                                     },
                                                                                   )
                                                                               ),
                                                                             ),
                                                                           ),
                                                                         ]),
                                                                         Container(height:10),
                                                                         Row(children:[
                                                                           Container(width:15),
                                                                           Expanded(
                                                                             flex:0,
                                                                             child:Padding(
                                                                               padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                               child:Text('Ads & commerical posts',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                             ),
                                                                           ),
                                                                           Container(width:20),

                                                                         ]),


                                                                         Container(height:10),
                                                                         Row(children:[
                                                                           Container(width:16),
                                                                           Expanded(
                                                                             flex:0,
                                                                             child:Container(
                                                                               alignment: Alignment.topLeft,
                                                                               child:   Padding(
                                                                                   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                   child:OutlineButton(
                                                                                     shape: RoundedRectangleBorder(),
                                                                                     textColor: Colors.grey,
                                                                                     child:Text('Terms & Conditions',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                     borderSide: BorderSide(
                                                                                         color: Colors.black, style: BorderStyle.solid,
                                                                                         width: 2),
                                                                                     onPressed: () {
                                                                                       if(role=="influencer"){
                                                                                         setState(() {
                                                                                           info="2";
                                                                                         });
                                                                                       }
                                                                                     },
                                                                                   )
                                                                               ),
                                                                             ),
                                                                           ),
                                                                           Container(width:5),
                                                                           Expanded(
                                                                             flex:0,
                                                                             child:Container(
                                                                               alignment: Alignment.topLeft,
                                                                               child:   Padding(
                                                                                   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                   child:OutlineButton(
                                                                                     shape: RoundedRectangleBorder(),
                                                                                     textColor: Colors.grey,
                                                                                     child:Text('STATS',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                     borderSide: BorderSide(
                                                                                         color: Colors.black, style: BorderStyle.solid,
                                                                                         width: 2),
                                                                                     onPressed: () {
                                                                                       if(role=="influencer"){
                                                                                         setState(() {
                                                                                           info="5";
                                                                                         });
                                                                                       }
                                                                                     },
                                                                                   )
                                                                               ),
                                                                             ),
                                                                           ),
                                                                         ]),
                                                                         Container(height:10),
                                                                         Row(children:[
                                                                           Container(width:16),
                                                                           Expanded(
                                                                             flex:0,
                                                                             child:Padding(
                                                                               padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                               child:Text('Influencer placements',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                             ),
                                                                           ),
                                                                           Container(width:33),
                                                                         ]),
                                                                         Container(height:10),
                                                                         Row(children:[
                                                                           Container(width:16),
                                                                           Expanded(
                                                                             flex:0,
                                                                             child:Container(
                                                                               alignment: Alignment.topLeft,
                                                                               child:   Padding(
                                                                                   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                   child:OutlineButton(
                                                                                     shape: RoundedRectangleBorder(),
                                                                                     textColor: Colors.grey,
                                                                                     child:Text('Terms & Conditions',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                     borderSide: BorderSide(
                                                                                         color: Colors.black, style: BorderStyle.solid,
                                                                                         width: 2),
                                                                                     onPressed: () {
                                                                                       if(role=="influencer"){
                                                                                         setState(() {
                                                                                           info="3";
                                                                                         });
                                                                                       }
                                                                                     },
                                                                                   )
                                                                               ),
                                                                             ),
                                                                           ),
                                                                           Container(width:5),
                                                                           Expanded(
                                                                             flex:0,
                                                                             child:Container(
                                                                               alignment: Alignment.topLeft,
                                                                               child:   Padding(
                                                                                   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                   child:OutlineButton(
                                                                                     shape: RoundedRectangleBorder(),
                                                                                     textColor: Colors.grey,
                                                                                     child:Text('STATS',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                     borderSide: BorderSide(
                                                                                         color: Colors.black, style: BorderStyle.solid,
                                                                                         width: 2),
                                                                                     onPressed: () {
                                                                                       if(role=="influencer"){
                                                                                         setState(() {
                                                                                           info="6";
                                                                                         });
                                                                                       }
                                                                                     },
                                                                                   )
                                                                               ),
                                                                             ),
                                                                           ),
                                                                         ]),
                                                                       ]
                                                                     ),


                                                                      Container(
                                                                        height: 20,
                                                                      ),
                                                                      if(edit=="true")
                                                                        Container(
                                                                          height: 45,
                                                                          alignment: Alignment.center,
                                                                          child:   Padding(
                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                            child:ElevatedButton(
                                                                              child: Text('SAVE',style:TextStyle(color: _colorFromHex("#FFF200"))),
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  if(UpostController.text==""){
                                                                                    if(allow=="on"){
                                                                                      allow="off";
                                                                                      Fluttertoast.showToast(
                                                                                          msg: "Blank spaces not allowed",
                                                                                          toastLength: Toast.LENGTH_SHORT,
                                                                                          gravity: ToastGravity.BOTTOM,
                                                                                          timeInSecForIosWeb: 3,
                                                                                          backgroundColor: Colors.red,
                                                                                          textColor: Colors.black,
                                                                                          fontSize: 15.0
                                                                                      );
                                                                                      Timer(Duration(seconds: 3), () {
                                                                                        allow="on";
                                                                                      });
                                                                                    }
                                                                                  }else{
                                                                                    updateposting();
                                                                                  }
                                                                                });
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                  textStyle: TextStyle(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Container(
                                                                        height:5,
                                                                      ),
                                                                      Container(
                                                                          height:30
                                                                      ),
                                                                    ]
                                                                ),
                                                              ),
                                                            if(info=="1")
                                                              Expanded(
                                                                child:Container(
                                                                  child: Container(
                                                                            child:   IntrinsicHeight(
                                                                              child: Column( children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          width: 500,
                                                                                          alignment: Alignment.topLeft,
                                                                                          child: IntrinsicHeight(
                                                                                            child: Row( children: [
                                                                                              Container(
                                                                                                width: 5,
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 0,
                                                                                                child:Container(
                                                                                                    alignment: Alignment.topLeft,
                                                                                                    width: 50,
                                                                                                    child:Image.asset('assets/logo/klackr_logo.png')),
                                                                                              ),
                                                                                             Container(
                                                                                                width:5,
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 10,
                                                                                                child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                                                                      Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                      Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                    ]),
                                                                                              ),

                                                                                              Expanded(
                                                                                                flex: 9,
                                                                                                child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.transparent)),
                                                                                                      Text("Inventor & Administrator            ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                      Text("Leandro Kuya Jun Verceles Jr.  ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                    ]),
                                                                                              ),
                                                                                            ]),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 30,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Klackr private posts ",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),

                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Private posts are FREE for subscribers-users and have no limit of frequency of publication (subject to reasonable use). Private posts exclude Klackr ads & commercial posts. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Private posts should not aim to advertise or promote businesses, products, services in the commercial sense; otherwise, they should be treated in the other category: Klackr ads & commercial posts. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Ads & commercial posts in the guise of private posts but actually election campaign or partisan political activity to support or defeat a candidate at any time is strictly prohibited. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Private posts should not aim to advertise or promote businesses, products, services in the commercial sense; otherwise, they should be treated in the other category: Klackr ads & commercial posts. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Also strictly prohibited are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The klackr company policies and rules against fake news and prohibited language, or any violation of this rulle may lead to a suspension or total ban on the use of the Klackr platform. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),

                                                                                        Container(
                                                                                          height: 15,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Private posts do not require pre-approval by the Klackr administrator and do not incur any waiting period to get published unlike ads & commercial posts. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Klackr platform is merely the vessel of your private posts. Hence, the the Klackr company bears no responsibility to the contents of said private posts and the publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors, managers, employees, and assigns.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("There are no algorithms on the platfrom so private posts reach 100% the subscribers-users upon their opening of the app. The ads & commercial posts are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original private post is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 35,
                                                                                        ),
                                                                                        Container(
                                                                                          height: 45,
                                                                                          alignment: Alignment.center,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('BACK',style:TextStyle(color: Colors.white)),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
                                                                                                });
                                                                                              },
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                                  textStyle: TextStyle(
                                                                                                      fontWeight: FontWeight.bold)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),

                                                                              ]),
                                                                            ),
                                                                          ),
                                                                ),
                                                              ),
                                                            if(info=="2")
                                                              Expanded(
                                                                child:Container(
                                                                            child:   IntrinsicHeight(
                                                                              child: Column( children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          width: 500,
                                                                                          alignment: Alignment.topLeft,
                                                                                          child: IntrinsicHeight(
                                                                                            child: Row( children: [
                                                                                              Container(
                                                                                                width: 5,
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 0,
                                                                                                child:Container(
                                                                                                    alignment: Alignment.topLeft,
                                                                                                    width: 50,
                                                                                                    child:Image.asset('assets/logo/klackr_logo.png')),
                                                                                              ),
                                                                                               Container(
                                                                                                width:5,
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 10,
                                                                                                child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                                                                      Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                      Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                    ]),
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 9,
                                                                                                child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.transparent)),
                                                                                                      Text("Inventor & Administrator            ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                      Text("Leandro Kuya Jun Verceles Jr.  ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                    ]),
                                                                                              ),
                                                                                            ]),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 30,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Klackr ads & commercial posts ",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),

                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Your advertisments and commercial posts are FREE for this beta test. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("An ad or commercial post is evaluated by the Klackr.world administrator and if within 48 hours there is no reply, it is deemed as approved and will automatically be posted unless there is a violation of company rules then which it may be taken down at anytime. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Ads & commercial posts in the guise of private posts but actually election campaign or partisan political activity to support or defeat a candidate at any time is strictly prohibited. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Ads & commercial posts in the context of an election campaign or partisan political activity to support or defeat a candidate or partylist party at any time are strictly prohibited  without the approval of the Klackr administrator.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The post may be in the nature of a discount.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Publication by the same person, store, outlet, company, or business outfit shall be limited to two posts per week. The ad or commercial post expires in 72 hours from the time of publication. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),

                                                                                        Container(
                                                                                          height: 15,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Any strategy to duplicate persons or entities acting as separate publishers but discovered to be actually the same person or entity just to avoid the two posts per week limitation shall be dealt with severely and may lead to an immediate permanent ban from further publishing and/or use of the platform.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The publisher of the ad or  commercial post shall have the total responsibility of securing the necessary clearance or permit from the regulating agencies for the posting, if required. The publisher shall save free from any liability the Klackr company or any of its equity holders, officers, directors, administrator, managers, employees, and assigns because of the post.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Strictly prohibited are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The klackr company policies and rules against fake news and prohibited language may lead to a suspension or total ban on the use of the Klackr platform.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Klackr platform is merely the vessel of your ads & commercial posts. Hence, the the Klackr company bears no responsibility to the contents of said ads & commercial posts and the publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors, managers, employees, and assigns.     ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("There are no algorithms on the platfrom so ads & commerical posts reach 100% the subscribers-users upon their opening of the app. The ads & commercial posts are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original ad or commericial post is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Once the ad or commercial post is approved or denied with 48 hours, the administrator shall send a direct message (no reply) to the email address of the personal publisher. If there is no message within the 48 hours, the ad or commerical post is deemed approved of publication. This is automatic, no intervention from the publisher necessary. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 35,
                                                                                        ),
                                                                                        Container(
                                                                                          height: 45,
                                                                                          alignment: Alignment.center,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('BACK',style:TextStyle(color: Colors.white)),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
                                                                                                });
                                                                                              },
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                                  textStyle: TextStyle(
                                                                                                      fontWeight: FontWeight.bold)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),

                                                                              ]),
                                                                            ),
                                                                          ),
                                                              ),
                                                            if(info=="3")
                                                              Expanded(
                                                                child:Container(
                                                                            child:   IntrinsicHeight(
                                                                              child: Column( children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          width: 500,
                                                                                          alignment: Alignment.topLeft,
                                                                                          child: IntrinsicHeight(
                                                                                            child: Row( children: [
                                                                                              Container(
                                                                                                width: 5,
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 0,
                                                                                                child:Container(
                                                                                                    alignment: Alignment.topLeft,
                                                                                                    width: 50,
                                                                                                    child:Image.asset('assets/logo/klackr_logo.png')),
                                                                                              ),
                                                                                              Container(
                                                                                                width:5,
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 10,
                                                                                                child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                                                                      Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                      Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                    ]),
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 9,
                                                                                                child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.transparent)),
                                                                                                      Text("Inventor & Administrator            ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                      Text("Leandro Kuya Jun Verceles Jr.  ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                                                                    ]),
                                                                                              ),
                                                                                            ]),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 30,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Klackr Influencer placements",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),


                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                     
                                                                                       
                                                                                         
                                                                                        Container(
                                                                               alignment: Alignment.topLeft,
                                                                               child:   Padding(
                                                                                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                   child:OutlineButton(
                                                                                     shape: RoundedRectangleBorder(),
                                                                                     textColor: Colors.grey,
                                                                                     child:Column(
                                                                                       children:[
                                                                                         Container(
                                                                                           height:10,
                                                                                         ),
                                                                                          Row(children: [
                                                                                          Flexible(
                                                                                            flex:7,
                                                                                            child:    Container(
                                                                                              alignment: Alignment.topLeft,
                                                                                              child:   Padding(
                                                                                                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                                child:    Text("Construct your",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.w500)
                                                                                                ),
                                                                                              ),),
                                                                                          ),

                                                                                        ]
                                                                                        ),
                                                                                          Row(children: [
                                                                                          Flexible(
                                                                                            flex:7,
                                                                                            child:    Container(
                                                                                              alignment: Alignment.topLeft,
                                                                                              child:   Padding(
                                                                                                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                                child:    Text("INFLUENCIAL PLACEMENT AREA/s (IPAs)",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.w500)
                                                                                                ),
                                                                                              ),),
                                                                                          ),

                                                                                        ]
                                                                                        ),
                                                                                          Row(children: [
                                                                                          Flexible(

                                                                                            child:    Container(
                                                                                              alignment: Alignment.topLeft,
                                                                                              child:   Padding(
                                                                                                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                                child:    Text("IPA profile 3",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.w500)
                                                                                                ),
                                                                                              ),),
                                                                                          ),

                                                                                        ]
                                                                                        ),
                                                                                        Container(
                                                                                           height:10,
                                                                                         ),
                                                                                       ],
                                                                                     ),
                                                                                     borderSide: BorderSide(
                                                                                         color: Colors.black, style: BorderStyle.solid,
                                                                                         width: 2),
                                                                                     onPressed: () {
                                                                                       if(role=="influencer"){
                                                                                         setState(() {
                                                                                           info="1";
                                                                                         });
                                                                                       }
                                                                                     },
                                                                                   )
                                                                               ),
                                                                             ),
                                                                                       
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Influencers (i.e., candidates and/or partlylist parties for the May 2022 elections) may publish their propaganda in their conracted area or any part inside thereof as Influencer placements.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ), 
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10, 
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Klackr platform is merely the vessel of your Influencer placements. Hence, the the Klackr company bears no responsibility to the contents of said Influencer placements and the Influencer publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors,  employees, managers, and asssigns.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Until May 7, 2022 or two days before election day,  the Influencer considered as a single candidate group will be entitled to four propaganda placements published per week. An Influencer group with a maximum of 10 Influencers in the group, however, will be entitled to 12 propaganda placements published per week. The propaganda placements are cumulative and unused placements may be carried over to the next week, and so forth. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Strictly prohibited are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Influencer placements do not require pre-approval by the Klackr administrator or incur any waiting period before their publication unlike ads & commerical posts.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),

                                                                                        Container(
                                                                                          height: 15,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("There are no algorithms on the platfrom so Influencer placements reach 100% the subscribers-users upon their opening of the app. The placements are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original placement is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Strictly prohibited are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The klackr company policies and rules against fake news and prohibited language may lead to a suspension or total ban on the use of the Klackr platform.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Klackr platform is merely the vessel of your ads & commercial posts. Hence, the the Klackr company bears no responsibility to the contents of said ads & commercial posts and the publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors, managers, employees, and assigns.     ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("There are no algorithms on the platfrom so ads & commerical posts reach 100% the subscribers-users upon their opening of the app. The ads & commercial posts are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original ad or commericial post is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Once the ad or commercial post is approved or denied with 48 hours, the administrator shall send a direct message (no reply) to the email address of the personal publisher. If there is no message within the 48 hours, the ad or commerical post is deemed approved of publication. This is automatic, no intervention from the publisher necessary. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 35,
                                                                                        ),
                                                                                        Container(
                                                                                          height: 45,
                                                                                          alignment: Alignment.center,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('BACK',style:TextStyle(color: Colors.white)),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
                                                                                                });
                                                                                              },
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                                  textStyle: TextStyle(
                                                                                                      fontWeight: FontWeight.bold)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),

                                                                              ]),
                                                                            ),
                                                                          ),
                                                              ),
                                                            if(info=="4")
                                                              Expanded(
                                                                child:Container(
                                                                  child: Column(children: [
                                                                    SizedBox(
                                                                      height: MediaQuery.of(context).size.height-95,
                                                                      child:ListView.builder(
                                                                        controller: ScrollController(),
                                                                        itemCount: 1,
                                                                        itemBuilder: (BuildContext context, int index) {
                                                                          return Container(
                                                                            child:   IntrinsicHeight(
                                                                              child: Column( children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        /* Container(
                                                              width: 500,
                                                              alignment: Alignment.topLeft,
                                                              child: IntrinsicHeight(
                                                                child: Row( children: [
                                                                  Container(
                                                                    width: 5,
                                                                  ),
                                                                  Expanded(
                                                                    flex: 0,
                                                                    child:Container(
                                                                        alignment: Alignment.topLeft,
                                                                        width: 50,
                                                                        child:Image.asset('assets/logo/klackr_logo.png')),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 10,
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                                          Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                          Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                        ]),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 10,
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                        children: [
                                                                          Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.transparent)),
                                                                          Text("Inventor & Administrator            ",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                          Text("Leandro Kuya Jun Verceles Jr.  ",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                        ]),
                                                                  ),
                                                                ]),
                                                              ),
                                                            ),*/
                                                                                        Container(
                                                                                          height: 30,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("STATS",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Klackr private posts",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Duration from: N/A",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("to: N/A",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Followers/Native Boost: 3,123",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 5,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Posts allowed per week : unlimited",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Duration of post : 72 hours",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Posting History",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 150,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:Card(

                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                          height: 45,
                                                                                          alignment: Alignment.center,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('BACK',style:TextStyle(color: Colors.white)),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
                                                                                                });
                                                                                              },
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                                  textStyle: TextStyle(
                                                                                                      fontWeight: FontWeight.bold)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),

                                                                              ]),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),

                                                                  ]
                                                                  ),
                                                                ),
                                                              ),
                                                            if(info=="5")
                                                              Expanded(
                                                                child:Container(
                                                                  child: Column(children: [
                                                                    SizedBox(
                                                                      height: MediaQuery.of(context).size.height-95,
                                                                      child:ListView.builder(
                                                                        controller: ScrollController(),
                                                                        itemCount: 1,
                                                                        itemBuilder: (BuildContext context, int index) {
                                                                          return Container(
                                                                            child:   IntrinsicHeight(
                                                                              child: Column( children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        /* Container(
                                                              width: 500,
                                                              alignment: Alignment.topLeft,
                                                              child: IntrinsicHeight(
                                                                child: Row( children: [
                                                                  Container(
                                                                    width: 5,
                                                                  ),
                                                                  Expanded(
                                                                    flex: 0,
                                                                    child:Container(
                                                                        alignment: Alignment.topLeft,
                                                                        width: 50,
                                                                        child:Image.asset('assets/logo/klackr_logo.png')),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 10,
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                                          Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                          Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                        ]),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 10,
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                        children: [
                                                                          Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.transparent)),
                                                                          Text("Inventor & Administrator            ",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                          Text("Leandro Kuya Jun Verceles Jr.  ",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                        ]),
                                                                  ),
                                                                ]),
                                                              ),
                                                            ),*/
                                                                                        Container(
                                                                                          height: 30,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("STATS",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Klackr ads & commercial posts",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Juan de la Cruz Bakery, 5% discount pandesal ",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Duration from: N/A",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("to: N/A",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Native Boost : 120,000",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Posts allowed per week : 2",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Duration of post : 72 hours",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Posting History",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 150,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:Card(

                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                          height: 45,
                                                                                          alignment: Alignment.center,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('BACK',style:TextStyle(color: Colors.white)),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
                                                                                                });
                                                                                              },
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                                  textStyle: TextStyle(
                                                                                                      fontWeight: FontWeight.bold)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),

                                                                              ]),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),

                                                                  ]
                                                                  ),
                                                                ),
                                                              ),
                                                            if(info=="6")
                                                              Expanded(
                                                                child:Container(
                                                                  child: Column(children: [
                                                                    SizedBox(
                                                                      height: MediaQuery.of(context).size.height-95,
                                                                      child:ListView.builder(
                                                                        controller: ScrollController(),
                                                                        itemCount: 1,
                                                                        itemBuilder: (BuildContext context, int index) {
                                                                          return Container(
                                                                            child:   IntrinsicHeight(
                                                                              child: Column( children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        /* Container(
                                                              width: 500,
                                                              alignment: Alignment.topLeft,
                                                              child: IntrinsicHeight(
                                                                child: Row( children: [
                                                                  Container(
                                                                    width: 5,
                                                                  ),
                                                                  Expanded(
                                                                    flex: 0,
                                                                    child:Container(
                                                                        alignment: Alignment.topLeft,
                                                                        width: 50,
                                                                        child:Image.asset('assets/logo/klackr_logo.png')),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 10,
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                                          Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                          Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                        ]),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 10,
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                        children: [
                                                                          Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.transparent)),
                                                                          Text("Inventor & Administrator            ",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                          Text("Leandro Kuya Jun Verceles Jr.  ",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                                        ]),
                                                                  ),
                                                                ]),
                                                              ),
                                                            ),*/
                                                                                        Container(
                                                                                          height: 30,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("STATS",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("  Klackr Influencer placements",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Duration from :  Feb 1, 2022, 12:01am",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("to :  May 31, 2022, 11:59pm",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Native Boost : 123,456  ",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Posts allowed per week :  4",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("  Duration of each post : until May 7, 2022",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Posting History",style: TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 150,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:Card(

                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                          height: 45,
                                                                                          alignment: Alignment.center,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('BACK',style:TextStyle(color: Colors.white)),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
                                                                                                });
                                                                                              },
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                                  textStyle: TextStyle(
                                                                                                      fontWeight: FontWeight.bold)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),

                                                                              ]),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),

                                                                  ]
                                                                  ),
                                                                ),
                                                              ),
                                                          ]),
                                                        ),
                                                      ),
                                                    if(lobbyselect=="lobbygetpost")
                                                      Container(
                                                        height: MediaQuery.of(context).size.height-140,
                                                        child:Container(
                                                          child: Column(
                                                            children: <Widget>[
                                                              Container(
                                                                height: 45,
                                                                child:   Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                  child: TextField(
                                                                    onChanged: (value){
                                                                      searchRegisterController.text=value;
                                                                      if(value==""){
                                                                        filterSearchResults( searchRegisterController.text);
                                                                      }
                                                                    },
                                                                    decoration: InputDecoration(
                                                                      suffixIcon: IconButton(
                                                                        onPressed: () {
                                                                          filterSearchResults( searchRegisterController.text);
                                                                        },
                                                                        icon: Icon(Icons.search_outlined,color:_colorFromHex(themeContent)),
                                                                      ),
                                                                      filled: true,
                                                                      fillColor: _colorFromHex(themeInput),
                                                                      border: OutlineInputBorder(
                                                                      ),
                                                                      hintText: 'Search',
                                                                      hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                                    ),
                                                                    style: TextStyle(color:  _colorFromHex(themeInputText)),
                                                                  ),
                                                                ),
                                                              ),

                                                              Container(
                                                                height: 5,
                                                              ),
                                                              Container(
                                                                height: 30.0, color: _colorFromHex(themeAppbard),
                                                                child:IntrinsicHeight(
                                                                  child: Row( children: [
                                                                    Container(
                                                                      width:10,
                                                                    ),
                                                                    Expanded(
                                                                      flex:0,
                                                                      child:Container(
                                                                          height: 20,
                                                                          alignment: Alignment.topLeft,
                                                                          child:Image.asset('assets/logo/klackr_logo.png')),
                                                                    ),
                                                                    Container(
                                                                      width:5,
                                                                    ),
                                                                    Expanded(
                                                                      flex:3,
                                                                      child:  Container(
                                                                        alignment: Alignment.topLeft,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                                                                          child: Text("vicinity",style: TextStyle(fontSize: 18,color:Colors.blue)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex:8,
                                                                      child:Container(
                                                                        alignment: Alignment.topRight,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                                                          child: Text("Klackr account no. "+profileID.toString(),style: TextStyle(color: _colorFromHex(themeContent),fontSize: 15)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: SizedBox(
                                                                  child:ListView.builder(

                                                                    itemCount: 1,
                                                                    itemBuilder: (BuildContext context, int index) {
                                                                      return Container(
                                                                        child:  Container(
                                                                          color:_colorFromHex(themeNewCard),
                                                                          alignment: Alignment.topLeft,
                                                                          child:IntrinsicHeight(
                                                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                                                                              if(noPost=="true")
                                                                                Container(
                                                                                  height: 30,
                                                                                ),
                                                                              if(noPost=="true")
                                                                                Expanded(
                                                                                  child:  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 0, right: 0, bottom: 0,top:40),
                                                                                    child:Container(
                                                                                      alignment: Alignment.center,
                                                                                      child: Text("No Results Found",style:TextStyle(color: _colorFromHex(themeInputText),fontSize: 25)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if(noPost=="true")
                                                                                Container(
                                                                                  height: 700,
                                                                                ),
                                                                              if(noPost=="false")
                                                                                Container(
                                                                                  child:Column(children: [
                                                                                    SizedBox(
                                                                                      height: MediaQuery.of(context).size.height-215,
                                                                                      child:ListView.builder(
                                                                                        controller: ScrollController(),
                                                                                        itemCount: _foundUsers1.length,
                                                                                        itemBuilder: (BuildContext context, int index) {
                                                                                          final DateTime time1 = DateTime.parse(_foundUsers1[_foundUsers1.length-1-index]["date_posted"].toString());
                                                                                          String dt4 = timeago.format(time1);
                                                                                      
                                                                                          return Container(
                                                                                            child:   IntrinsicHeight(
                                                                                              child: Column( children: [
                                                                                                Expanded(
                                                                                                  child: Column(
                                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                      children: [
                                                                                                        IntrinsicHeight(
                                                                                                          child: Row( children: [
                                                                                                            Expanded(
                                                                                                              flex: 0,
                                                                                                              child: Column(children: [
                                                                                                                Container(
                                                                                                                  alignment: Alignment.topLeft,
                                                                                                                  child: IconButton(onPressed: (){},icon: Icon(Icons.account_circle_rounded,size: 50,color:  _colorFromHex(themeInputText))),
                                                                                                                ),
                                                                                                              ]),
                                                                                                            ),
                                                                                                            Container(
                                                                                                              width: 20,
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              flex: 10,
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsets.only(
                                                                                                                    left: 0, right: 0, bottom: 0,top:15),
                                                                                                                child: Column(children: [
                                                                                                                  Container(
                                                                                                                    alignment: Alignment.topLeft,
                                                                                                                    child: Text(_foundUsers1[_foundUsers1.length-1-index]["author"].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:  _colorFromHex(themeInputText))),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    alignment: Alignment.topLeft,
                                                                                                                    child: Row( children: [
                                                                                                                      Text(dt4,style: TextStyle(color: _colorFromHex(themeInputText))),
                                                                                                                   
                                                                                                                    ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ]
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            if(username==_foundUsers1[_foundUsers1.length-1-index]["author"].toString())
                                                                                                              IconButton(
                                                                                                                icon: Icon(
                                                                                                                    Icons.edit,color: _colorFromHex(themeInputText),size: 18
                                                                                                                ),
                                                                                                                onPressed: () {
                                                                                                                  setState(() {
                                                                                                                    edit="true";
                                                                                                                    IDpost = _foundUsers1[_foundUsers1.length-1-index]["id"].toString();
                                                                                                                    CPpost = _foundUsers1[_foundUsers1.length-1-index]["caption"].toString();
                                                                                                                    UpostController.text=CPpost;
                                                                                                                    lobbyselect="lobbyposting";
                                                                                                                  });
                                                                                                                },
                                                                                                              ),
                                                                                                          ]
                                                                                                          ),

                                                                                                        ),
                                                                                                        Container(
                                                                                                          height:20,
                                                                                                        ),
                                                                                                        Container(
                                                                                                          alignment: Alignment.topLeft,
                                                                                                          child:   Padding(
                                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                                            child: Text(_foundUsers1[_foundUsers1.length-1-index]["caption"].toString(),style: TextStyle(color: _colorFromHex(themeInputText)),),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          height:10,
                                                                                                        ),
                                                                                                         if(_foundUsers1[_foundUsers1.length-1-index]["image"]!=null)
                                                                                                                Container(
                                                                                                                  height:300,
                                                                                                               //   width:250,
                                                                                                                  child:Image.network(_foundUsers1[_foundUsers1.length-1-index]["image"].toString()),
                                                                                                                ),
                                                                                                            if(_foundUsers1[_foundUsers1.length-1-index]["video"]!=null)
                                                                                                                Stack(
                                                                                                                  children: <Widget>[
                                                                                                                  
                                                                                                                    Center (
                                                                                                                      child: Container(
                                                                                                                        height: 300,
                                                                                                                      //  width: 300,
                                                                                                                        child:Padding(
                                                                                                                          padding: const EdgeInsets.only(
                                                                                                                              left: 0, right: 0, bottom: 10,top:0),
    child:VideoPlayer(_Video[_Video.length-1-index]),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                   Center(
                                                                                                                      child: InkWell(
                                                                                                                        child:AnimatedOpacity(

                                                                                                                          opacity:  _Video[_Video.length-1-index].value.isPlaying ? 0 : 1,
                                                                                                                          duration: const Duration(milliseconds: 500),
                                                                                                                          child:Container(
                                                                                                                            height:300,
                                                                                                                           // width:300,
                                                                                                                            child:  Icon(
                                                                                                                              Icons.play_arrow,
                                                                                                                              color: Colors.white,
                                                                                                                              size: 50,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        onTap: ()  {
                                                                                                                          setState(() {
                                                                                                                            _Video[_Video.length-1-index].value.isPlaying ?
                                                                                                                            _Video[_Video.length-1-index].pause() :
                                                                                                                            _Video[_Video.length-1-index].play();
                                                                                                                          });
                                                                                                                          _Video[_Video.length-1-index].addListener(() {
                                                                                                                            setState(() {

                                                                                                                            });
                                                                                                                          });
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                        Container(
                                                                                                          height:10,
                                                                                                        ),
                                                                                                        Row(children: [
                                                                                                          IconButton(
                                                                                                            icon: Icon(
                                                                                                                Icons.thumb_up,color: _colorFromHex(themeInputText),size: 18
                                                                                                            ),
                                                                                                            onPressed: () {

                                                                                                            },
                                                                                                          ),
                                                                                                          IconButton(
                                                                                                            icon: Icon(
                                                                                                                Icons.comment,color: _colorFromHex(themeInputText),size: 18
                                                                                                            ),
                                                                                                            onPressed: () {

                                                                                                            },
                                                                                                          ),
                                                                                                          IconButton(
                                                                                                            icon: Icon(
                                                                                                              Icons.share,color: _colorFromHex(themeInputText),size: 18,
                                                                                                            ),
                                                                                                            onPressed: () {

                                                                                                            },
                                                                                                          ),
                                                                                                        ]
                                                                                                        ),
                                                                                                        Container(
                                                                                                            height:2
                                                                                                        ),
                                                                                                        Container(
                                                                                                          height: 1,
                                                                                                          color:_colorFromHex(themeBase),
                                                                                                        ),

                                                                                                      ]
                                                                                                  ),
                                                                                                ),

                                                                                              ]),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),

                                                                                  ]
                                                                                  ),
                                                                                ),
                                                                            ]),
                                                                          ),

                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),



                                                    if(lobbyselect=="lobbyhome")
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 0),
                                                        child: Container(
                                                          child:   IntrinsicHeight(
                                                            child: Column( children: [
                                                Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                                        value: true,
                                                                    
                                                                        checkColor: Colors.white,
                                                                      //  activeColor: Colors.grey,
                                                                        // activeColor:_colorFromHex("#6688A0"),
                                                                        onChanged: (value) {
                                                                          setState(() {
                                                                            if(english==false){
                                                                              english=true;
                                                                              pilipino=false;
                                                                            }
                                                                          });
                                                                        },
                                                                        ),
                                                                    ),
            ),
            Text(
              "English",
              style: TextStyle(fontSize: 18.0,color:_colorFromHex(themeInputText)),
            ),
            Container(
              width:30,
            ),
             Transform.scale(
              scale: 1.3,
              child: Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                                             value: themeColorWhite,
                                                                    
                                                                        checkColor: Colors.white,
                                                                      //  activeColor: Colors.grey,
                                                                        // activeColor:_colorFromHex("#6688A0"),
                                                                         onChanged: (value) {
                                                                          setState(() {
                                                                            if(themeColorDark==true){
                                                                              themeColorDark=false;
                                                                              themeColorWhite=true;
                                                                              whiteTheme();
                                                                            }
                                                                          });
                                                                        },
                                                                        ),
                                                                    ),
            ),
            Text(
              "light theme",
              style: TextStyle(fontSize: 18.0,color:_colorFromHex(themeInputText)),
            )
          ],
        ),
         Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                                        value: false,
                                                                    
                                                                        checkColor: Colors.white,
                                                                      //  activeColor: Colors.grey,
                                                                        // activeColor:_colorFromHex("#6688A0"),
                                                                         onChanged: (value) {
                                                                          setState(() {
                                                                            if(pilipino==false){
                                                                              pilipino=true;
                                                                              english=false;
                                                                            }
                                                                          });
                                                                        },
                                                                        ),
                                                                    ),
            ),
            Text(
              "Tagalog",
              style: TextStyle(fontSize: 18.0,color:_colorFromHex(themeInputText)),
            ),
            Container(
              width:30,
            ),
             Transform.scale(
              scale: 1.3,
              child: Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                           value: themeColorDark,
                                                                    
                                                                        checkColor: Colors.white,
                                                                      //  activeColor: Colors.grey,
                                                                        // activeColor:_colorFromHex("#6688A0"),
                                                                         onChanged: (value) {
                                                                          setState(() {
                                                                            if(themeColorWhite==true){
                                                                              themeColorWhite=false;
                                                                              themeColorDark=true;
                                                                              darkTheme();
                                                                            }
                                                                          });
                                                                        },
                                                                        ),
                                                                    ),
            ),
            Text(
              "dark theme",
              style: TextStyle(fontSize: 18.0,color:_colorFromHex(themeInputText)),
            )
          ],
        ),

                                                              Row(
                                                                  children:[
                                                                    
                                                                     
                                                                     /*  Flexible(
                                                                        flex:9,
                                                                      child:Row(
                                                                        children:[
                                                                          Flexible(
                                                                            flex:3,
                                                                           child:Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                                        value: themeColorWhite,
                                                                        checkColor: Colors.black,
                                                                        activeColor: Colors.grey,
                                                                        onChanged: (value) {
                                                                          setState(() {
                                                                            if(themeColorDark==true){
                                                                              themeColorDark=false;
                                                                              themeColorWhite=true;
                                                                              whiteTheme();
                                                                            }
                                                                          });
                                                                        },),
                                                                    ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:9,
                                                                    child:Text("light theme",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ),*/
                                             
                                                                  ],
                                                                ),
                                                             





                                                             
                                                              /* Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                             child: Container(
                                                                child:Row(
                                                                  children:[
                                                                    Flexible(
                                                                        flex:2,
                                                                      child:Row(
                                                                        children:[
                                                                          Flexible(
                                                                            flex:3,
                                                                           child:Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                                        value: false,
                                                                        checkColor: Colors.black,
                                                                        activeColor: Colors.grey,
                                                                        onChanged: (value) {
                                                                          setState(() {
                                                                            if(pilipino==false){
                                                                              pilipino=true;
                                                                              english=false;
                                                                            }
                                                                          });
                                                                        },),
                                                                    ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:9,
                                                                    child:Text("Tagalog",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ),
                                                                       Flexible(
                                                                        flex:2,
                                                                      child:Row(
                                                                        children:[
                                                                          Flexible(
                                                                            flex:3,
                                                                           child:Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                                        value: themeColorDark,
                                                                        checkColor: Colors.black,
                                                                        activeColor:_colorFromHex("#6688A0"),
                                                                        onChanged: (value) {
                                                                          setState(() {
                                                                            if(themeColorWhite==true){
                                                                              themeColorWhite=false;
                                                                              themeColorDark=true;
                                                                              darkTheme();
                                                                            }
                                                                          });
                                                                        },),
                                                                    ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:0,
                                                                    child:Text("dark theme",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ),
                                                                      Flexible(
                                                                        flex:6,
                                                                      child:Row(
                                                                        children:[
                                                                          Flexible(
                                                                            flex:3,
                                                                           child:Container(

                                                                           ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:9,
                                                                    child:Container(
                                                                             
                                                                           ),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                               ),*/

                                                                
                                                              Container(height:30),
                                                                Row(children:[
                                     Container(
                                                  alignment: Alignment.topLeft,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child:  Text("Vicinity (view)",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 15)),
                                                  ),
                                                ),
                                               
                                  ]),
                                         Container(height:10),
                                    Row(children:[
                                     Container(
                                                  alignment: Alignment.topRight,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child:  Text("home barangay",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 15)),
                                                  ),
                                                ),
                                            
                                               
                                  ]),
                                       Container(height:5),
                                  Row(children:[
                                     Container(
                                                  alignment: Alignment.topLeft,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child:  Text(Obarangay,style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 10)),
                                                  ),
                                                ),
                                               
                                  ]),
                                  Row(children:[
                                     Container(
                                                  alignment: Alignment.topLeft,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child:  Text(OCityMunicipality+" "+ORegion,style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 10)),
                                                  ),
                                                ),
                                               
                                  ]),
                                   Column(children:[
                             
                                                 Container(
                                                                height: 45,
                                                                alignment: Alignment.topRight,
                                                                child:   Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                  child:ElevatedButton(
                                                                    child: Text('Edit profile',style:TextStyle(color: Colors.yellow)),
                                                                    onPressed: () {
                                                                      setState(() {
                                                                           lobby="editprofile";
                                                                     
                                                                     /*  resetVicinity();
                                                                     Timer(Duration(seconds: 0), () {
                                                        UselectRegion();
                                                        Uprovince.clear();
                                                        Ucitymunicipality.clear();
                                                        UcitymunicipalityValue=OCityMunicipality;
                                                        Ubarangay.clear();
                                                        UbarangayValue=Obarangay;
                                                        UprovinceValue=OProvince;
                                                UregionValue=ORegion;
                                                         VProvince="Province";
                                                        VCityMunicipality="City/Municipality";
                                                         Vbarangay="Barangay (or nearest barangay)";
                                                        UbarangayTypeRegisterController.text="";
                                                      });
                                                     // UregionValue = value as String;*/
                                                                      });
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        primary: _colorFromHex("#2786C9"),
                                                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                        textStyle: TextStyle(
                                                                            fontWeight: FontWeight.bold)),
                                                                  ),
                                                                ),
                                                              ),
                                               
                                  ]),
   Container(height:20),
    Row(children:[
                                     Container(
                                                  alignment: Alignment.topLeft,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                                    child:  Text("OutVicinity+ ",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 15)),
                                                  ),
                                                ),
                                               
                                  ]),
                                     Container(height:5),
                                        Expanded(
                                          child: Container(
                                            height: 45,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  hint: Row(
                                                    children:  [
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          VRegion,
                                                          style: TextStyle(
                                                              color: _colorFromHex( themeInputText ),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: Uregion
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:  TextStyle(
                                                              color:  _colorFromHex( themeInputText ),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value: UregionValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      Timer(Duration(seconds: 0), () {
                                                        UselectRegion();
                                                        Uprovince.clear();
                                                        Ucitymunicipality.clear();
                                                        UcitymunicipalityValue=null;
                                                        Ubarangay.clear();
                                                        UbarangayValue=null;
                                                        UprovinceValue=null;
                                                        UgetProvince();

                                                         VProvince="Province";
                                                        VCityMunicipality="City/Municipality";
                                                         Vbarangay="Barangay (or nearest barangay)";
                                                        UbarangayTypeRegisterController.text="";
                                                      });
                                                      UregionValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 40,
                                                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color:_colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  style: TextStyle(fontSize: 12),
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                          ),


                                        ),
                                        Container(height: 5),

                                        Expanded(
                                          child: Stack(
                                            children:[
                                              Container(
                                                height: 60,
                                                child:   Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                      isExpanded: true,
                                                      hint: Row(
                                                        children:  [
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              VProvince,
                                                              style: TextStyle(
                                                                  color: _colorFromHex(themeInputText ),fontSize: 15
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      items: Uprovince.map((item) =>
                                                          DropdownMenuItem<String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:  TextStyle(
                                                                  color: _colorFromHex(themeInputText),fontSize: 15
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ))
                                                          .toList(),
                                                      value: UprovinceValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          Ucitymunicipality.clear();
                                                          UcitymunicipalityValue=null;
                                                          Ubarangay.clear();
                                                          UbarangayValue=null;
                                                          VCityMunicipality="City/Municipality";
                                                          Vbarangay="Barangay (or nearest barangay)";
                                                          Timer(Duration(seconds: 0), () {
                                                            UgetMunicipality();
                                                            UbarangayTypeRegisterController.text="";
                                                          });
                                                          UprovinceValue = value as String;
                                                          
                                                        });
                                                      },
                                                      iconSize: 14,
                                                      iconEnabledColor: _colorFromHex(themeContent),
                                                      iconDisabledColor: Colors.grey,
                                                      buttonHeight: 40,
                                                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                      buttonDecoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(0),
                                                        border: Border.all(
                                                          color: Colors.black26,
                                                        ),
                                                        color:_colorFromHex(themeInput),
                                                      ),
                                                      buttonElevation: 2,
                                                      itemHeight: 40,
                                                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                      dropdownMaxHeight: 200,
                                                      dropdownPadding: null,
                                                      style: TextStyle(fontSize: 12),
                                                      dropdownDecoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(0),
                                                        color: _colorFromHex(themeNewCard),
                                                      ),
                                                      dropdownElevation: 8,
                                                      scrollbarRadius: const Radius.circular(40),
                                                      scrollbarThickness: 6,
                                                      scrollbarAlwaysShow: true,
                                                      offset: const Offset(-20, 0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if(UprovinceValue=="NATIONAL CAPITAL REGION - FOURTH DISTRICT"||UprovinceValue=="NATIONAL CAPITAL REGION - MANILA"
                                                  ||UprovinceValue=="NATIONAL CAPITAL REGION - SECOND DISTRICT"||UprovinceValue=="NATIONAL CAPITAL REGION - THIRD DISTRICT"
                                                  ||UprovinceValue=="TAGUIG - PATEROS")
                                                Padding(
                                                  padding: EdgeInsets.only(left: 20, right: 0,top:40),
                                                  child:Text(Ucitymunicipality.join(", "),style:TextStyle(fontSize:7,color:_colorFromHex(themeInputText))),
                                                ),
                                            ],
                                          ),


                                        ),
                                        Container(height: 5),

                                        Expanded(
                                          child:
                                          Container(
                                            height: 45,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  hint: Row(
                                                    children:  [
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          VCityMunicipality,
                                                          style: TextStyle(

                                                              color: _colorFromHex(themeInputText),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: Ucitymunicipality
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(

                                                              color: _colorFromHex(themeInputText),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value:UcitymunicipalityValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      Ubarangay.clear();
                                                      UbarangayValue=null;
                                                
                                                      Vbarangay="Barangay (or nearest barangay)";
                                                      Timer(Duration(seconds: 0), () {
                                                        UgetBarangay();
                                                        UbarangayTypeRegisterController.text="";
                                                      });
                                                      UcitymunicipalityValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 40,
                                                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color:_colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  style: TextStyle(fontSize: 12),
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                          ),




                                        ),

                                        Container(height: 5),

                                        Expanded(
                                          child: Container(
                                            height: 45,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  hint: Row(
                                                    children:  [
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          Vbarangay,
                                                          style: TextStyle(
                                                              color: _colorFromHex(themeInputText),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: Ubarangay
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(

                                                              color:  _colorFromHex(themeInputText),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value:UbarangayValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      UbarangayValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 40,
                                                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color:_colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  style: TextStyle(fontSize: 12),
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                          ),


                                        ),

                                        Container(height:20),
                                        Container(
                                                                height: 45,
                                                                alignment: Alignment.topRight,
                                                                child:   Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                  child:ElevatedButton(
                                                                    child: Text('Set other barangay',style:TextStyle(color: Colors.yellow)),
                                                                    onPressed: () {
                                                                      setState(() {
                                                                      changeVicinity();
                                                                      });
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        primary: _colorFromHex("#2786C9"),
                                                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                        textStyle: TextStyle(
                                                                            fontWeight: FontWeight.bold)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(height:50),
                                                              Container(
                                                                height: 45,
                                                                alignment: Alignment.topRight,
                                                                child:   Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                  child:ElevatedButton(
                                                                    child: Text('logout',style:TextStyle(color: Colors.white)),
                                                                    onPressed: () {
                                                                      setState(() {
                                                                        lobby = "main";//main,lobby,editprofile
                                                                        lobbySize = 75;
                                                                        _Credentials("","");
                                                                      });
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        primary: _colorFromHex("#2786C9"),
                                                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                        textStyle: TextStyle(
                                                                            fontWeight: FontWeight.bold)),
                                                                  ),
                                                                ),
                                                              ),
                                                                 Container(height:30),
                                                            ]),
                                                          ),
                                                        ),
                                                      ),


                                                  ]),
                                                ),
                                              ]),
                                            ),
                                          ]),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

















                    if(lobby=="main")
                      IntrinsicHeight(
                        child: Column( children: [
                          if(clickContinue=="finish")
                          Container(
                            child:Card(
                              color: _colorFromHex(themeNewCard),
                              child:   IntrinsicHeight(
                                child: Column( children: [
                                  Expanded(
                                    child: Column(
                                        children: [
                                          Container(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            Flexible(
                                              flex: 3,
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.transparent)),
                                                    Text("Inventor & Administrator            ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                    Text("Leandro Kuya Jun Verceles Jr.  ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                  ]),
                                            ),
                                            Flexible(
                                              flex:3,
                                              child:Container(
                                                  height: 70,
                                                  child:Image.asset('assets/logo/klackr_logo.png')
                                              ),
                                            ),
                                            Container(
                                                                                                width:5,
                                                                                              ),
                                            Flexible(
                                              flex:5,
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                    Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                    Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                  ]),
                                            ),
                                          ]
                                          ),
                                          Container(
                                            height: 20,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account. Please check your spam folder if you did not receive this email.",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("The confirmation e-mail was sent to "+emailRegisterController.text+". If that e-mail address is not correct, you can change it, in your account settings.",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                      
                                      
                                          Container(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Did not receive confirmation instructions?",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                          ),
                                          Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                              children:[
                                                Container(
                                                  height: 40,
                                                  width:100,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child:ElevatedButton(
                                                      child: Text('Back'),
                                                      onPressed: () {
                                                        setState(() {
                                                          clickContinue="false";
                                                          firstnameRegisterController.text="";
                                                          lastnameRegisterController.text="";
                                                          suffixRegisterController.text="";
                                                          genderRegisterController.text="";
                                                          emailRegisterController.text="";
                                                          usernameRegisterController.text="";
                                                          passwordRegisterController.text="";
                                                          confirmpasswordRegisterController.text="";
                                                          birthdayRegisterController.text="";
                                                          barangayTypeRegisterController.text="";
                                                          cellphoneRegisterController.text="";
                                                          regionValue=null;
                                                          provinceValue=null;
                                                          citymunicipalityValue=null;
                                                          barangayValue=null;
                                                          male=false;
                                                          female=false;
                                                          rather=false;
                                                          monthValue=null;
                                                          dayValue=null;
                                                          yearValue=null;
                                                          yesDraw=false;
                                                          noDraw=false;
                                                          wouldFollow=true;
                                                          wouldReview=true;
                                                          region.clear();
                                                          province.clear();
                                                          citymunicipality.clear();
                                                          barangay.clear();
                                                          getRegion();
                                                        });
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary: _colorFromHex("#2786C9"),
                                                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                                          textStyle: TextStyle(
                                                              fontWeight: FontWeight.bold)),
                                                    ),
                                                  ),
                                                ),
                                          ]
                                          ),

                                          Container(
                                            height: 20,
                                          ),
                                        ]
                                    ),
                                  ),

                                ]),
                              ),
                            ),


                          ),
                          if(clickContinue=="true")
                          Container(
                            child:Card(
                              color: _colorFromHex(themeNewCard),
                              child:   IntrinsicHeight(
                                child: Column( children: [
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 500,
                                            alignment: Alignment.topLeft,
                                            child: IntrinsicHeight(
                                              child: Row( children: [
                                                Container(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  flex: 0,
                                                  child:Container(
                                                      alignment: Alignment.topLeft,
                                                      width: 50,
                                                      child:Image.asset('assets/logo/klackr_logo.png')),
                                                ),
                                                 Container(
                                                                                                width:5,
                                                                                              ),
                                                Expanded(
                                                  flex: 10,
                                                  child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                        Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                        Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                                      ]),
                                                ),
                                                Expanded(
                                                  flex: 10,
                                                  child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.transparent)),
                                                        Text("Inventor & Administrator            ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                        Text("Leandro Kuya Jun Verceles Jr.  ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                      ]),
                                                ),
                                              ]),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Klackr terms & conditions and SIGN UP (at the end)",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("You can join the Klackr platform and Makabayan Bakuna Raffle Draws, and publish any private post, ad & commercial  post. The Klackr platfrom is run and the Makabayan Bakuna Raffle Draws managed by Klackr inventor & adminstrator Leandro Kuya Jun Verceles Jr. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("You need to register only once for your Klackr acccount. If you are approached again to register, there is no need to register again. You’re good. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Klackr private posts",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Private posts are FREE for subscribers-users and have no limit of frequency of publication (subject to reasonable use). Private posts exclude Klackr ads & commercial posts.",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Private posts should not aim to advertise or promote businesses, products, services in the commercial sense; otherwise, they should be treated in the other category: Klackr ads & commercial posts. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Ads & commercial posts in the guise of private posts but actually election campaign or partisan political activity to support or defeat a candidate at any time is strictly prohibited. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Private posts do not require pre-approval by the Klackr administrator and do not incur any waiting period to get published unlike ads & commercial posts. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),

                                          Container(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Klackr ads & commercial posts ",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Your ads & commercial posts are FREE for this beta test. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("An ad or commercial post is evaluated by the Klackr.world administrator and if within 48 hours there is no reply, it is deemed as approved and will automatically be posted unless there is a violation of company rules then which it may be taken down at anytime. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Ads & commercial posts in the context of an election campaign or partisan political activity to support or defeat a candidate or partylist party at any time are strictly prohibited  without the approval of the Klackr administrator.",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("The post may be in the nature of at a discount.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child:  RichText(
                                                  text: TextSpan(
                                                    text: 'Publication by the same person, store, outlet, company, business outfit, or organization shall be limited to ',
                                                    style: TextStyle(color: _colorFromHex(themeContent)),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: ' TWO ADS OR COMMERCIAL POSTS PER WEEK.',
                                                        style: TextStyle(
                                                            color: _colorFromHex(themeContent),
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      TextSpan(text: 'The ad or commercial post expires in 72 hours from the time of publication. ',style: TextStyle(color: _colorFromHex(themeContent))),
                                                    ],
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Any strategy to duplicate persons or entities acting as separate publishers but discovered to be actually the same person or entity just to avoid the two posts per week limitation shall be dealt with severely and may lead to an immediate permanent ban from further publishing and/or use of the platform. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("The publisher of the ad or  commercial post shall have the total responsibility of securing the necessary clearance or permit from the regulating agencies for the posting, if required. The publisher shall save free from any liability the Klackr company or any of its equity holders, officers, directors, administrator, managers, employees, and assigns because of the post. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("100% REACH within your barangay",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("There are no algorithms on the platfrom so private posts, ads & commerical posts reach 100% the subscribers-users within your barangay upon their opening of the app. The private posts, ads & commercial posts are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original ad or commericial post is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Fake news, abusive language, responsible Information, trolling, violations of the Klackr company rules",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("We espouse responsible information. Therefore, strictly prohibited on your private posts, ads & commercial posts are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Violation of the Klackr company policy and rules especially against fake news and prohibited language may lead to a suspension or total ban from the platform. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("HARMLESS FROM LIABILITY FOR THE KLACKR COMPANY",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("The Klackr platform is merely the vessel of your private posts, ads & commercial posts. Hence, the the Klackr company bears no responsibility to the contents of said private posts, ads & commercial posts. The publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors, managers, employees, and assigns because of said private posts, ads & commercial posts.    ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("CONFIDENTIALITY  ",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Your personal information are strictly confidential. Respecting your rights, any collected information that will directly identify you to third parties unless ordered by the courts or by law or lawfull regulation covering any transaction, sale, transfer, trade, barter, donation, or any other kind of disposition on the Klackr platform will not be done without your express permission. We subscribe to the PHILIPPINE DATA PRIVACY ACT. ",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                          ),
                                           IntrinsicHeight(
                                                                                                child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                                                                                  Expanded(
                                                                                                    flex:0,
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                height: 40,
                                                width:100,
                                                child:   Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                  child:ElevatedButton(
                                                    child: Text('SIGN UP'),
                                                    onPressed: () {
                                                      setState(() {
                                                        singup();
                                                      });
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        primary: _colorFromHex("#2786C9"),
                                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                                        textStyle: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                                  ),
                                                ),
                                              ),
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                      flex:1,
                                                                                                      child: Container(

                                                                                                        child:Padding(
                                                                                                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                                                                          child: Text("I agree and will abide by the above terms and conditions for the use of the Klackr.world  platform and, therefore, am signing up.    ",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                                                        ),
                                                                                                      )),
                                                                                                ]),
                                                                                              ),
                                  
                                          Container(
                                            height: 35,
                                          ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children:[
                                        Container(
                                        height: 40,
                                        width:100,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:ElevatedButton(
                                                child: Text('Back'),
                                                onPressed: () {
                                                  setState(() {
                                                    clickContinue="false";
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: _colorFromHex("#2786C9"),
                                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                                    textStyle: TextStyle(
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                          ]
                                    ),
                                          Container(
                                            height: 20,
                                          ),
                                        ]
                                    ),
                                    
                                  ),

                                ]),
                              ),
                            ),

                          ),
                          Container(
                            height:20,
                          ),
                          if(plattform=="androidiphone")
                            Container(
                              alignment: Alignment.center,
                              child: IntrinsicHeight(
                                child: Row( children: [
                                  Expanded(
                                    flex: 5,
                                    child:Container(


                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child:Container(
                                        width: 50,
                                        child:Image.asset('assets/logo/klackr_logo.png')),
                                  ),
                                  Container(
                                    width:5,
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeTitle))),
                                          Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                          Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10,fontWeight: FontWeight.bold)),
                                        ]),
                                  ),

                                ]),
                              ),
                            ),
                          Container(
                              height:20,
                          ),
                          if(clickContinue=="message")
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 0),
                              child: Container(
                                child:   IntrinsicHeight(
                                  child: Column( children: [
                                           Container(
                                             color:Colors.white,
                                              
                                                                              child:   Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                                                                child: TextField(
                                                                                  controller: messageRegisterController,
                                                                                  keyboardType: TextInputType.multiline,
                                                                                  maxLines: null,
                                                                                  minLines:7,
                                                                                  decoration: InputDecoration(
                                                                                    border: InputBorder.none,
                                                                                   // filled: true,
                                                                                   // fillColor:Colors.white,
                      
                                                                                    hintText: "Send a message...",
                                                                                    hintStyle: TextStyle(color:Colors.black),
                                                                                  ),
                                                                                  style: TextStyle(color: Colors.black),
                                                                                ),
                                                                              ),
                                                                            ),
                             Container(
                                                                          height: 45,
                                                                          alignment: Alignment.topRight,
                                                                          child:   Padding(
                                                                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                            child:ElevatedButton(
                                                                              child: Text('Send',style:TextStyle(color: _colorFromHex("#FFF200"))),
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                 
                                                                                });
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                  textStyle: TextStyle(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:40,
                                                                        ),
                                                                        Container(
                                                                          height: 45,
                                                                          alignment: Alignment.topRight,
                                                                          child:   Padding(
                                                                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                            child:ElevatedButton(
                                                                              child: Text('Back',style:TextStyle(color: _colorFromHex("#FFF200"))),
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                 clickContinue="login";
                                                                                });
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                  primary: _colorFromHex("#2786C9"),
                                                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                  textStyle: TextStyle(
                                                                                      fontWeight: FontWeight.bold)),
                                                                            ),
                                                                          ),
                                                                        ),
                                  ]),
                                ),
                              ),
                            ),
                                                   if(clickContinue=="setting")
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 0),
                              child: Container(
                                child:   IntrinsicHeight(
                                  child: Column( children: [
                                   Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                                        value: true,
                                                                    
                                                                        checkColor: Colors.white,
                                                                      //  activeColor: Colors.grey,
                                                                        // activeColor:_colorFromHex("#6688A0"),
                                                                        onChanged: (value) {
                                                                          setState(() {
                                                                            if(english==false){
                                                                              english=true;
                                                                              pilipino=false;
                                                                            }
                                                                          });
                                                                        },
                                                                        ),
                                                                    ),
            ),
            Text(
              "English",
              style: TextStyle(fontSize: 18.0,color:_colorFromHex(themeInputText)),
            ),
            Container(
              width:30,
            ),
             Transform.scale(
              scale: 1.3,
              child: Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                                             value: themeColorWhite,
                                                                    
                                                                        checkColor: Colors.white,
                                                                      //  activeColor: Colors.grey,
                                                                        // activeColor:_colorFromHex("#6688A0"),
                                                                         onChanged: (value) {
                                                                          setState(() {
                                                                            if(themeColorDark==true){
                                                                              themeColorDark=false;
                                                                              themeColorWhite=true;
                                                                              whiteTheme();
                                                                            }
                                                                          });
                                                                        },
                                                                        ),
                                                                    ),
            ),
            Text(
              "light theme",
              style: TextStyle(fontSize: 18.0,color:_colorFromHex(themeInputText)),
            )
          ],
        ),
         Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                                        value: false,
                                                                    
                                                                        checkColor: Colors.white,
                                                                      //  activeColor: Colors.grey,
                                                                        // activeColor:_colorFromHex("#6688A0"),
                                                                         onChanged: (value) {
                                                                          setState(() {
                                                                            if(pilipino==false){
                                                                              pilipino=true;
                                                                              english=false;
                                                                            }
                                                                          });
                                                                        },
                                                                        ),
                                                                    ),
            ),
            Text(
              "Tagalog",
              style: TextStyle(fontSize: 18.0,color:_colorFromHex(themeInputText)),
            ),
            Container(
              width:30,
            ),
             Transform.scale(
              scale: 1.3,
              child: Theme(
                                                                      data: ThemeData(
                                                                        primarySwatch: Colors.blue,
                                                                        unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                                      ),
                                                                      child: Checkbox(
                                                           value: themeColorDark,
                                                                    
                                                                        checkColor: Colors.white,
                                                                      //  activeColor: Colors.grey,
                                                                        // activeColor:_colorFromHex("#6688A0"),
                                                                         onChanged: (value) {
                                                                          setState(() {
                                                                            if(themeColorWhite==true){
                                                                              themeColorWhite=false;
                                                                              themeColorDark=true;
                                                                              darkTheme();
                                                                            }
                                                                          });
                                                                        },
                                                                        ),
                                                                    ),
            ),
            Text(
              "dark theme",
              style: TextStyle(fontSize: 18.0,color:_colorFromHex(themeInputText)),
            )
          ],
        ),
                                  ]),
                                ),
                              ),
                            ),
                          if(clickContinue=="login")
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 0),
                         child: Container(
                            child:   IntrinsicHeight(
                              child: Column( children: [
                                Expanded(
                                  child: Column(children: [
                                    Container(
                                      child:Card(
                                        color: _colorFromHex(themeNewCard),
                                        child:   IntrinsicHeight(
                                          child: Column( children: [
                                            Expanded(
                                              child: Column(children: [
                                                Container(
                                                  height: 10,
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child:  Text("Login",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 15)),
                                                  ),
                                                ),
                                                Container(
                                                  height: 10,
                                                ),

                                                Container(
                                                height: 50,
                                                child:   Padding(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    child: TextField(
    controller:emailLogin,
    keyboardType: TextInputType.emailAddress,

    decoration: InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
    hintText: 'Email address',
    hintStyle: TextStyle(color:_colorFromHex(themeContent)),
    filled: true, // Needed for adding a fill color
    fillColor:  _colorFromHex(themeInput),
    isDense: true,  // Reduces height a bit
    border: OutlineInputBorder(
    // Apply corner radius
    ),

    ),
    style: TextStyle(color: _colorFromHex(themeInputText)),
    ),
    ),
    ),
                                                Container(
                                                  height: 5,
                                                ),

                                                Container(
                                                  height: 45,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child: TextField(
                                                      controller:passwordLogin,
                                                      keyboardType: TextInputType.visiblePassword,
                                                      obscureText: _obscured3,
                                                      focusNode: textFieldFocusNode3,
                                                      decoration: InputDecoration(
                                                        floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                                                        hintText: 'Password',
                                                        hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                        filled: true, // Needed for adding a fill color
                                                        fillColor:  _colorFromHex(themeInput),
                                                        isDense: true,  // Reduces height a bit
                                                        border: OutlineInputBorder(
                                                          // Apply corner radius
                                                        ),
                                                        suffixIcon: Padding(
                                                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                          child: GestureDetector(
                                                            onTap: _toggleObscured3,
                                                            child: Icon(
                                                              _obscured3 ? Icons.visibility_off_rounded: Icons.visibility_rounded ,
                                                              size: 24,
                                                              color: _colorFromHex(themeContent),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      style: TextStyle(color: _colorFromHex(themeInputText)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 40,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child:ElevatedButton(
                                                      child: Text('Login'),
                                                      onPressed: () {
                                                       /*setState(() {
                                                          lobby="lobby";
                                                           lobbySize = 0;
                                                        });*/
                                                        if(emailLogin.text==""||passwordLogin.text==""){
                                                          if(allow=="on"){
                                                            allow="off";
                                                            Fluttertoast.showToast(
                                                                msg: "Don't leave any blank",
                                                                toastLength: Toast.LENGTH_SHORT,
                                                                gravity: ToastGravity.BOTTOM,
                                                                timeInSecForIosWeb: 3,
                                                                backgroundColor: Colors.red,
                                                                textColor: Colors.black,
                                                                fontSize: 15.0
                                                            );
                                                            Timer(Duration(seconds: 3), () {
                                                              allow="on";
                                                            });
                                                          }
                                                        }else{
                                                          login();
                                                        }
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary: _colorFromHex("#2786C9"),
                                                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                                          textStyle: TextStyle(
                                                              fontWeight: FontWeight.bold)),
                                                    ),
                                                  ),
                                                ),
                                                if(forgot=="true")
                                                  TextButton(
                                                    child: const Text('Forget password?'),
                                                    onPressed: () {

                                                    },
                                                  ),
                                                Container(
                                                  height: 15,
                                                ),
                                              ]
                                              ),
                                            ),

                                          ]),
                                        ),
                                      ),
                                    ),
                                    Container(height: 10),
                                    Container(
                                      child:Card(
                                        color: _colorFromHex(themeNewCard),
                                        child:   IntrinsicHeight(
                                          child: Column( children: [
                                            Expanded(
                                              child: Column(children: [
                                                Container(
                                                  height: 10,
                                                ),
                                                Row(children: [
                                                  Flexible(
                                                    child:Container(
                                                      alignment: Alignment.topLeft,
                                                      child:   Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                        child:  Column(children: [
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("Architect & Administrator",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 17)),
                                                            ),
                                                          ),
                                                          Container(height: 5),
                                                         

                                                         Container(

    height:35,
              child:InkWell(                                           child: Column(children:[
                                                          
     Row(children:[

        Container(
                                                                alignment: Alignment.topLeft,
                                                                child:   Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
  child:RichText(
    text: TextSpan(
    text: 'Leandro ',
    style: TextStyle(color: _colorFromHex(themeContent),  fontWeight: FontWeight.bold),
    children: <TextSpan>[
    TextSpan(
    text: 'Kuya Jun ',
    style: TextStyle(
    color: _colorFromHex(themeContent),
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic
    ),
    ),
    TextSpan(text: 'Verceles Jr. ',style: TextStyle(  fontWeight: FontWeight.bold,color: _colorFromHex(themeContent))),
    ],
    ),
    ),
                                                                ),
        ),

    ]),
    Row(children:[
  Container(
                                                                alignment: Alignment.topLeft,
                                                                child:   Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                  child:  Text("klackroo@gmail.com",style: TextStyle(color:_colorFromHex(themeContent))),
                                                                ),
                                                              ),
    ]),
                                                      
                                                          ]),
                                                          onTap:(){
                                                      setState(() {
                                                          clickContinue="message";
                                                    });
                                                    
                                                          }
    ),
                                                         ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("Running the Klackr platform and managing the Makabayan Pilipino Bakuna Raffle Draws.",style: TextStyle(color:_colorFromHex(themeContent))),
                                                            ),
                                                          ),
                                                          Container(height: 5),
                                                          Container(
                                                            height:70,
                                                            alignment: Alignment .topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:Image.asset('assets/leandro.png'),
                                                            ),
                                                          ),
                                                        ]
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                 /* Flexible(
                                                    child:Container(
                                                      alignment: Alignment.topLeft,
                                                      child:   Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                        child:  Column(children: [
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("Subscribers-users STATS",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 15)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("(in real time):",style: TextStyle(color:_colorFromHex(themeContent))),
                                                            ),
                                                          ),
                                                          Container(height: 20),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("Subscribers-users registered:",style: TextStyle(color:_colorFromHex(themeContent))),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text(getUserCount,style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("18 years old and above",style: TextStyle(color:_colorFromHex(themeContent))),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("0",style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("14-17 years old",style: TextStyle(color:_colorFromHex(themeContent))),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("0",style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("13 years old and below",style: TextStyle(color:_colorFromHex(themeContent))),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            height: 1,
                                                            color:_colorFromHex(themeContent),
                                                          ),
                                                          Container(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text(getUserCount,style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("total subscribers-users on the Klackr platform",style: TextStyle(color:_colorFromHex(themeContent))),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("0",style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("active users 18 years old and above",style: TextStyle(color:_colorFromHex(themeContent))),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 15,
                                                          ),
                                                        ]
                                                        ),
                                                      ),
                                                    ),
                                                  ),*/
                                                ]
                                                ),
                                              ]
                                              ),
                                            ),

                                          ]),
                                        ),
                                      ),
                                    ),
                                   
                                  ]
                                  ),
                                ),

                              ]),
                            ),
                          ),
                            ),
                          if(clickContinue=="false")
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 0),
                            child:Container(
                              child:Card(
                                color: _colorFromHex(themeNewCard),
                                child:   IntrinsicHeight(
                                  child: Column( children: [
                                    Expanded(
                                      child: Column(children: [
                                        Container(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:  Text("Makabayan Pilipino:",style: TextStyle(color:_colorFromHex(themeContent),fontWeight: FontWeight.bold,fontSize: 19)),
                                          ),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("Register to join the Makabayan Pilipino Bakuna Raffle Draws for big cash and other prizes. All FREE! Bigger cash and prizes if vaccinated. And even if not vaccinated, you can still join.",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: firstnameRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: 'First name',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                              ),
                                              style: TextStyle(color: _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: lastnameRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: 'Last name',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                              ),
                                              style: TextStyle(color: _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: suffixRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: 'Suffix',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                        ),
                                      Row(children: [
                                        Container(
                                          width: 10,
                                        ),
                                        Text("Gender",textAlign: TextAlign.start,style: TextStyle(color:_colorFromHex(themeContent))),
                                      ]
 ),
                                        
                                        Row(children: [
                                          Container(
                                            width: 15,
                                          ),

                                          Flexible(
                                            child:Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: male,
                                                checkColor: Colors.white,
                                                activeColor: _colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(male==false){
                                                      male=true;
                                                      female=false;
                                                      rather=false;
                                                      setState(() {
                                                        genderRegisterController.text="Male";
                                                      });
                                                    }else{
                                                      male=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
                                            flex:9,
                                            child:      Text("Male",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                          Container(
                                              width:10,
                                          ),
                                          Flexible(
                                            child: Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: female,
                                                checkColor: Colors.white,
                                                activeColor:_colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(female==false){
                                                      female=true;
                                                      male=false;
                                                      rather=false;
                                                      setState(() {
                                                        genderRegisterController.text="Female";
                                                      });
                                                    }else{
                                                      female=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),
                                        
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
                                            flex:9,
                                            child:      Text("Female",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
                                           
                                            child: Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: rather,
                                                checkColor: Colors.white,
                                                activeColor:_colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(rather==false){
                                                      rather=true;
                                                      female=false;
                                                      male=false;
                                                      setState(() {
                                                        genderRegisterController.text="Rather not say";
                                                      });
                                                    }else{
                                                      rather=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
                                            flex:0  ,
                                            child:Text("Rather not say",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                         
                                        ]
                                        ),

                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: emailRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: 'Email address',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:  Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child: TextField(
                                                  controller: usernameRegisterController,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: _colorFromHex(themeInput),
                                                    border: OutlineInputBorder(

                                                    ),
                                                    hintText: 'Username',
                                                    hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                  ),
                                                  style: TextStyle(color: _colorFromHex(themeInputText)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: passwordRegisterController,
                                              keyboardType: TextInputType.visiblePassword,
                                              obscureText: _obscured,
                                              focusNode: textFieldFocusNode,
                                              decoration: InputDecoration(
                                                floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                                                hintText: 'Password',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                filled: true, // Needed for adding a fill color
                                                fillColor:  _colorFromHex(themeInput),
                                                isDense: true,  // Reduces height a bit
                                                border: OutlineInputBorder(
                                                  // Apply corner radius
                                                ),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: GestureDetector(
                                                    onTap: _toggleObscured,
                                                    child: Icon(
                                                      _obscured ? Icons.visibility_off_rounded: Icons.visibility_rounded ,
                                                      size: 24,
                                                      color: _colorFromHex(themeContent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: confirmpasswordRegisterController,
                                              keyboardType: TextInputType.visiblePassword,
                                              obscureText: _obscured2,
                                              focusNode: textFieldFocusNode2,
                                              decoration: InputDecoration(
                                                floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                                                hintText: 'Confirm password',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent)),
                                                filled: true, // Needed for adding a fill color
                                                fillColor:  _colorFromHex(themeInput),
                                                isDense: true,  // Reduces height a bit
                                                border: OutlineInputBorder(
                                                  // Apply corner radius
                                                ),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: GestureDetector(
                                                    onTap: _toggleObscured2,
                                                    child: Icon(
                                                      _obscured2 ? Icons.visibility_off_rounded: Icons.visibility_rounded ,
                                                      size: 24,
                                                      color: _colorFromHex(themeContent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(height: 10),
                                        Row(children: [
                                          Flexible(
                                            flex:2,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              child:   Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child: Text("Registration is any age 14 years old and above. To join the Makabayan Pilipino Bakuna Raffle Draws, you must be 18 years of age by the day of the vacination raffle draws planned to start in May 2022.",style: TextStyle(color:_colorFromHex(themeContent))),
                                              ),
                                            ),
                                          ),

                                          //  Container(height: 100.0, color: Colors.cyan),
                                        ]
                                        ),
                                        Container(height: 20),
                                        Container(
                                          height:100,
                                        child:Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
                                        Container(
                                              alignment: Alignment.center,
                                              child:   Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child: Row(children:[
                                                  Text("Date of birth",style: TextStyle(color:_colorFromHex(themeContent))),
                                                ]),
                                              ),
                                            ),
                                        Container(
                                          height:10,
                                        ),
                                          
                                          Row(children: [
                                            Container(
                                              width:20,
                                            ),
                                            Flexible(
                                              flex:2,
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  items: month
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item.toString(),
                                                        child:  Container(
                                                          alignment:Alignment.center,
                                                          child:Text(
                                                            item.toString(),
                                                            style:  TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.bold,
                                                              color:  _colorFromHex(themeInputText),
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value: monthValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      monthValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor:_colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 30,
                                                  buttonWidth: 100,
                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color: _colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width:5,
                                            ),
                                            Flexible(
                                                flex:2  ,
                                              child: Text("Month",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                            Container(
                                              width:15,
                                            ),
                                            Flexible(
                                                flex:2,
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  items: day
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item.toString(),
                                                        child:  Container(
                                                          alignment:Alignment.center,
                                                          child:Text(
                                                            item.toString(),
                                                            style:  TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.bold,
                                                              color:  _colorFromHex(themeInputText),
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value: dayValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      dayValue = value as String;
                                                    });
                                                  },

                                                  iconSize: 14,
                                                  iconEnabledColor:_colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 30,
                                                  buttonWidth: 100,

                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color: _colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width:5,
                                            ),
                                            Flexible(
                                                flex:2,
                                              child: Text("Day",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                            Container(width: 15),
                                            Flexible(
                                                flex:3,
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  items: year
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item.toString(),
                                                        child:  Container(
                                                          alignment:Alignment.center,
                                                          child:Text(
                                                            item.toString(),
                                                            style:  TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.bold,
                                                              color:  _colorFromHex(themeInputText),
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value: yearValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      yearValue = value as String;
                                                    });
                                                  },

                                                  iconSize: 14,
                                                  iconEnabledColor:_colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 30,
                                                  buttonWidth: 100,

                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color: _colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                            Container(width: 5),
                                            Flexible(
                                                flex:0,
                                              child: Text("Year",style: TextStyle(color:_colorFromHex(themeContent))),
                                            ),
                                          ]
                                          ),

                                        ]
                                        ),
                                        ),
                                        
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("We will please need your residence address in the Philippines to locate you in case you win any of the big cash and others prizes.",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                        ),
                                        Container(
                                          height: 10,
                                        ),

                                        Expanded(
                                          child: Container(
                                            height: 45,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  hint: Row(
                                                    children:  [
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Region',
                                                          style: TextStyle(
                                                            color: _colorFromHex(themeContent),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: region
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:  TextStyle(
                                                            color:  _colorFromHex(themeInputText),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value: regionValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      Timer(Duration(seconds: 0), () {
                                                        selectRegion();
                                                        province.clear();
                                                        citymunicipality.clear();
                                                        citymunicipalityValue=null;
                                                        barangay.clear();
                                                        barangayValue=null;
                                                        provinceValue=null;
                                                        getProvince();
                                                        barangayTypeRegisterController.text="";
                                                      });
                                                      regionValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 40,
                                                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color:_colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  style: TextStyle(fontSize: 12),
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                          ),


                                        ),
                                        Container(height: 5),

                                        Expanded(
                                          child: Stack(
                                            children:[
                                            Container(
                                              height: 60,
                                              child:   Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    isExpanded: true,
                                                    hint: Row(
                                                      children:  [
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            'Province',
                                                            style: TextStyle(
                                                                color: _colorFromHex(themeContent),fontSize: 13
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    items: province.map((item) =>
                                                        DropdownMenuItem<String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style:  TextStyle(
                                                                color: _colorFromHex(themeInputText),fontSize: 13
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ))
                                                        .toList(),
                                                    value: provinceValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        citymunicipality.clear();
                                                        citymunicipalityValue=null;
                                                        barangay.clear();
                                                        barangayValue=null;
                                                        Timer(Duration(seconds: 0), () {
                                                          getMunicipality();
                                                          barangayTypeRegisterController.text="";
                                                        });
                                                        provinceValue = value as String;
                                                      });
                                                    },
                                                    iconSize: 14,
                                                    iconEnabledColor: _colorFromHex(themeContent),
                                                    iconDisabledColor: Colors.grey,
                                                    buttonHeight: 40,
                                                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                    buttonDecoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(0),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color:_colorFromHex(themeInput),
                                                    ),
                                                    buttonElevation: 2,
                                                    itemHeight: 40,
                                                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownPadding: null,
                                                    style: TextStyle(fontSize: 12),
                                                    dropdownDecoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(0),
                                                      color: _colorFromHex(themeNewCard),
                                                    ),
                                                    dropdownElevation: 8,
                                                    scrollbarRadius: const Radius.circular(40),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,
                                                    offset: const Offset(-20, 0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if(provinceValue=="NATIONAL CAPITAL REGION - FOURTH DISTRICT"||provinceValue=="NATIONAL CAPITAL REGION - MANILA"
                                              ||provinceValue=="NATIONAL CAPITAL REGION - SECOND DISTRICT"||provinceValue=="NATIONAL CAPITAL REGION - THIRD DISTRICT"
                                              ||provinceValue=="TAGUIG - PATEROS")
                                          Padding(
                                            padding: EdgeInsets.only(left: 20, right: 0,top:40),
                                              child:Text(citymunicipality.join(","),style:TextStyle(fontSize:8,color:_colorFromHex(themeInputText))),
                                          ),
                                          ],
                                          ),


                                        ),
                                        Container(height: 5),

                                        Expanded(
                                          child:
                                                Container(
                                                  height: 45,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton2(
                                                        isExpanded: true,
                                                        hint: Row(
                                                          children:  [
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                'City/Municipality',
                                                                style: TextStyle(

                                                                    color: _colorFromHex(themeContent),fontSize: 15
                                                                ),
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        items: citymunicipality
                                                            .map((item) =>
                                                            DropdownMenuItem<String>(
                                                              value: item,
                                                              child: Text(
                                                                item,
                                                                style: TextStyle(

                                                                  color: _colorFromHex(themeInputText),fontSize: 15
                                                                ),
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ))
                                                            .toList(),
                                                        value:citymunicipalityValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            barangay.clear();
                                                            barangayValue=null;
                                                            Timer(Duration(seconds: 0), () {
                                                              getBarangay();
                                                              barangayTypeRegisterController.text="";
                                                            });
                                                            citymunicipalityValue = value as String;
                                                          });
                                                        },
                                                        iconSize: 14,
                                                        iconEnabledColor: _colorFromHex(themeContent),
                                                        iconDisabledColor: Colors.grey,
                                                        buttonHeight: 40,
                                                        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                        buttonDecoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(0),
                                                          border: Border.all(
                                                            color: Colors.black26,
                                                          ),
                                                          color:_colorFromHex(themeInput),
                                                        ),
                                                        buttonElevation: 2,
                                                        itemHeight: 40,
                                                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                        dropdownMaxHeight: 200,
                                                        style: TextStyle(fontSize: 12),
                                                        dropdownPadding: null,
                                                        dropdownDecoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(0),
                                                          color: _colorFromHex(themeNewCard),
                                                        ),
                                                        dropdownElevation: 8,
                                                        scrollbarRadius: const Radius.circular(40),
                                                        scrollbarThickness: 6,
                                                        scrollbarAlwaysShow: true,
                                                        offset: const Offset(-20, 0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                               
                                           


                                        ),

                                        Container(height: 5),

                                        Expanded(
                                          child: Container(
                                            height: 45,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  hint: Row(
                                                    children:  [
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Barangay (or nearest barangay)',
                                                          style: TextStyle(
                                                            color: _colorFromHex(themeContent),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: barangay
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(

                                                            color:  _colorFromHex(themeInputText),fontSize: 15
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ))
                                                      .toList(),
                                                  value:barangayValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      barangayValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex(themeContent),
                                                  iconDisabledColor: Colors.grey,
                                                  buttonHeight: 40,
                                                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  buttonDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color:_colorFromHex(themeInput),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                  dropdownMaxHeight: 200,
                                                  style: TextStyle(fontSize: 12),
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeNewCard),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius: const Radius.circular(40),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(-20, 0),
                                                ),
                                              ),
                                            ),
                                          ),


                                        ),
                                        Container(height: 5,),
                                       /* Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: '  Type here your barangay if not seen when scrolling in the box above',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent),fontSize: 9),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                              onChanged: (value){
                                                setState(() {
                                                  barangayValue=null;
                                                  barangay.clear();
                                                  if(barangayTypeRegisterController.text.toString()==""){
                                                    if(provinceValue!=null){
                                                      getBarangay();
                                                    }
                                                  }
                                                });
                                              },
                                              controller: barangayTypeRegisterController,
                                            ),
                                          ),
                                        ),*/
                                        Container(height: 5,),
                                        Container(
                                          height: 45,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child: TextField(
                                              controller: cellphoneRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: '  Cellphone No.(optional)',
                                                hintStyle: TextStyle(color:_colorFromHex(themeContent),fontSize: 15),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText),fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("Will you have had at least your first dose before the day of the Makabayan Pilipino Bakuna Raffle Draws planned in May 2022 or later raffle draws?",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                        ),
                                        Row(children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child:Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: yesDraw,
                                                checkColor: Colors.white,
                                                activeColor: _colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(yesDraw==false){
                                                      yesDraw=true;
                                                      noDraw=false;
                                                    }else{
                                                      yesDraw=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),

                                          Flexible(
                                          flex:9,
                                            child: Text("Yes",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),
                                          Container(
                                            width:10,
                                          ),
                                          Flexible(
    
                                            child: Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                              ),
                                              child: Checkbox(
                                                value: noDraw,
                                                checkColor: Colors.white,
                                                activeColor:_colorFromHex(themeContent),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(noDraw==false){
                                                      noDraw=true;
                                                      yesDraw=false;

                                                    }else{
                                                      noDraw=false;
                                                    }
                                                  });
                                                },),
                                            ),
                                          ),

                                          Flexible(
                                            child: Text("No",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),

                                        ],
                                        ),
                                        Container(height: 10),
                                        Row(children: [
                                          Container(
                                            width: 2,
                                          ),
                                          Flexible(
                                            child:Column(children:[
                                              Theme(
                                                data: ThemeData(
                                                  primarySwatch: Colors.blue,
                                                  unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                ),
                                                child: Checkbox(
                                                  value: wouldFollow,
                                                  checkColor: Colors.white,
                                                  activeColor: _colorFromHex(themeContent),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if(wouldFollow==false){
                                                        wouldFollow=true;
                                                      }else{
                                                        wouldFollow=false;
                                                      }
                                                    });
                                                  },),
                                              ),
                                              Container(
                                                  height:50,
                                              ),
                                            ]),
                                          ),

                                          Flexible(
                                            flex:9,
                                            child:      Text("I would like to join and follow the Makabayan Pilipino Bakuna Raffle Draws for big cash and other prizes. All FREE! Bigger cash and prizes if I am vaccinated. Even if not vaccinated, I can still join and win.",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),

                                        ],
                                        ),

                                        Container(height: 10),
                                        Row(children: [
                                          Container(
                                            width: 2,
                                          ),
                                          Flexible(
                                            child:Column(
                                                children:[
                                              Theme(
                                                data: ThemeData(
                                                  primarySwatch: Colors.blue,
                                                  unselectedWidgetColor: _colorFromHex(themeContent), // Your color
                                                ),
                                                child: Checkbox(
                                                  value: wouldReview,
                                                  checkColor: Colors.white,
                                                  activeColor: _colorFromHex(themeContent),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if(wouldReview==false){
                                                        wouldReview=true;
                                                      }else{
                                                        wouldReview=false;
                                                      }
                                                    });
                                                  },),
                                              ),
                                                      Container(
                                                    height:20,
                                                  ),
                                            ]
                                            )
                                          ),

                                          Flexible(
                                            flex:9,
                                            child:Text("I would like to review the terms, conditions, and rules of the Klackr.world  platform, then to sign up at the end.",style: TextStyle(color:_colorFromHex(themeContent))),
                                          ),

                                        ],
                                        ),
                                        Container(height: 10),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("Unclick any box if you do not agree. ",style: TextStyle(color:_colorFromHex(themeContent),fontSize: 10)),
                                          ),
                                        ),
                                        Container(height: 20),
                                        Container(
                                          height: 40,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:ElevatedButton(
                                              child: Text('continue'),
                                              onPressed: () {
                                                if(firstnameRegisterController.text==""||lastnameRegisterController.text==""
                                                    ||genderRegisterController.text==""||emailRegisterController.text==""
                                                    ||usernameRegisterController.text==""||passwordRegisterController.text==""
                                                    ||confirmpasswordRegisterController.text==""||monthValue==""||dayValue==""||yearValue==""
                                                    ||regionValue==null||provinceValue==null||citymunicipalityValue==null){
                                                  if(allow=="on"){
                                                    allow="off";
                                                    Fluttertoast.showToast(
                                                        msg: "Error, please go back and fill up mandatory fields",
                                                        toastLength: Toast.LENGTH_SHORT,
                                                        gravity: ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 3,
                                                        backgroundColor: Colors.red,
                                                        textColor: Colors.black,
                                                        fontSize: 15.0
                                                    );
                                                    Timer(Duration(seconds: 3), () {
                                                      allow="on";
                                                    });
                                                  }
                                                }else{
                                                  if(passwordRegisterController.text!=confirmpasswordRegisterController.text){
                                                    if(allow=="on"){
                                                      allow="off";
                                                      Fluttertoast.showToast(
                                                          msg: "Password doesn't match",
                                                          toastLength: Toast.LENGTH_SHORT,
                                                          gravity: ToastGravity.BOTTOM,
                                                          timeInSecForIosWeb: 3,
                                                          backgroundColor: Colors.red,
                                                          textColor: Colors.black,
                                                          fontSize: 15.0
                                                      );
                                                      Timer(Duration(seconds: 3), () {
                                                        allow="on";
                                                      });
                                                    }
                                                  }if(confirmpasswordRegisterController.text.length<6){
                                                    if(allow=="on"){
                                                      allow="off";
                                                      Fluttertoast.showToast(
                                                          msg: "Ensure the password has at least 6 characters.",
                                                          toastLength: Toast.LENGTH_SHORT,
                                                          gravity: ToastGravity.BOTTOM,
                                                          timeInSecForIosWeb: 3,
                                                          backgroundColor: Colors.red,
                                                          textColor: Colors.black,
                                                          fontSize: 15.0
                                                      );
                                                      Timer(Duration(seconds: 3), () {
                                                        allow="on";
                                                      });
                                                    }
                                                  }else{
                                                    setState(() {
                                                      if(barangayTypeRegisterController.text==""){
                                                        barangayTypeRegisterController.text=barangayValue.toString();
                                                      }
                                                      clickContinue="true";
                                                    });
                                                  }
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary: _colorFromHex("#2786C9"),
                                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                                  textStyle: TextStyle(
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                     
                                       








                                      ],
                                      ),
                                    ),

                                  ]),
                                ),
                              ),
                            ),
    ),



                        ]),
                      ),
                  ]),
                ),
              ),//MOBILE

          //WEB
          ],
        ),
      ),
      ),
    );
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}


Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
String red = "#ff1100";
String dark = "#3a9bde";
String iconLogin = red;
String iconSignup = dark;
String iconSetting = dark;
String iconSetting2 = dark;
String iconAdd = dark;
String iconVicinity = red;



bool english=true;
bool pilipino=false;

List<String> region=['NCR', 'CAR', 'REGION I', 'REGION II', 'REGION III', 'REGION IV-A', 'REGION IV-B', 'REGION V', 'REGION VI', 'REGION VII', 'REGION VIII', 'REGION IX', 'REGION X', 'REGION XI', 'REGION XII', 'REGION XIII', 'BARMM'];
List<String> province=[];
List<String> citymunicipality=[];
List<String> barangay=[];

String? regionValue;
String? provinceValue;
String? citymunicipalityValue;
String? barangayValue;

bool vicinity=true;
bool outvicinity=true;
bool male=false;
bool female=false;
bool rather=false;
String? monthValue;
String? dayValue;
String? yearValue;
var month = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
var day = [for(var i=1; i<32; i+=1) i];
var year = [for(var i=1930; i<2022; i+=1) i];
bool yesDraw=false;
bool noDraw=false;
bool wouldFollow=true;
bool wouldReview=true;
final firstnameRegisterController = TextEditingController();
final lastnameRegisterController = TextEditingController();
final suffixRegisterController = TextEditingController();
final genderRegisterController = TextEditingController();
final emailRegisterController = TextEditingController();
final usernameRegisterController = TextEditingController();
final passwordRegisterController = TextEditingController();
final confirmpasswordRegisterController = TextEditingController();
final birthdayRegisterController = TextEditingController();
final barangayTypeRegisterController = TextEditingController();
final cellphoneRegisterController = TextEditingController();
final postingRegisterController = TextEditingController();
final messageRegisterController = TextEditingController();
final searchRegisterController = TextEditingController();

String noPost = "false";
String allow = "on";
String clickContinue = "login";
final emailLogin = TextEditingController();
final passwordLogin = TextEditingController();
bool showBarangay=true;
bool showMunicipality=false;


String? UregionValue;
String? UprovinceValue;
String? UcitymunicipalityValue;
String? UbarangayValue;
bool Ujr=false;
bool Usr=false;
bool Uiii=false;
bool Umale=false;
bool Ufemale=false;
bool Urather=false;
String? UmonthValue;
String? UdayValue;
String? UyearValue;
var Umonth = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
var Uday = [for(var i=1; i<32; i+=1) i];
var Uyear = [for(var i=1930; i<2022; i+=1) i];
final UfirstnameRegisterController = TextEditingController();
final UlastnameRegisterController = TextEditingController();
final UsuffixRegisterController = TextEditingController();
final UgenderRegisterController = TextEditingController();
final UemailRegisterController = TextEditingController();
final UusernameRegisterController = TextEditingController();
final UpasswordRegisterController = TextEditingController();
final UconfirmpasswordRegisterController = TextEditingController();
final UbirthdayRegisterController = TextEditingController();
final UbarangayTypeRegisterController = TextEditingController();
final UcellphoneRegisterController = TextEditingController();
final UpostController = TextEditingController();
List<String> Uregion=['NCR', 'CAR', 'REGION I', 'REGION II', 'REGION III', 'REGION IV-A', 'REGION IV-B', 'REGION V', 'REGION VI', 'REGION VII', 'REGION VIII', 'REGION IX', 'REGION X', 'REGION XI', 'REGION XII', 'REGION XIII', 'BARMM'];
List<String> Uprovince=[];
List<String> Ucitymunicipality=[];
List<String> Ubarangay=[];

String darkinput="#191B22";
String whiteinput="#ebebeb";
String black = "#000000";
String white = "#ffffff";
String grey = "#c4c4c4";
String Whitecardcolor="#d6d6d6";
String Whiteblack="#000000";
String Whitebasecolor = "#cccccc";
String Darkblue = "#6688A0";
String DarkcardColor = "#363A48";
String DarkbaseColor = "#282C36";
String contentDark = "#3a9bde";
String contentWhite = "#002b75";
String themeCard = white;
String themeBase = Whitecardcolor;
String themeInputText = black;
String themeTitle = black;
String themeInput = whiteinput;
String themeAppbard = grey;
bool themeColor = false;

String themeNewCard = white;
String themeContent = contentWhite;
bool themeColorWhite = true;
bool themeColorDark = false;
String placeColor = black;


int one = 3;
int two = 5;
int third = 2;
String refreshing = "false";
String APItoken = "https://data.klackr.world/auth/login/";
String APIlocation = "https://data.klackr.world/auth/location/";
String APIregister = "https://data.klackr.world/auth/register/";
String APIlogin = "https://data.klackr.world/auth/login/";
String APIposting = "https://data.klackr.world/homepage/posts/";
String APIgetpost = "https://data.klackr.world/homepage/posts/?limit=30&offset=0";
String APIgetprofile = "https://data.klackr.world/homepage/profile/";
String APIgetuser="https://data.klackr.world/auth/users_count/";

String VRegion="";
String VProvince="";
String VCityMunicipality="";
String Vbarangay="";
String ORegion="";
String OProvince="";
String OCityMunicipality="";
String Obarangay="";
String info = "false";//false
const appleType = "apple";
const androidType = "android";
String edit = "false";
String IDpost = "";
String CPpost = "";
RefreshController _refreshController =
RefreshController(initialRefresh: false);
String getUserCount="0";
List<VideoPlayerController> _Video = [];
String forgot = "false";
String role = "influencer";
String profilePic = "";
String plattform = "web";
String lobbyselect = "lobbygetpost";//lobbygetpost
String lobby = "main";//main,lobby,editprofile
double lobbySize = 75;//75
String message = "false";