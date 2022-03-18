import 'dart:async';
import 'package:klackr/website.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show Encoding, json, jsonDecode, jsonEncode;
import 'package:universal_html/html.dart' as html;




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
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
    request.fields['email'] = 'carlo.parungao@teravibe.com';
    request.fields['password'] = '123456';
    http.Response response = await http.Response.fromStream(await
    request.send());
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
    if(regionValue=="REGION I"){
      setState(() {
        UsRegion="01";
      });
    }else  if(regionValue=="REGION II"){
      setState(() {
        UsRegion="02";
      });
    }else  if(regionValue=="REGION III"){
      setState(() {
        UsRegion="03";
      });
    }
    else  if(regionValue=="REGION IV-A"){
      setState(() {
        UsRegion="4A";
      });
    }
    else  if(regionValue=="REGION IV-B"){
      setState(() {
        UsRegion="4B";
      });
    }
    else  if(regionValue=="REGION V"){
      setState(() {
        UsRegion="05";
      });
    }
    else  if(regionValue=="REGION VI"){
      setState(() {
        UsRegion="06";
      });
    }
    else  if(regionValue=="REGION VII"){
      setState(() {
        UsRegion="07";
      });
    }
    else  if(regionValue=="REGION VIII"){
      setState(() {
        UsRegion="08";
      });
    }
    else  if(regionValue=="REGION IX"){
      setState(() {
        UsRegion="09";
      });
    }
    else  if(regionValue=="REGION X"){
      setState(() {
        UsRegion="10";
      });
    }
    else  if(regionValue=="REGION XI"){
      setState(() {
        UsRegion="11";
      });
    }
    else  if(regionValue=="REGION XII"){
      setState(() {
        UsRegion="12";
      });
    }
    else  if(regionValue=="REGION XIII"){
      setState(() {
        UsRegion="13";
      });
    }
    else  if(regionValue=="BARMM"){
      setState(() {
        UsRegion="BARMM";
      });
    }
    else  if(regionValue=="CAR"){
      setState(() {
        UsRegion="CAR";
      });
    }
    else  if(regionValue=="NCR"){
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
  void UgetRegion() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    var pointer = response.body;
    if(response.statusCode==200){
      setState(() {
        Uregion.add(jsonDecode(pointer)['01']['region_name']);
        Uregion.add(jsonDecode(pointer)['02']['region_name']);
        Uregion.add(jsonDecode(pointer)['03']['region_name']);
        Uregion.add(jsonDecode(pointer)['4A']['region_name']);
        Uregion.add(jsonDecode(pointer)['4B']['region_name']);
        Uregion.add(jsonDecode(pointer)['05']['region_name']);
        Uregion.add(jsonDecode(pointer)['06']['region_name']);
        Uregion.add(jsonDecode(pointer)['07']['region_name']);
        Uregion.add(jsonDecode(pointer)['08']['region_name']);
        Uregion.add(jsonDecode(pointer)['09']['region_name']);
        Uregion.add(jsonDecode(pointer)['10']['region_name']);
        Uregion.add(jsonDecode(pointer)['11']['region_name']);
        Uregion.add(jsonDecode(pointer)['12']['region_name']);
        Uregion.add(jsonDecode(pointer)['13']['region_name']);
        Uregion.add(jsonDecode(pointer)['BARMM']['region_name']);
        Uregion.add(jsonDecode(pointer)['CAR']['region_name']);
        Uregion.add(jsonDecode(pointer)['NCR']['region_name']);
        UselectRegion();
      });

    }

  }
  void UgetProvince() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Ty'
          'pe': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    var pointer = response.body;

    if(response.statusCode==200){
      Map<String, dynamic> res = jsonDecode(pointer)[UsRegion]['province_list'];
      res.forEach((key, value) {
        setState(() {
          Uprovince.add(key);
        });
      });
    }
  }
  void UgetMunicipality() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    var pointer = response.body;
    if(response.statusCode==200){
      Map<String, dynamic> res = jsonDecode(pointer)[UsRegion]['province_list'][UprovinceValue]['municipality_list'];
      res.forEach((key, value) {
        setState(() {
          Ucitymunicipality.add(key);
        });
      });
    }
  }
  void UgetBarangay() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    var pointer = response.body;
    var postLength;
    if(response.statusCode==200){//store response as string
      setState(() {
        postLength = jsonDecode(pointer)[UsRegion]['province_list'][UprovinceValue]['municipality_list'][UcitymunicipalityValue]['barangay_list'];//get all the data from json string superheros
      });
      for (var i = 0; i <= postLength.length-1; i++) {
        Ubarangay.add(jsonDecode(pointer)[UsRegion]['province_list'][UprovinceValue]['municipality_list'][UcitymunicipalityValue]['barangay_list'][i]);
      }
    }
  }
  void getRegion() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    var pointer = response.body;
    if(response.statusCode==200){
      setState(() {
        region.add(jsonDecode(pointer)['01']['region_name']);
        region.add(jsonDecode(pointer)['02']['region_name']);
        region.add(jsonDecode(pointer)['03']['region_name']);
        region.add(jsonDecode(pointer)['4A']['region_name']);
        region.add(jsonDecode(pointer)['4B']['region_name']);
        region.add(jsonDecode(pointer)['05']['region_name']);
        region.add(jsonDecode(pointer)['06']['region_name']);
        region.add(jsonDecode(pointer)['07']['region_name']);
        region.add(jsonDecode(pointer)['08']['region_name']);
        region.add(jsonDecode(pointer)['09']['region_name']);
        region.add(jsonDecode(pointer)['10']['region_name']);
        region.add(jsonDecode(pointer)['11']['region_name']);
        region.add(jsonDecode(pointer)['12']['region_name']);
        region.add(jsonDecode(pointer)['13']['region_name']);
        region.add(jsonDecode(pointer)['BARMM']['region_name']);
        region.add(jsonDecode(pointer)['CAR']['region_name']);
        region.add(jsonDecode(pointer)['NCR']['region_name']);
        selectRegion();
      });

    }

  }
  void getProvince() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Ty'
          'pe': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    var pointer = response.body;

    if(response.statusCode==200){
      Map<String, dynamic> res = jsonDecode(pointer)[sRegion]['province_list'];
      res.forEach((key, value) {
        setState(() {
          province.add(key);
        });
      });
    }
  }
  void getMunicipality() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    var pointer = response.body;
    if(response.statusCode==200){
      Map<String, dynamic> res = jsonDecode(pointer)[sRegion]['province_list'][provinceValue]['municipality_list'];
      res.forEach((key, value) {
        setState(() {
          citymunicipality.add(key);
        });
      });
    }
  }
  void getBarangay() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    var pointer = response.body;
    var postLength;
    if(response.statusCode==200){//store response as string
      setState(() {
        postLength = jsonDecode(pointer)[sRegion]['province_list'][provinceValue]['municipality_list'][citymunicipalityValue]['barangay_list'];//get all the data from json string superheros
      });
      for (var i = 0; i <= postLength.length-1; i++) {
        barangay.add(jsonDecode(pointer)[sRegion]['province_list'][provinceValue]['municipality_list'][citymunicipalityValue]['barangay_list'][i]);
      }
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
    request.fields['birthday'] = monthValue.toString()+"/"+dayValue.toString()+"/"+yearValue.toString();
    request.fields['region'] = '${regionValue.toString()}';
    request.fields['province'] = '${provinceValue.toString()}';
    request.fields['citymunicipality'] = '${citymunicipalityValue.toString()}';
    request.fields['barangay'] = '${barangayTypeRegisterController.text}';
    request.fields['contactnumber'] = '${cellphoneRegisterController.text}';
    http.Response response = await http.Response.fromStream(await
    request.send());
    var pointer = response.body;
    if (response.statusCode == 201) {
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
    if (response.statusCode == 200) {
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
      setState(() {
        lobby="lobby";
        lobbySize = 0;
        fetchData1();
        getprofile();
      });
    } else if(response.statusCode==400){
      pointer = response.body;
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
  void profile() async{
    final response = await http.put(
      Uri.parse("http://klackr.teravibe.com:5000/homepage/profile/$profileID/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
      },
      encoding: Encoding.getByName('utf-8'),
      body: {"username": UusernameRegisterController.text,
        "contactnumber": UcellphoneRegisterController.text},
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
  void posting() async{
    final response = await http.post(
      Uri.parse(APIposting),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
      },
      encoding: Encoding.getByName('utf-8'),
      body: {"caption": postingRegisterController.text},
    );
    if (response.statusCode == 201) {
      fetchData1();
      postingRegisterController.text="";
      setState(() {
        lobbyselect="lobbygetpost";
      });
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
      }
      _foundUsers1 = _allUsers1;
      refreshing="false";

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
      var getUsername = jsonDecode(data2)['results'][0]['username'];
      var getPhone = jsonDecode(data2)['results'][0]['contactnumber'];
      UusernameRegisterController.text=getUsername;
      username=getUsername ;
      UcellphoneRegisterController.text=getPhone;
      setState(() {
        profileID=getID.toString();
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
  }
  void darkTheme(){
    themeBase=DarkbaseColor;
    themeTitle =white;
    themeCard=DarkcardColor;
    themeInput=darkinput;
    themeInputText=white;
    themeAppbard=white;

  }
 void OSindentifyer(){
   final userAgent = html.window.navigator.userAgent.toString().toLowerCase();
   // smartphone
   if( userAgent.contains("android")||userAgent.contains("iphone")||userAgent.contains("ipad")) {
     setState(() {
       plattform="androidiphone";
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
      allToken();
      selectRegion();
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
                                  });
                                },
                                icon: Icon(Icons.login,color:_colorFromHex("#6688A0"),size:35),
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
                                  });
                                },
                                icon: Icon(Icons.assignment,color:_colorFromHex("#6688A0"),size:35),
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
                                  });
                                },
                                icon: Icon(Icons.settings,color:_colorFromHex("#6688A0"),size:35),
                              ),
                              Text("setting",style:TextStyle(color:_colorFromHex(themeInputText))),
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
                                              width:50,
                                            ),
                                          ),
                                          Flexible(
                                            flex:3,
                                            child:Container(
                                                height: 70,
                                                child:Image.asset('assets/logo/klackr_logo.png')
                                            ),
                                          ),
                                          Flexible(
                                            flex:5,
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                  Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                  Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                ]),
                                          ),
                                        ]
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: TextStyle(),
                                          ),
                                          onPressed: (){
                                            setState(() {
                                              lobby="lobby";
                                            });
                                          },
                                          child:Text('< Back to Klacker.world',style:TextStyle(color:_colorFromHex("#6688A0"))),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 60,
                                            ),
                                            Flexible(
                                              child:Theme(
                                                data: ThemeData(
                                                  primarySwatch: Colors.blue,
                                                  unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                                ),
                                                child: Checkbox(
                                                  value: showBarangay,
                                                  checkColor: Colors.black,
                                                  activeColor: _colorFromHex("#6688A0"),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if(showBarangay==false){
                                                        showBarangay=true;
                                                      }else{
                                                        showBarangay=false;
                                                      }
                                                    });
                                                  },),
                                              ),
                                            ),

                                            Flexible(
                                              flex:9,
                                              child:      Text("  barangay",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 60,
                                            ),
                                            Flexible(
                                              child:Theme(
                                                data: ThemeData(
                                                  primarySwatch: Colors.blue,
                                                  unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                                ),
                                                child: Checkbox(
                                                  value: showMunicipality,
                                                  checkColor: Colors.black,
                                                  activeColor: _colorFromHex("#6688A0"),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if(showMunicipality==false){
                                                        showMunicipality=true;
                                                      }else{
                                                        showMunicipality=false;
                                                      }
                                                    });
                                                  },),
                                              ),
                                            ),

                                            Flexible(
                                              flex:9,
                                              child:      Text("  municipality",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 60,
                                            ),
                                            Flexible(
                                              child:  Theme(
                                                data: ThemeData(
                                                  primarySwatch: Colors.blue,
                                                  unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                                ),
                                                child: Checkbox(
                                                  value: themeColor,
                                                  checkColor: Colors.black,
                                                  activeColor:_colorFromHex("#6688A0"),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if(themeColor==false){
                                                        themeColor=true;
                                                        darkTheme();
                                                      }else{
                                                        themeColor=false;
                                                        whiteTheme();
                                                      }
                                                    });
                                                  },),
                                              ),
                                            ),

                                            Flexible(
                                              flex:9,
                                              child:      Text("  Dark Theme",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                          ],
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
                                                width: 5,
                                              ),
                                              Expanded(
                                                flex: 10,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Edit Profile",style: TextStyle(fontSize: 25,color:_colorFromHex("#6688A0"))),
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
                                                      Text("Inventor & Administrator            ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                      Text("Leandro Kuya Jun Verceles Jr.  ",style: TextStyle(color:Colors.transparent,fontSize: 10,fontWeight: FontWeight.bold)),
                                                    ]),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        Container(
                                          height: 0.2,
                                          color:_colorFromHex("#6688A0"),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:  Text("Klackr account no. 23423",style: TextStyle(color: _colorFromHex(themeInputText))),
                                          ),
                                        ),
                                        Container(
                                          height: 15,
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
                                                    hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                                  ),
                                                  style: TextStyle(color:  _colorFromHex(themeInputText)),
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
                                              controller: UcellphoneRegisterController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: _colorFromHex(themeInput),
                                                border: OutlineInputBorder(

                                                ),
                                                hintText: 'Cellphone No.',
                                                hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
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
                        ]),
                      ),

                    if(lobby=="lobby")//LOBBY

                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
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
                                                      });
                                                    },
                                                    icon: Icon(Icons.add,color:_colorFromHex("#6688A0"),size:35),
                                                  ),
                                                  Text("ADD POST",style:TextStyle(color:_colorFromHex(themeInputText))),
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
                                                        lobbyselect="lobbygetpost";
                                                      });
                                                    },
                                                    icon: Icon(Icons.public,color:_colorFromHex("#6688A0"),size:35),
                                                  ),
                                                  Text("STREET",style:TextStyle(color:_colorFromHex(themeInputText))),
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
                                                      });
                                                    },
                                                    icon: Icon(Icons.home,color:_colorFromHex("#6688A0"),size:35),
                                                  ),
                                                  Text("HOME",style:TextStyle(color:_colorFromHex(themeInputText))),
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
                                                                            child: Container(
                                                                              height:45,
                                                                              width:45,
                                                                              alignment: Alignment.topLeft,
                                                                              child: IconButton(onPressed: (){},icon: Icon(Icons.account_circle_rounded,size: 50,color:_colorFromHex("#6688A0"))),
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
                                                                                          child:  Text(username,style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold,fontSize: 13)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex:0,
                                                                                      child: Container(
                                                                                        height: 35,
                                                                                        alignment: Alignment.topLeft,
                                                                                        child:TextButton(
                                                                                          style: TextButton.styleFrom(
                                                                                            textStyle: TextStyle(),
                                                                                          ),
                                                                                          onPressed: (){
                                                                                            setState(() {
                                                                                              lobby="editprofile";
                                                                                            });
                                                                                          },
                                                                                          child:Text('Edit profile',style:TextStyle(color:Colors.grey)),
                                                                                        ),
                                                                                      ),
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
                                                                      Container(
                                                                        height: 225,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                          child: TextField(
                                                                            controller: postingRegisterController,
                                                                            keyboardType: TextInputType.multiline,
                                                                            maxLines: 10,
                                                                            decoration: InputDecoration(
                                                                              suffixIcon:IntrinsicHeight(
                                                                                child: Column(children: [
                                                                                  IconButton(
                                                                                    onPressed: () {
                                                                                      setState(() {

                                                                                      });
                                                                                    },
                                                                                    icon:Icon(Icons.emoji_emotions,color: Colors.black),
                                                                                  ),
                                                                                  IconButton(
                                                                                    onPressed: () {
                                                                                      setState(() {

                                                                                      });
                                                                                    },
                                                                                    icon:Icon(Icons.attach_file,color: Colors.black),
                                                                                  ),
                                                                                  IconButton(
                                                                                    onPressed: () {
                                                                                      setState(() {

                                                                                      });
                                                                                    },
                                                                                    icon:Icon(Icons.public,color: Colors.black),
                                                                                  ),
                                                                                ]),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor:Colors.white,
                                                                              border: OutlineInputBorder(
                                                                              ),
                                                                              hintText: "What's on your mind ?",
                                                                              hintStyle: TextStyle(color:Colors.black),
                                                                            ),
                                                                            style: TextStyle(color: Colors.black),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: 10,
                                                                      ),
                                                                      Container(
                                                                        alignment: Alignment.topLeft,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                          child:TextButton(
                                                                            style: TextButton.styleFrom(
                                                                              textStyle: TextStyle(),
                                                                            ),
                                                                            onPressed: (){
                                                                              setState(() {
                                                                                if(role=="influencer"){
                                                                                  info="1";
                                                                                }
                                                                              });
                                                                            },
                                                                            child:Text('Klackr private posts',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        alignment: Alignment.topLeft,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                          child:TextButton(
                                                                            style: TextButton.styleFrom(
                                                                              textStyle: TextStyle(),
                                                                            ),
                                                                            onPressed: (){
                                                                              setState(() {
                                                                                if(role=="influencer"){
                                                                                  info="2";
                                                                                }
                                                                              });
                                                                            },
                                                                            child:Text('Klackr ads & commercial posts',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if(role=="influencer")
                                                                        Container(
                                                                          alignment: Alignment.topLeft,
                                                                          child:   Padding(
                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                            child:TextButton(
                                                                              style: TextButton.styleFrom(
                                                                                textStyle: TextStyle(),
                                                                              ),
                                                                              onPressed: (){
                                                                                setState(() {
                                                                                  info="3";
                                                                                });
                                                                              },
                                                                              child:Text('Klackr Influencer placements',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Container(
                                                                        height: 20,
                                                                      ),
                                                                      Container(
                                                                        height: 40,
                                                                        alignment: Alignment.center,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                                                                                  posting();
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
                                                                        height: 40,
                                                                      ),
                                                                      Container(
                                                                        alignment: Alignment.topLeft,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                          child:TextButton(
                                                                            style: TextButton.styleFrom(
                                                                              textStyle: TextStyle(),
                                                                            ),
                                                                            onPressed: (){
                                                                              setState(() {
                                                                                info="4";
                                                                              });
                                                                            },
                                                                            child:Text('STATS Klackr private posts',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        alignment: Alignment.topLeft,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                          child:TextButton(
                                                                            style: TextButton.styleFrom(
                                                                              textStyle: TextStyle(),
                                                                            ),
                                                                            onPressed: (){
                                                                              setState(() {
                                                                                info="5";
                                                                              });
                                                                            },
                                                                            child:Text('STATS Klackr ads & commercial posts',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        alignment: Alignment.topLeft,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                          child:TextButton(
                                                                            style: TextButton.styleFrom(
                                                                              textStyle: TextStyle(),
                                                                            ),
                                                                            onPressed: (){
                                                                              setState(() {
                                                                                info="6";
                                                                              });
                                                                            },
                                                                            child:Text('STATS Klackr Influencer placements',style:TextStyle(color:_colorFromHex(themeInputText),fontWeight: FontWeight.bold)),
                                                                          ),
                                                                        ),
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
                                                                                        ),
                                                                                        Container(
                                                                                          height: 30,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Klackr private posts ",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("[TO HOME BARANGAY & FOLLOWERS]",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Private posts are FREE for subscribers-users and have no limit of frequency of publication (subject to reasonable use). Private posts exclude Klackr ads & commercial posts. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Private posts should not aim to advertise or promote businesses, products, services in the commercial sense; otherwise, they should be treated in the other category: Klackr ads & commercial posts. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Ads & commercial posts in the guise of private posts but actually election campaign or partisan political activity to support or defeat a candidate at any time is strictly prohibited. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Private posts should not aim to advertise or promote businesses, products, services in the commercial sense; otherwise, they should be treated in the other category: Klackr ads & commercial posts. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Also strictly prohibited are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The klackr company policies and rules against fake news and prohibited language, or any violation of this rulle may lead to a suspension or total ban on the use of the Klackr platform. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),

                                                                                        Container(
                                                                                          height: 15,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Private posts do not require pre-approval by the Klackr administrator and do not incur any waiting period to get published unlike ads & commercial posts. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Klackr platform is merely the vessel of your private posts. Hence, the the Klackr company bears no responsibility to the contents of said private posts and the publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors, managers, employees, and assigns.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("There are no algorithms on the platfrom so private posts reach 100% the subscribers-users upon their opening of the app. The ads & commercial posts are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original private post is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 35,
                                                                                        ),
                                                                                        Container(
                                                                                          height: 25,
                                                                                          child:    Padding(
                                                                                            padding: const EdgeInsets.only(
                                                                                                left: 120, right:120, bottom: 0,top:0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('Back'),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
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
                                                            if(info=="2")
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
                                                                                        ),
                                                                                        Container(
                                                                                          height: 30,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Klackr ads & commercial posts ",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("[TO HOME BARANGAY & FOLLOWERS]",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Your advertisments and commercial posts are FREE for this beta test. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("An ad or commercial post is evaluated by the Klackr.world administrator and if within 48 hours there is no reply, it is deemed as approved and will automatically be posted unless there is a violation of company rules then which it may be taken down at anytime. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Ads & commercial posts in the guise of private posts but actually election campaign or partisan political activity to support or defeat a candidate at any time is strictly prohibited. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Ads & commercial posts in the context of an election campaign or partisan political activity to support or defeat a candidate or partylist party at any time are strictly prohibited  without the approval of the Klackr administrator.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The post may be in the nature of a discount.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Publication by the same person, store, outlet, company, or business outfit shall be limited to two posts per week. The ad or commercial post expires in 72 hours from the time of publication. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),

                                                                                        Container(
                                                                                          height: 15,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Any strategy to duplicate persons or entities acting as separate publishers but discovered to be actually the same person or entity just to avoid the two posts per week limitation shall be dealt with severely and may lead to an immediate permanent ban from further publishing and/or use of the platform.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The publisher of the ad or  commercial post shall have the total responsibility of securing the necessary clearance or permit from the regulating agencies for the posting, if required. The publisher shall save free from any liability the Klackr company or any of its equity holders, officers, directors, administrator, managers, employees, and assigns because of the post.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Strictly prohibited are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The klackr company policies and rules against fake news and prohibited language may lead to a suspension or total ban on the use of the Klackr platform.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Klackr platform is merely the vessel of your ads & commercial posts. Hence, the the Klackr company bears no responsibility to the contents of said ads & commercial posts and the publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors, managers, employees, and assigns.     ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("There are no algorithms on the platfrom so ads & commerical posts reach 100% the subscribers-users upon their opening of the app. The ads & commercial posts are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original ad or commericial post is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Once the ad or commercial post is approved or denied with 48 hours, the administrator shall send a direct message (no reply) to the email address of the personal publisher. If there is no message within the 48 hours, the ad or commerical post is deemed approved of publication. This is automatic, no intervention from the publisher necessary. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 35,
                                                                                        ),
                                                                                        Container(
                                                                                          height: 25,
                                                                                          child:    Padding(
                                                                                            padding: const EdgeInsets.only(
                                                                                                left: 120, right:120, bottom: 0,top:0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('Back'),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
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
                                                            if(info=="3")
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
                                                                                        ),
                                                                                        Container(
                                                                                          height: 30,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Klackr Influencer placements",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("[TO MAXIMUM AREA PER CONTRACT OR SMALLER IPAs INSIDE THEREOF & FOLLOWERS]",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                                                                          ),
                                                                                        ),

                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Row(children: [
                                                                                          Flexible(
                                                                                            flex:7,
                                                                                            child:    Container(
                                                                                              alignment: Alignment.topLeft,
                                                                                              child:   Padding(
                                                                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                                child:    Text("Construct your INFLUENCIAL PLACEMENT AREA/S (IPAs)",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.w500)
                                                                                                ),
                                                                                              ),),
                                                                                          ),
                                                                                          Flexible(
                                                                                            flex:2,
                                                                                            child: Container(
                                                                                              alignment: Alignment.topLeft,
                                                                                              child:   Padding(
                                                                                                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                                                                                child:TextButton(
                                                                                                    style: TextButton.styleFrom(
                                                                                                      textStyle: TextStyle(),
                                                                                                    ),
                                                                                                    onPressed: (){
                                                                                                      setState(() {

                                                                                                      });
                                                                                                    },
                                                                                                    child:Text('click to go',style:TextStyle(color:Colors.red))),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ]
                                                                                        ),
                                                                                        Row(children: [
                                                                                          Flexible(

                                                                                            child:    Container(
                                                                                              alignment: Alignment.topLeft,
                                                                                              child:   Padding(
                                                                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                                child:    Text("IPA in play 3",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.w500)
                                                                                                ),
                                                                                              ),),
                                                                                          ),
                                                                                          Flexible(

                                                                                            child:    Container(
                                                                                              alignment: Alignment.topLeft,
                                                                                              child:   Padding(
                                                                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                                child:    Text("scroll 1-10 etc.",style: TextStyle(color:Colors.red)
                                                                                                ),
                                                                                              ),),
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
                                                                                            child:   Text("Influencers (i.e., candidates and/or partlylist parties for the May 2022 elections) may publish their propaganda in their conracted area or any part inside thereof as Influencer placements.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Klackr platform is merely the vessel of your Influencer placements. Hence, the the Klackr company bears no responsibility to the contents of said Influencer placements and the Influencer publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors,  employees, managers, and asssigns.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Until May 7, 2022 or two days before election day,  the Influencer considered as a single candidate group will be entitled to four propaganda placements published per week. An Influencer group with a maximum of 10 Influencers in the group, however, will be entitled to 12 propaganda placements published per week. The propaganda placements are cumulative and unused placements may be carried over to the next week, and so forth. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Strictly prohibited are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Influencer placements do not require pre-approval by the Klackr administrator or incur any waiting period before their publication unlike ads & commerical posts.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),

                                                                                        Container(
                                                                                          height: 15,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("There are no algorithms on the platfrom so Influencer placements reach 100% the subscribers-users upon their opening of the app. The placements are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original placement is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Strictly prohibited are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The klackr company policies and rules against fake news and prohibited language may lead to a suspension or total ban on the use of the Klackr platform.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("The Klackr platform is merely the vessel of your ads & commercial posts. Hence, the the Klackr company bears no responsibility to the contents of said ads & commercial posts and the publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors, managers, employees, and assigns.     ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("There are no algorithms on the platfrom so ads & commerical posts reach 100% the subscribers-users upon their opening of the app. The ads & commercial posts are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original ad or commericial post is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Container(
                                                                                          alignment: Alignment.topLeft,
                                                                                          child:   Padding(
                                                                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                                            child:   Text("Once the ad or commercial post is approved or denied with 48 hours, the administrator shall send a direct message (no reply) to the email address of the personal publisher. If there is no message within the 48 hours, the ad or commerical post is deemed approved of publication. This is automatic, no intervention from the publisher necessary. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 35,
                                                                                        ),
                                                                                        Container(
                                                                                          height: 25,
                                                                                          child:    Padding(
                                                                                            padding: const EdgeInsets.only(
                                                                                                left: 120, right:120, bottom: 0,top:0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('Back'),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
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
                                                                                          child:    Padding(
                                                                                            padding: const EdgeInsets.only(
                                                                                                left: 125, right:125, bottom: 0,top:0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('Back'),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
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
                                                                                          child:    Padding(
                                                                                            padding: const EdgeInsets.only(
                                                                                                left: 125, right:125, bottom: 0,top:0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('Back'),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
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
                                                                                          child:    Padding(
                                                                                            padding: const EdgeInsets.only(
                                                                                                left: 125, right:125, bottom: 0,top:0),
                                                                                            child:ElevatedButton(
                                                                                              child: Text('Back'),
                                                                                              onPressed: () {
                                                                                                setState(() {
                                                                                                  info="false";
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
                                                      Center(
                                                        child: Container(
                                                          height: MediaQuery.of(context).size.height,
                                                          child: Column(
                                                            children: <Widget>[
                                                              Column(
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
                                                                            icon: Icon(Icons.search_outlined,color:_colorFromHex("#6688A0")),
                                                                          ),
                                                                          filled: true,
                                                                          fillColor: _colorFromHex(themeInput),
                                                                          border: OutlineInputBorder(
                                                                          ),
                                                                          hintText: 'Search',
                                                                          hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                                                        Expanded(
                                                                          flex:3,
                                                                          child:  Container(
                                                                            alignment: Alignment.topLeft,
                                                                            child:   Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                                                                              child: Text("Street",style: TextStyle(fontSize: 20,color:Colors.blue)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:8,
                                                                          child:Container(
                                                                            alignment: Alignment.topRight,
                                                                            child:   Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                                                              child: Text("Klackr account no. 23423",style: TextStyle(color: _colorFromHex(themeInputText),fontSize: 15)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                    ),
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
                                                                        child:  Container(
                                                                          color:_colorFromHex(themeCard),
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
                                                                                      height: MediaQuery.of(context).size.height-95,
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
                                                                                                                      Text(" · ",style: TextStyle(color:  _colorFromHex(themeInputText))),
                                                                                                                      Icon(Icons.public,size: 15,color:  _colorFromHex(themeInputText)),
                                                                                                                    ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ]
                                                                                                                ),
                                                                                                              ),
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
                                                      Container(
                                                        child:   IntrinsicHeight(
                                                          child: Column( children: [
                                                            Container(
                                                              height: 30.0,
                                                              child:   Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                child:IntrinsicHeight(
                                                                  child: Row( children: [

                                                                    Expanded(
                                                                      flex:0,
                                                                      child:Container(
                                                                          height: 20,
                                                                          alignment: Alignment.topLeft,
                                                                          child:Image.asset('assets/logo/klackr_logo.png')),
                                                                    ),
                                                                    Expanded(
                                                                      flex:10,
                                                                      child:  Container(
                                                                        alignment: Alignment.topLeft,
                                                                        child:   Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                                                                          child: Text("Street",style: TextStyle(fontSize: 20,color:Colors.blue)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if(refreshing=="false")
                                                                      Expanded(
                                                                        flex:0,
                                                                        child:  Container(
                                                                          alignment: Alignment.topRight,
                                                                          child: IconButton(
                                                                            icon: Icon(
                                                                              Icons.refresh,color: _colorFromHex(themeInputText),size: 28,
                                                                            ),
                                                                            onPressed: () {

                                                                              if(allow=="on"){
                                                                                allow="off";
                                                                                setState(() {
                                                                                  refreshing="true";
                                                                                });
                                                                                Timer(Duration(seconds: 2), () {
                                                                                  allow="on";
                                                                                  fetchData1();
                                                                                });
                                                                              }
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if(refreshing=="true")
                                                                      Expanded(
                                                                        flex:0,
                                                                        child:  Container(
                                                                          alignment: Alignment.topRight,
                                                                          child: SizedBox(
                                                                            height: 20,
                                                                            width:20,
                                                                            child: CircularProgressIndicator(
                                                                              color: _colorFromHex(themeInputText),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ]),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(children: [
                                                              Container(
                                                                width: 10,
                                                              ),
                                                              Flexible(
                                                                child: Theme(
                                                                  data: ThemeData(
                                                                    primarySwatch: Colors.blue,
                                                                    unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                                                  ),
                                                                  child: Checkbox(
                                                                    value: vicinity,
                                                                    checkColor: Colors.black,
                                                                    activeColor:_colorFromHex("#6688A0"),
                                                                    onChanged: (value) {
                                                                      setState(() {
                                                                        if(vicinity==false){
                                                                          vicinity=true;
                                                                        }else{
                                                                          vicinity=false;
                                                                        }
                                                                      });
                                                                    },),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Text(" home barangay",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                              ),

                                                              //  Container(height: 100.0, color: Colors.cyan),
                                                            ]
                                                            ),
                                                            Row(children: [
                                                              Container(
                                                                width: 10,
                                                              ),
                                                              Flexible(
                                                                child: Theme(
                                                                  data: ThemeData(
                                                                    primarySwatch: Colors.blue,
                                                                    unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                                                  ),
                                                                  child: Checkbox(
                                                                    value: outvicinity,
                                                                    checkColor: Colors.black,
                                                                    activeColor:_colorFromHex("#6688A0"),
                                                                    onChanged: (value) {
                                                                      setState(() {
                                                                        if(outvicinity==false){
                                                                          outvicinity=true;
                                                                        }else{
                                                                          outvicinity=false;
                                                                        }
                                                                      });
                                                                    },),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Text(" home municipality",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                              ),

                                                              //  Container(height: 100.0, color: Colors.cyan),
                                                            ]
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:   Container(
                                                                height:0.5,
                                                                color:_colorFromHex("#6688A0"),
                                                              ),
                                                            ),
                                                            Row(children: [
                                                              Container(
                                                                width: 10,
                                                              ),

                                                              Flexible(
                                                                child: Theme(
                                                                  data: ThemeData(
                                                                    primarySwatch: Colors.blue,
                                                                    unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                                                  ),
                                                                  child: Checkbox(
                                                                    value: vicinity,
                                                                    checkColor: Colors.black,
                                                                    activeColor:_colorFromHex("#6688A0"),
                                                                    onChanged: (value) {
                                                                      setState(() {
                                                                        if(vicinity==false){
                                                                          vicinity=true;
                                                                        }else{
                                                                          vicinity=false;
                                                                        }
                                                                      });
                                                                    },),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Text(" barangay",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                              ),

                                                              //  Container(height: 100.0, color: Colors.cyan),
                                                            ]
                                                            ),
                                                            Row(children: [
                                                              Container(
                                                                width: 10,
                                                              ),
                                                              Flexible(
                                                                child: Theme(
                                                                  data: ThemeData(
                                                                    primarySwatch: Colors.blue,
                                                                    unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                                                  ),
                                                                  child: Checkbox(
                                                                    value: outvicinity,
                                                                    checkColor: Colors.black,
                                                                    activeColor:_colorFromHex("#6688A0"),
                                                                    onChanged: (value) {
                                                                      setState(() {
                                                                        if(outvicinity==false){
                                                                          outvicinity=true;
                                                                        }else{
                                                                          outvicinity=false;
                                                                        }
                                                                      });
                                                                    },),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Text(" municipality",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                              ),

                                                              //  Container(height: 100.0, color: Colors.cyan),
                                                            ]
                                                            ),

                                                            Container(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              alignment: Alignment.center,
                                                              child:TextButton(
                                                                style: TextButton.styleFrom(
                                                                  textStyle: TextStyle(),
                                                                ),
                                                                onPressed: (){
                                                                  setState(() {
                                                                    lobby="main";
                                                                    lobbySize = 75;
                                                                  });
                                                                },
                                                                child:Text('logout',style:TextStyle(color:_colorFromHex("#6688A0"))),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              alignment: Alignment.center,
                                                              child:   Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                child:   Text("Compliance with the Philippine Data Privacy Act",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                              ),
                                                            ),
                                                          ]),
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
                              color: _colorFromHex(themeCard),
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
                                            Flexible(
                                              flex:5,
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeInputText))),
                                                    Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                                    Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
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
                                              child:   Text("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account. Please check your spam folder if you did not receive this email.",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("The confirmation e-mail was sent to verceles@hotmail.com. If that e-mail address is not correct, you can change it in the account settings.",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Account settings",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Did not receive confirmation instructions?",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                          ),
                                          Container(
                                            height: 25,
                                            child:    Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 150, right:150, bottom: 0,top:0),
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
                              color: _colorFromHex(themeCard),
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
                                          ),
                                          Container(
                                            height: 30,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Klackr terms & conditions and SIGN UP (at the end)",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("You can join the Klackr platform and Makabayan Bakuna Raffle Draws, and publish any private post, ad & commercial  post. The Klackr platfrom is run and the Makabayan Bakuna Raffle Draws managed by Klackr inventor & adminstrator Leandro Kuya Jun Verceles Jr. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("You need to register only once for your Klackr acccount. If you are approached again to register, there is no need to register again. You’re good. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Klackr private posts",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Private posts are FREE for subscribers-users and have no limit of frequency of publication (subject to reasonable use). Private posts exclude Klackr ads & commercial posts.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Private posts should not aim to advertise or promote businesses, products, services in the commercial sense; otherwise, they should be treated in the other category: Klackr ads & commercial posts. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Ads & commercial posts in the guise of private posts but actually election campaign or partisan political activity to support or defeat a candidate at any time is strictly prohibited. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Private posts do not require pre-approval by the Klackr administrator and do not incur any waiting period to get published unlike ads & commercial posts. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),

                                          Container(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Klackr ads & commercial posts ",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Your ads & commercial posts are FREE for this beta test. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("An ad or commercial post is evaluated by the Klackr.world administrator and if within 48 hours there is no reply, it is deemed as approved and will automatically be posted unless there is a violation of company rules then which it may be taken down at anytime. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Ads & commercial posts in the context of an election campaign or partisan political activity to support or defeat a candidate or partylist party at any time are strictly prohibited  without the approval of the Klackr administrator.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("The post may be in the nature of at a discount.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
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
                                                    style: TextStyle(color: _colorFromHex("#6688A0")),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: ' TWO ADS OR COMMERCIAL POSTS PER WEEK.',
                                                        style: TextStyle(
                                                            color: _colorFromHex("#6688A0"),
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      TextSpan(text: 'The ad or commercial post expires in 72 hours from the time of publication. ',style: TextStyle(color: _colorFromHex("#6688A0"))),
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
                                              child:   Text("Any strategy to duplicate persons or entities acting as separate publishers but discovered to be actually the same person or entity just to avoid the two posts per week limitation shall be dealt with severely and may lead to an immediate permanent ban from further publishing and/or use of the platform. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("The publisher of the ad or  commercial post shall have the total responsibility of securing the necessary clearance or permit from the regulating agencies for the posting, if required. The publisher shall save free from any liability the Klackr company or any of its equity holders, officers, directors, administrator, managers, employees, and assigns because of the post. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("100% REACH within your barangay",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("There are no algorithms on the platfrom so private posts, ads & commerical posts reach 100% the subscribers-users within your barangay upon their opening of the app. The private posts, ads & commercial posts are viewable for 72 hours from the time the material is downloaded. Sharing to followers or to any body else after the subscriber-user receives the original ad or commericial post is not automatic. If manually shared, it is viewable for another 72 hours from the time of sharing. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Fake news, abusive language, responsible Information, trolling, violations of the Klackr company rules",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("We espouse responsible information. Therefore, strictly prohibited on your private posts, ads & commercial posts are fake news and language that are abusive, cursing, cussing, profaning, blaspheming, racist, anti-minority, white supremancy, and intending to destroy the reputation of any person or group whether the latter is a public or government personality, celebrity, private individual, company, business, public or private institution. The defamatory, cyber libel, and other libel rules of the particular jurisdiction shall supplement the liability for fake news and prohibited language indicated herein.  ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Violation of the Klackr company policy and rules especially against fake news and prohibited language may lead to a suspension or total ban from the platform. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Trolling is strictly prohibited on the platform. An immediate permanent ban awaits the trollers once discovered. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("HARMLESS FROM LIABILITY FOR THE KLACKR COMPANY",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("The Klackr platform is merely the vessel of your private posts, ads & commercial posts. Hence, the the Klackr company bears no responsibility to the contents of said private posts, ads & commercial posts. The publisher saves harmless from all liabilities and damages the Klackr company, its equity holders, officers, directors, managers, employees, and assigns because of said private posts, ads & commercial posts.    ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("CONFIDENTIALITY  ",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child:   Text("Your personal information are strictly confidential. Respecting your rights, any collected information that will directly identify you to third parties unless ordered by the courts or by law or lawfull regulation covering any transaction, sale, transfer, trade, barter, donation, or any other kind of disposition on the Klackr platform will not be done without your express permission. We subscribe to the PHILIPPINE DATA PRIVACY ACT. ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                          ),
                                          Row(children: [
                                            Flexible(
                                              flex:3,
                                              child: Container(
                                                height: 30,
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
                                            ),
                                            Flexible(
                                              flex:9,
                                              child: Text("I agree and will abide by the above terms and conditions for the use of the Klackr.world  platform and, therefore, am signing up.    ",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),

                                            //  Container(height: 100.0, color: Colors.cyan),
                                          ]
                                          ),
                                          Container(
                                            height: 35,
                                          ),
                                          Container(
                                            height: 25,
                                            child:    Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 150, right:150, bottom: 0,top:0),
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
                                  Expanded(
                                    flex: 10,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:_colorFromHex(themeTitle))),
                                          Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                          Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                                        ]),
                                  ),

                                ]),
                              ),
                            ),
                          Container(
                              height:20,
                          ),
                          if(clickContinue=="setting")
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 0),
                              child: Container(
                                child:   IntrinsicHeight(
                                  child: Column( children: [
                                    Expanded(
                                      flex:3,
                                  child: Row( children: [
                                        Text("Filipino",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                        Theme(
                                          data: ThemeData(
                                            primarySwatch: Colors.blue,
                                            unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
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
                                     
                                    
                                      ]),
                                    ),
                                    Expanded(
                                      flex:3,
                                      child: Row( children: [
                                      
                                        Text("English",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                        Theme(
                                          data: ThemeData(
                                            primarySwatch: Colors.blue,
                                            unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                          ),
                                          child: Checkbox(
                                            value: true,
                                            checkColor: Colors.black,
                                            activeColor: Colors.grey,
                                            // activeColor:_colorFromHex("#6688A0"),
                                            onChanged: (value) {
                                              setState(() {
                                                if(english==false){
                                                  english=true;
                                                  pilipino=false;
                                                }
                                              });
                                            },),
                                        ),
                                     

                                      ]),
                                    ),

                                    Expanded(
                                      flex:3,
                                      child: Row( children: [
                                   
                                        Text("Dark Theme",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                        Theme(
                                          data: ThemeData(
                                            primarySwatch: Colors.blue,
                                            unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                          ),
                                          child: Checkbox(
                                            value: themeColor,
                                            checkColor: Colors.black,
                                            activeColor:_colorFromHex("#6688A0"),
                                            onChanged: (value) {
                                              setState(() {
                                                if(themeColor==false){
                                                  themeColor=true;
                                                  darkTheme();
                                                }else{
                                                  themeColor=false;
                                                  whiteTheme();
                                                }
                                              });
                                            },),
                                        )


                                      ]),
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
                                        color: _colorFromHex(themeCard),
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
                                                    child:  Text("Login in now",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold,fontSize: 15)),
                                                  ),
                                                ),
                                                Container(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 45,
                                                  child:   Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                    child: TextField(
                                                      controller: emailLogin,
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: _colorFromHex(themeInput),
                                                        border: OutlineInputBorder(

                                                        ),
                                                        hintText: 'Email address',
                                                        hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                                      controller:passwordLogin,
                                                      keyboardType: TextInputType.visiblePassword,
                                                      obscureText: _obscured3,
                                                      focusNode: textFieldFocusNode3,
                                                      decoration: InputDecoration(
                                                        floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                                                        hintText: 'Password',
                                                        hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                                              color: _colorFromHex("#6688A0"),
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
                                        color: _colorFromHex(themeCard),
                                        child:   IntrinsicHeight(
                                          child: Column( children: [
                                            Expanded(
                                              child: Column(children: [
                                                Container(
                                                  height: 150,
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
                                        color: _colorFromHex(themeCard),
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
                                                              child:  Text("Inventor & Administrator",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold,fontSize: 17)),
                                                            ),
                                                          ),
                                                          Container(height: 5),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("running the Klackr platform and managing the Makabayan Pilipino Bakuna Raffle Draws:",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("Leandro Kuya Jun Verceles Jr.",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold,fontSize: 17)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("KuyaJunVerceles@Klackr.world",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                            ),
                                                          ),
                                                          Container(height: 5),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                                child: Icon(Icons.account_circle,size: 30,color:_colorFromHex("#6688A0"))
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 140,
                                                          ),
                                                        ]
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
                                                              child:  Text("Subscribers-users STATS",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold,fontSize: 15)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("(in real time):",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                            ),
                                                          ),
                                                          Container(height: 20),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("Subscribers-users registered:",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("1",style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("18 years old and above",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("2",style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("14-17 years old",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("1",style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("13 years old and below",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            height: 1,
                                                            color:_colorFromHex("#6688A0"),
                                                          ),
                                                          Container(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("1",style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("total subscribers-users on the Klackr platform",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("1",style: TextStyle(color:Colors.red)),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment.topLeft,
                                                            child:   Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                              child:  Text("active users 18 years old and above",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 15,
                                                          ),
                                                        ]
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
                                color: _colorFromHex(themeCard),
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
                                            child:  Text("Makabayan Pilipino:",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold,fontSize: 19)),
                                          ),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("Register to join the Makabayan Pilipino Bakuna Raffle Draws for big cash and other prizes. All FREE! Bigger cash and prizes if vaccinated. And even if not vaccinated, you can still participate.",style: TextStyle(color:_colorFromHex("#6688A0"))),
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
                                                hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                                hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                                hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                        ),
                                        Text("Gender",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                        Row(children: [
                                          Container(
                                            width: 10,
                                          ),

                                          Flexible(
                                            child:Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                              ),
                                              child: Checkbox(
                                                value: male,
                                                checkColor: Colors.black,
                                                activeColor: _colorFromHex("#6688A0"),
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

                                          Flexible(
                                            child:      Text("Male",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),
                                          Flexible(
                                            child: Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                              ),
                                              child: Checkbox(
                                                value: female,
                                                checkColor: Colors.black,
                                                activeColor:_colorFromHex("#6688A0"),
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
                                          Flexible(
                                            child: Text("Female",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),
                                          Flexible(
                                            child: Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                              ),
                                              child: Checkbox(
                                                value: rather,
                                                checkColor: Colors.black,
                                                activeColor:_colorFromHex("#6688A0"),
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
                                          Flexible(
                                            flex: 2,
                                            child: Text("Rather not say",style: TextStyle(color:_colorFromHex("#6688A0"))),
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
                                                hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                                    hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                                hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                                      color: _colorFromHex("#6688A0"),
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
                                                hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                                      color: _colorFromHex("#6688A0"),
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
                                                child: Text("Registration is any age 14 years old and above. To join the Makabayan Pilipino Bakuna Raffle Draws, you must be 18 years of age by the day of the vacination raffle draws planned to start on February 15, 2022.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                              ),
                                            ),
                                          ),

                                          //  Container(height: 100.0, color: Colors.cyan),
                                        ]
                                        ),
                                        Container(height: 20),
                                        Container(
                                          height:150,
                                        child:Column(children: [
                                        Container(
                                              alignment: Alignment.center,
                                              child:   Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                child: Text("Date of birth",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                              ),
                                            ),
                                        Container(
                                          height:10,
                                        ),
                                        Row(children:[
                                          Container(
                                          width:MediaQuery.of(context).size.width-242,
                                          ),
                                          DropdownButtonHideUnderline(
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
                                              iconEnabledColor:_colorFromHex("#6688A0"),
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
                                                color: _colorFromHex(themeCard),
                                              ),
                                              dropdownElevation: 8,
                                              scrollbarRadius: const Radius.circular(40),
                                              scrollbarThickness: 6,
                                              scrollbarAlwaysShow: true,
                                              offset: const Offset(-20, 0),
                                            ),
                                          ),
                                          Container(width: 5),
                                          Flexible(
                                            child: Text("Month",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),
                                        ]),
                                          Container(height: 5),
                                          Row(children:[
                                            Container(
                                              width:MediaQuery.of(context).size.width-242,
                                            ),
                                            DropdownButtonHideUnderline(
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
                                                iconEnabledColor:_colorFromHex("#6688A0"),
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
                                                  color: _colorFromHex(themeCard),
                                                ),
                                                dropdownElevation: 8,
                                                scrollbarRadius: const Radius.circular(40),
                                                scrollbarThickness: 6,
                                                scrollbarAlwaysShow: true,
                                                offset: const Offset(-20, 0),
                                              ),
                                            ),
                                            Container(width: 5),
                                            Flexible(
                                              child: Text("Day",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ]),
                                          Container(height: 5),
                                          Row(children:[
                                            Container(
                                              width:MediaQuery.of(context).size.width-242,
                                            ),

                                          DropdownButtonHideUnderline(
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
                                                iconEnabledColor:_colorFromHex("#6688A0"),
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
                                                  color: _colorFromHex(themeCard),
                                                ),
                                                dropdownElevation: 8,
                                                scrollbarRadius: const Radius.circular(40),
                                                scrollbarThickness: 6,
                                                scrollbarAlwaysShow: true,
                                                offset: const Offset(-20, 0),
                                              ),
                                            ),
                                            Container(width: 5),
                                            Flexible(
                                              child: Text("Year",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ]),

                                        ]
                                        ),
                                        ),
                                        
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("We will please need your residence address in the Philippines to locate you in case you win any of the big cash and others prizes.",style: TextStyle(color:_colorFromHex("#6688A0"))),
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
                                                            color: _colorFromHex("#6688A0"),
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
                                                            color:  _colorFromHex(themeInputText),
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
                                                      });
                                                      regionValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex("#6688A0"),
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
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeCard),
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
                                                          'Province',
                                                          style: TextStyle(
                                                            color: _colorFromHex("#6688A0"),
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: province
                                                      .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:  TextStyle(
                                                            color: _colorFromHex(themeInputText),
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
                                                      getMunicipality();
                                                      provinceValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex("#6688A0"),
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
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeCard),
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
                                                          'City/Municipality',
                                                          style: TextStyle(

                                                            color: _colorFromHex("#6688A0"),
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

                                                            color: _colorFromHex(themeInputText),
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
                                                      getBarangay();
                                                      citymunicipalityValue = value as String;
                                                    });
                                                  },
                                                  iconSize: 14,
                                                  iconEnabledColor: _colorFromHex("#6688A0"),
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
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeCard),
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
                                                          'Barangay (if your barangay does not appear, type in box below)',
                                                          style: TextStyle(

                                                            color: _colorFromHex("#6688A0"),
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

                                                            color:  _colorFromHex(themeInputText),
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
                                                  iconEnabledColor: _colorFromHex("#6688A0"),
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
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0),
                                                    color: _colorFromHex(themeCard),
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
                                        Container(
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
                                                hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
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
                                        ),
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
                                                hintText: '  Cellphone No.',
                                                hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                              ),
                                              style: TextStyle(color:  _colorFromHex(themeInputText)),
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
                                            child:   Text("Will you have had at least your first dose before the day of the Makabayan Pilipino Bakuna Raffle Draws planned on February 15, 2022 or later raffle draws?",style: TextStyle(color:_colorFromHex("#6688A0"))),
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
                                                unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                              ),
                                              child: Checkbox(
                                                value: yesDraw,
                                                checkColor: Colors.black,
                                                activeColor: _colorFromHex("#6688A0"),
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
                                            child:      Text("Yes",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),
                                          Flexible(
                                            child: Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                              ),
                                              child: Checkbox(
                                                value: noDraw,
                                                checkColor: Colors.black,
                                                activeColor:_colorFromHex("#6688A0"),
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
                                            child: Text("No",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),

                                        ],
                                        ),
                                        Container(height: 10),
                                        Row(children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child:Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                              ),
                                              child: Checkbox(
                                                value: wouldFollow,
                                                checkColor: Colors.black,
                                                activeColor: _colorFromHex("#6688A0"),
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
                                          ),

                                          Flexible(
                                            flex:9,
                                            child:      Text(" I would like to join and follow the Makabayan Pilipino Bakuna Raffle Draws for big cash and other prizes. All FREE! Bigger cash and prizes if I am vaccinated. Even if not vaccinated, I can still join and win.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),

                                        ],
                                        ),

                                        Container(height: 10),
                                        Row(children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child:Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.blue,
                                                unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                              ),
                                              child: Checkbox(
                                                value: wouldReview,
                                                checkColor: Colors.black,
                                                activeColor: _colorFromHex("#6688A0"),
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
                                          ),

                                          Flexible(
                                            flex:9,
                                            child:Text("I would like to review the terms, conditions, and rules of the Klackr.world  platform, then to sign up at the end.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),

                                        ],
                                        ),
                                        Container(height: 10),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text("Unclick any box if you do not agree. ",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10)),
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
                                                    ||regionValue==null||provinceValue==null||citymunicipalityValue==null
                                                    ||cellphoneRegisterController.text==""){
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
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text(" Mandatory field",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),
                                        ),
                                        Container(height: 5),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text(" Also to be followed are -",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),
                                        ),
                                        Container(height: 15),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text(" Klackr.world/vicinity.tidbits",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text(" to discover great things about your vicinity and beyond",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),
                                        ),
                                        Container(height: 5),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text(" Leandro Kuya Jun Verceles Jr. ",style: TextStyle(color:_colorFromHex("#6688A0"),fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child:   Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                            child:   Text(" running the Klackr platform and being the manager of the Makabayan Pilipino Bakuna Raffle Draws, and to discover great things",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                          ),
                                        ),
                                        Container(height: 15),









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

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}



bool english=true;
bool pilipino=false;

List<String> region=[];
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
var month = [for(var i=1; i<13; i+=1) i];
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
var Umonth = [for(var i=1; i<13; i+=1) i];
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
List<String> Uregion=[];
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
String themeCard = white;
String themeBase = Whitecardcolor;
String themeInputText = black;
String themeTitle = black;
String themeInput = whiteinput;
String themeAppbard = grey;
bool themeColor = false;


int one = 3;
int two = 5;
int third = 2;
String refreshing = "false";
String APItoken = "http://klackr.teravibe.com:5000/auth/login/";
String APIlocation = "http://klackr.teravibe.com:5000/auth/location/";
String APIregister = "http://klackr.teravibe.com:5000/auth/register/";
String APIlogin = "http://klackr.teravibe.com:5000/auth/login/";
String APIposting = "http://klackr.teravibe.com:5000/homepage/posts/";
String APIgetpost = "http://klackr.teravibe.com:5000/homepage/posts/?limit=30&offset=0";
String APIgetprofile = "http://klackr.teravibe.com:5000/homepage/profile/";
String role = "influencer";
String info = "false";//false
String lobby = "main";//main,lobby,editprofile
double lobbySize = 75;//75
const appleType = "apple";
const androidType = "android";
String plattform = "web";
String lobbyselect = "lobbyposting";