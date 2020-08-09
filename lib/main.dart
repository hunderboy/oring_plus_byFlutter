import 'package:flutter/material.dart';
import 'package:oring_project_ex1/widget/bottom_bar.dart';
import 'package:oring_project_ex1/screen/home_screen.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController controller;


  bool get isInDebugMode { // 디버그 모드 설정
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }


  @override
  Widget build(BuildContext context){
//    return SafeArea(
//        child: ListView(children: List.generate(100, (i) => Text("wow2 is $i.")))
//    );
    if(isInDebugMode) { // 디버그 모드 일경우
      Stetho.initialize();
    }

    return MaterialApp(
      title: 'bongFlix',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white
      ),

      home: DefaultTabController(
        length: 3, // 바텀네비게이션 길이
        child: Scaffold(

          body: SafeArea(
            child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  HomeScreen(),
                  Container(
                    child: Center(
                      child: Text('2 두번째'),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text('3 세번째'),
                    ),
                  ),

                ]
            ),
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }






}

