import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, jsonDecode, jsonEncode;



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

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  var pointToken;
Future<void> allToken() async {
  var request = new
  http.MultipartRequest("POST",Uri.parse(APItoken));
  request.fields['email'] = 'carlosonit1998@gmail.com';
  request.fields['password'] = 'carlrein199817';
  http.Response response = await http.Response.fromStream(await
      request.send());
  if (response.statusCode == 200) {
  var pointer = response.body;
   pointToken = jsonDecode(pointer)['tokens']['access'];
  getRegion();
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
  void getRegion() async {
    var response = await http.get(Uri.parse(APIlocation), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $pointToken',
    });
    var pointer = response.body;
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



@override void initState() {
    super.initState();
    allToken();
    selectRegion();
}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: _colorFromHex("#191B22"),
      appBar: AppBar(
        
        backgroundColor: _colorFromHex("#191B22"),
        elevation: 0,
       title:Container(
         height: 100,
           width: 500,
           alignment: Alignment.center,
           child: IntrinsicHeight(
             child: Row( children: [
               Expanded(
                 flex: 0,
                 child:Container(
                     width: 160,

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
                  Text("Klackr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                   Text("Follow friends and discover great",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                   Text("things in your vicinity and beyond",style: TextStyle(color:_colorFromHex("#6688A0"),fontSize: 10,fontWeight: FontWeight.bold)),
                 ]),
               ),

             ]),
           ),
       ),
actions: [
  IntrinsicHeight(
    child: Row( children: [
      Text("Filipino",style: TextStyle(color:_colorFromHex("#6688A0"))),
      Theme(
        data: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
        ),
        child: Checkbox(
          value: pilipino,
          checkColor: Colors.black,
          activeColor: _colorFromHex("#6688A0"),
          onChanged: (value) {
            setState(() {
             if(pilipino==false){
               pilipino=true;
               english=false;
             }
            });
          },),
      ),
      Text("English",style: TextStyle(color:_colorFromHex("#6688A0"))),
      Theme(
        data: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
        ),
        child: Checkbox(
          value: english,
          checkColor: Colors.black,
          activeColor:_colorFromHex("#6688A0"),
          onChanged: (value) {
            setState(() {
              if(english==false){
                english=true;
                pilipino=false;
              }
            });
          },),
      )



    ]),
  ),

],
        toolbarHeight: 75,
      ),
      body: Container(
       child: IntrinsicHeight(
          child: Column( children: [
            Container(
              height: 20,
            ),
            IntrinsicHeight(
              child: Row( children: [
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
                            child:Card(
                              color: _colorFromHex("#282C37"),
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
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: _colorFromHex("#191B22"),
                                              border: OutlineInputBorder(

                                              ),
                                              hintText: 'First name',
                                              hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                            ),
                                            style: TextStyle(color: Colors.white),
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
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: _colorFromHex("#191B22"),
                                              border: OutlineInputBorder(

                                              ),
                                              hintText: 'Last name',
                                              hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                            ),
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Row(children: [
                                        Container(
                                          width: 10,
                                        ),
                                        Text("Suffix",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                        Theme(
                                          data: ThemeData(
                                            primarySwatch: Colors.blue,
                                            unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                          ),
                                          child: Checkbox(
                                            value: jr,
                                            checkColor: Colors.black,
                                            activeColor: _colorFromHex("#6688A0"),
                                            onChanged: (value) {
                                              setState(() {
                                                if(jr==false){
                                                  jr=true;
                                                  sr=false;
                                                }else{
                                                  jr=false;
                                                }
                                              });
                                            },),
                                        ),
                                        Text("Jr.",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                        Theme(
                                          data: ThemeData(
                                            primarySwatch: Colors.blue,
                                            unselectedWidgetColor: _colorFromHex("#6688A0"), // Your color
                                          ),
                                          child: Checkbox(
                                            value: sr,
                                            checkColor: Colors.black,
                                            activeColor:_colorFromHex("#6688A0"),
                                            onChanged: (value) {
                                              setState(() {
                                                if(sr==false){
                                                  sr=true;
                                                  jr=false;
                                                }else{
                                                  sr=false;
                                                }
                                              });
                                            },),
                                        ),
                                        Text("Sr.",style: TextStyle(color:_colorFromHex("#6688A0"))),

                                        //  Container(height: 100.0, color: Colors.cyan),
                                      ]
                                      ),
                                      Container(
                                        height: 5,
                                      ),
                                      Row(children: [
                                        Container(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child:      Text("Gender",style: TextStyle(color:_colorFromHex("#6688A0"))),
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
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: _colorFromHex("#191B22"),
                                              border: OutlineInputBorder(

                                              ),
                                              hintText: 'Email address',
                                              hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                            ),
                                            style: TextStyle(color: Colors.white),
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
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: _colorFromHex("#191B22"),
                                                  border: OutlineInputBorder(

                                                  ),
                                                  hintText: 'Username',
                                                  hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                                ),
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              child:Padding(
                                                  padding:  EdgeInsets.only(
                                                      left:0, right: 18, bottom: 0,top:10.5),
                                                  child:Text("@klackr.world",style: TextStyle(color: _colorFromHex("#6688A0"),fontSize: 16  ))
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
                                            keyboardType: TextInputType.visiblePassword,
                                            obscureText: _obscured,
                                            focusNode: textFieldFocusNode,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                                              hintText: 'Password',
                                              hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                              filled: true, // Needed for adding a fill color
                                              fillColor:  _colorFromHex("#191B22"),
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
                                            style: TextStyle(color: Colors.white),
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
                                            keyboardType: TextInputType.visiblePassword,
                                            obscureText: _obscured,
                                            focusNode: textFieldFocusNode,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                                              hintText: 'Confirm password',
                                              hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                              filled: true, // Needed for adding a fill color
                                              fillColor:  _colorFromHex("#191B22"),
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
                                            style: TextStyle(color: Colors.white),
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
                                      Container(height: 10),
                                      Row(children: [
                                        Flexible(
                                          flex:2,
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            child:   Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                              child: Text("Date of birth",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                            ),
                                          ),
                                        ),
                                        Container(width: 20),
                                        Expanded(
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
                                                          color: Colors.white,
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
                                                color: _colorFromHex("#191B22"),
                                              ),
                                              buttonElevation: 2,
                                              itemHeight: 40,
                                              itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                              dropdownMaxHeight: 200,
                                              dropdownWidth: 200,
                                              dropdownPadding: null,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(0),
                                                color: _colorFromHex("#191B22"),
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
                                          child: Text("Month",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                        ),
                                        Container(width: 20),
                                        Expanded(
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
                                                          color: Colors.white,
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
                                                color: _colorFromHex("#191B22"),
                                              ),
                                              buttonElevation: 2,
                                              itemHeight: 40,
                                              itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                              dropdownMaxHeight: 200,
                                              dropdownWidth: 200,
                                              dropdownPadding: null,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(0),
                                                color: _colorFromHex("#191B22"),
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
                                          child: Text("Day",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                        ),
                                        Container(width: 20),
                                        Expanded(
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
                                                          color: Colors.white,
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
                                                color: _colorFromHex("#191B22"),
                                              ),
                                              buttonElevation: 2,
                                              itemHeight: 40,
                                              itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                              dropdownMaxHeight: 200,
                                              dropdownWidth: 200,
                                              dropdownPadding: null,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(0),
                                                color: _colorFromHex("#191B22"),
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
                                          child: Text("Year",style: TextStyle(color:_colorFromHex("#6688A0"))),
                                        ),
                                      ]
                                      ),
                                      Container(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child:   Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                          child:   Text("We will please need your residence address in the Philippines to locate you in case you win any of the big cash and prizes and others.",style: TextStyle(color:_colorFromHex("#6688A0"))),
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
                                                        style: const TextStyle(
                                                          color: Colors.white,
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
                                                  color:_colorFromHex("#191B22"),
                                                ),
                                                buttonElevation: 2,
                                                itemHeight: 40,
                                                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,
                                                dropdownPadding: null,
                                                dropdownDecoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(0),
                                                  color: _colorFromHex("#191B22"),
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
                                                        style: const TextStyle(
                                                          color: Colors.white,
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
                                                  color:_colorFromHex("#191B22"),
                                                ),
                                                buttonElevation: 2,
                                                itemHeight: 40,
                                                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,
                                                dropdownPadding: null,
                                                dropdownDecoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(0),
                                                  color: _colorFromHex("#191B22"),
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
                                                        style: const TextStyle(

                                                          color: Colors.white,
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
                                                  color:_colorFromHex("#191B22"),
                                                ),
                                                buttonElevation: 2,
                                                itemHeight: 40,
                                                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,
                                                dropdownPadding: null,
                                                dropdownDecoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(0),
                                                  color: _colorFromHex("#191B22"),
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
                                                        style: const TextStyle(

                                                          color: Colors.white,
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
                                                  color:_colorFromHex("#191B22"),
                                                ),
                                                buttonElevation: 2,
                                                itemHeight: 40,
                                                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,
                                                dropdownPadding: null,
                                                dropdownDecoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(0),
                                                  color: _colorFromHex("#191B22"),
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
                                              fillColor: _colorFromHex("#191B22"),
                                              border: OutlineInputBorder(

                                              ),
                                              hintText: '  Type here your barangay if not seen when scrolling in the box above',
                                              hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                            ),
                                            style: TextStyle(color: Colors.white),
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
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: _colorFromHex("#191B22"),
                                              border: OutlineInputBorder(

                                              ),
                                              hintText: '  Cellphone No.',
                                              hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                            ),
                                            style: TextStyle(color: Colors.white),
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
                                        height: 25,
                                        child:   Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                          child:ElevatedButton(
                                            child: Text('continue'),
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                primary: _colorFromHex("#2786C9"),
                                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      Container(height: 15),
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

                  ]
    ),
                  ),
    ),
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
                              child:Card(
                                color: _colorFromHex("#191B22"),
                                child:   IntrinsicHeight(
                                  child: Column( children: [
                                    Expanded(
                                      child: Column(children: [
                                        Container(
                                          child:Card(
                                            color: _colorFromHex("#282C37"),
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
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: _colorFromHex("#191B22"),
                                                            border: OutlineInputBorder(

                                                            ),
                                                            hintText: 'Email address',
                                                            hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                                          ),
                                                          style: TextStyle(color: Colors.white),
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
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: _colorFromHex("#191B22"),
                                                            border: OutlineInputBorder(

                                                            ),
                                                            hintText: 'Password',
                                                            hintStyle: TextStyle(color:_colorFromHex("#6688A0")),
                                                          ),
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      child:   Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                                        child:ElevatedButton(
                                                          child: Text('Login'),
                                                          onPressed: () {},
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
                                            color: _colorFromHex("#282C37"),
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
                                            color: _colorFromHex("#282C37"),
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
                                                                  child:  Text("51,234,567",style: TextStyle(color:Colors.red)),
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
                                                                  child:  Text("1,234,567",style: TextStyle(color:Colors.red)),
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
                                                                  child:  Text("456,789",style: TextStyle(color:Colors.red)),
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
                                                                  child:  Text("52,925,923",style: TextStyle(color:Colors.red)),
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
                                                                  child:  Text("45,001,023",style: TextStyle(color:Colors.red)),
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
          ]),
        ),
       ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
bool english=true;
bool pilipino=false;
bool jr=false;
bool sr=false;
bool male=false;
bool female=false;
bool rather=false;
String? monthValue;
String? dayValue;
String? yearValue;
var month = [for(var i=1; i<13; i+=1) i];
var day = [for(var i=1; i<32; i+=1) i];
var year = [for(var i=1930; i<2022; i+=1) i];

String APItoken = "http://klackr.teravibe.com:5000/auth/login/";
String APIlocation = "http://klackr.teravibe.com:5000/auth/location/";

String? regionValue;
List<String> region=[];
String? provinceValue;
List<String> province=[];
String? citymunicipalityValue;
List<String> citymunicipality=[];
String? barangayValue;
List<String> barangay=[];
bool yesDraw=false;
bool noDraw=false;
bool wouldFollow=true;
bool wouldReview=true;

final barangayTypeRegisterController = TextEditingController();



