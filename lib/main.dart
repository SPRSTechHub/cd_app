import 'package:cd_app/src/WebViewStack.dart';
import 'package:cd_app/utils/pagesettings.dart';
import 'package:cd_app/utils/photosettings.dart';
import 'package:cd_app/utils/sharesettings.dart';
import 'package:cd_app/utils/support.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CD App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CD Settings Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: WebsiteView(),
        ),
        floatingActionButton: Builder(
          builder: (context) => FabCircularMenu(
            key: fabKey,
            alignment: Alignment.bottomRight,
            ringColor: Colors.black.withAlpha(55),
            ringDiameter: screenWidth * 1.02, //500.0,
            ringWidth: (screenWidth * 1.02) * 0.3,
            fabSize: 64.0,
            fabElevation: 8.0,
            fabIconBorder: const CircleBorder(),
            fabColor: Colors.red,
            fabOpenIcon: const Icon(FontAwesome.wrench, color: Colors.black),
            fabCloseIcon: const Icon(Icons.close, color: Colors.white),
            fabMargin: const EdgeInsets.all(12.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.easeInOutCirc,
            children: <Widget>[
              RawMaterialButton(
                fillColor: Colors.black87,
                splashColor: Colors.grey[600],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPageScreen()),
                  );
                },
                shape: const CircleBorder(
                    side: BorderSide(width: 2, color: Colors.blue)),
                padding: const EdgeInsets.all(14.0),
                child: const Icon(FontAwesome.file_code, color: Colors.white),
              ),
              RawMaterialButton(
                fillColor: Colors.red[300],
                splashColor: Colors.blue[600],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPhotoScreen()),
                  );
                },
                shape: const CircleBorder(
                    side: BorderSide(width: 2, color: Colors.blue)),
                padding: const EdgeInsets.all(14.0),
                child: const Icon(FontAwesome.camera_alt, color: Colors.white),
              ),
              RawMaterialButton(
                fillColor: Colors.green[600],
                splashColor: Colors.pink[600],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShareScreen()),
                  );
                },
                shape: const CircleBorder(
                    side: BorderSide(width: 2, color: Colors.blue)),
                padding: const EdgeInsets.all(14.0),
                child: const Icon(FontAwesome.share, color: Colors.white),
              ),
              RawMaterialButton(
                fillColor: Colors.blueGrey[300],
                splashColor: Colors.blueAccent[600],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DevSupport()),
                  );
                },
                shape: const CircleBorder(
                    side: BorderSide(width: 2, color: Colors.blue)),
                padding: const EdgeInsets.all(14.0),
                child: const Icon(FontAwesome.lifebuoy, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }
}
