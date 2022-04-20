import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';


void main()
{
  runApp(MailerApp());
}

class MailerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save app',
      theme: ThemeData(
          primaryColor: Color(0xFF21130D)
      ),

      home:MyMailer(),
    );
  }
}

class MyMailer extends StatefulWidget {
  @override
  _MyMailerState createState()
  {
    return _MyMailerState();
  }
}

class _MyMailerState extends State<MyMailer> {




  ///Mailer Functions

  SendEmail() async {
    final username = 'klackroomessage@gmail.com';       ///PUT YOUR EMail
    final password = 'klackroo12345';                /// Put your Password

    /// Note!!! Make sure the Account is Less secure app access to work this app Please Turn on first LINK------> https://myaccount.google.com/lesssecureapps
    /// Else Use gmailXoauth2 for TOKEN or Use gmailSaslXoauth2 for EMAIL & TOKEN
    /// final smtpServer = gmailSaslXoauth2(email, Token);
    /// final smtpServer = gmailXoauth2(Token);
    /// final smtpServer = gmail(username, password);



    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.




    // Create our message.
    final message = Message()
      ..from = Address(username,"Klackr User")
      ..recipients.add('klackroo@gmail.com')
    ///  ..recipients.add(recipients.text)
    //..ccRecipients.addAll([ccRecipients.text])
    //..bccRecipients.add(Address(bccRecipients.text))
      ..subject = 'Message from klackr user'
      ..html = Body.text;

    //   ..text = 'This is the plain text.This is line 2 of the text part.'

    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      isLoading = false;
    });


    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(" Sending Message"+ sendReport.toString()),
      ));

    } on MailerException catch (e) {
      print('Message not sent.');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Message not sent. Try again')  ));
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Problem: ${p.code}: ${p.msg}"),
        ));
      }
    }




  }

  bool isLoading = false;
  TextEditingController recipients = TextEditingController();
  TextEditingController ccRecipients = TextEditingController();
  TextEditingController bccRecipients = TextEditingController();
  TextEditingController Subject = TextEditingController();
  TextEditingController Body = TextEditingController();







  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Save Text App"),
        backgroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children:[

                Row(
                  children: [
                    Text("To:",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20),),
                    Text(" klackroo@gmail.com'",style: TextStyle(color: Colors.blue,fontSize: 20),),
                  ],
                ),
                /*

                Text("mailer: ^5.1.0"),
                TextFormField(
                  controller: recipients,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                    hintText: 'To:',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  autofocus: false,
                ),
                SizedBox(
                  height:10,
                ),

                */


                ///ccRecipients


                /*
                TextFormField(
                  controller: ccRecipients,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                    hintText: 'ccRecipients',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  autofocus: false,
                ),
                */

                ///ccRecipients

                ///Subject

/*
                TextFormField(
                  controller: Subject,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                    hintText: 'Subject:',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  autofocus: false,
                ),


                SizedBox(
                  height:10,
                ),
            */
                ///Subject

                TextField(
                  controller: Body,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "write something...",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black)
                      )
                  ),

                ),


                SizedBox(
                  height:10,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    SizedBox(
                      width: 100,
                    ),
                    ElevatedButton(
                      onPressed:(){
                        SendEmail();
                      },
                      child:(isLoading)
                          ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1.5,
                          ))
                          : Text('Reply' ),
                    ),
                  ],
                ),

              ],
            )
        ),
      ),
    );
  }


}