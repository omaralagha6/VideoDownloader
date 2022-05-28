import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookScreen extends StatefulWidget {
  const FacebookScreen({Key? key}) : super(key: key);

  @override
  State<FacebookScreen> createState() => _FacebookScreenState();
}

class _FacebookScreenState extends State<FacebookScreen> {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return  Scaffold(
      body: Container(
        child:Center(
          child: Icon(FontAwesomeIcons.facebook,size: 100,),
        ),
      ),
    );
  }
}
