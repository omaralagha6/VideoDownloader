import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_downloader_flutter/Screens/FacebookScreen.dart';
import 'package:video_downloader_flutter/Screens/InstagramScreen.dart';
import 'package:video_downloader_flutter/Screens/YoutubeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: Colors.blueGrey,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.youtube,

                    ),
                    text: "Youtube",
                  ),
                  Tab(
                    icon:  Icon(
                      FontAwesomeIcons.instagram,
                    ),
                    text: "Instagram",
                  ),
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.facebook,

                    ),
                    text: "Facebook",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    YoutubeScreen(),
                    InstagramScreen(),
                    FacebookScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class RadiantGradientMask extends StatelessWidget {
//   RadiantGradientMask({required this.child});
//
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (bounds) => RadialGradient(
//         center: Alignment.center,
//         radius: 0.5,
//         colors: [
//           Color.fromRGBO(64, 93, 230, 1),
//           Color.fromRGBO(88, 81, 216, 1),
//           Color.fromRGBO(131, 58, 180, 1),
//           Color.fromRGBO(193, 53, 132, 1),
//           Color.fromRGBO(225, 48, 108, 1),
//           Color.fromRGBO(253, 29, 29, 1),
//           Color.fromRGBO(245, 96, 64, 1),
//           Color.fromRGBO(247, 119, 55, 1),
//           Color.fromRGBO(252, 175, 69, 1),
//           Color.fromRGBO(255, 220, 128, 1),
//           Colors.white
//         ],
//       ).createShader(bounds),
//       child: child,
//     );
//   }
// }

//
// class RadiantGradientMask extends StatelessWidget {
//   RadiantGradientMask({this.child});
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (bounds) => RadialGradient(
//         center: Alignment.center,
//         radius: 0.5,
//         colors: [Colors.blue, Colors.red],
//         tileMode: TileMode.mirror,
//       ).createShader(bounds),
//       child: child,
//     );
//   }
// }
