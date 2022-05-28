import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstagramScreen extends StatefulWidget {
  const InstagramScreen({Key? key}) : super(key: key);

  @override
  State<InstagramScreen> createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return  Scaffold(
      body: Container(
        child:Center(
          child: Icon(FontAwesomeIcons.instagram,size: 100,),
        ),
      ),
    );
  }
}
