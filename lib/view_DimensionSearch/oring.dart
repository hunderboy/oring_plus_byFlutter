import 'dart:ui';
import 'package:flutter/material.dart';


import 'package:oring_project_ex1/service/db_helper.dart';
import 'package:oring_project_ex1/models/oring_model.dart';
import 'dart:math';

class OringCalculator extends StatefulWidget {
  _OringCalculatorState createState() => _OringCalculatorState();
}

class _OringCalculatorState extends State<OringCalculator> {
  @override
  void initState() {
    super.initState();
  }


  Widget makeText(String title, {double width, double height}) {
    return Container(
      child: Center(child: Text(title, style: TextStyle(fontSize: 23.0),),),
      width: width,
      height: height,
      decoration: BoxDecoration(color: Colors.red[300]),
      margin: EdgeInsets.all(10.0),
    );
  }

  @override
  Widget build(BuildContext context) {



    return Column(
        children: <Widget>[
          TopView(),
          MiddleView(),
          BottomView(),
//          TextField() // ID 입력
//          TextField() // CS 입력
        // dataTable 들어감


        ]
    );

  }
}// _OringCalculatorState 끝



class BottomView extends StatefulWidget {
  _BottomViewState createState() => _BottomViewState();
}
class _BottomViewState extends State<BottomView> {

  @override
  void initState() {
    super.initState();
  }

//  Widget FutureBuilder(
//  )

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 2),
        () => 'Data Loaded',
  );



  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );


//    return Center();


  }
}





class MiddleView extends StatefulWidget {
  _MiddleViewState createState() => _MiddleViewState();
}
class _MiddleViewState extends State<MiddleView> {

  @override
  void initState() {
    super.initState();
  }


  Widget oringMiddleRow() {
    return Row(
        children: <Widget>[

          Container(
            child: Text('ID'),
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
                children: <Widget>[

                  Container(
                    child: Text('mm'),
                    padding: EdgeInsets.all(10.0),
                  ),
                ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),


          Container(
            child: Text('CS'),
            padding: EdgeInsets.all(10.0),
          ),
          Row(
              children: <Widget>[
//                Container(
//                  child: TextField(),
//                  padding: EdgeInsets.all(10.0),
//                ),
                Container(
                  child: Text('mm'),
                  padding: EdgeInsets.all(10.0),
                ),
              ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ),
        ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: oringMiddleRow(),
    );
  }
}





class TopView extends StatefulWidget {
  _TopViewState createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
  var isSelectedMode = [true, false];
  var isSelectedUnit = [true, false];

  @override
  void initState() {
    super.initState();
  }

  /** 상단 위젯1 */
  Widget oringTopRow() {
    return Row(
        children: <Widget>[
          // 이미지 삽입
        Container(
          child: Image.asset('images/default_img.jpg', width: 150, height: 150),
          padding: EdgeInsets.all(20.0),
        ),
        // 토글 버튼 화면 설정
        Column(
          children: <Widget>[
            // TODO Mode 토글 버튼 위젯
            Container(
              child: Text('Mode'),
              padding: EdgeInsets.all(10.0),
            ),
            ToggleButtons(
              // 기본 레이아웃 색상 설정
              borderColor: Colors.blue, // 외곽 테두리
              borderWidth: 2, // 외곽 선 굵기
              borderRadius: BorderRadius.circular(5.0),// 외곽선 모서리 휘도
              // 선택된 버튼 색상 설정
              fillColor: Colors.grey,             // 선택된 버튼 바탕색상
              selectedBorderColor: Colors.yellow, // 선택된 버튼 외관 색상
              selectedColor: Colors.white,        // 선택된 버튼 아이콘 색상

              children: [
                Icon(Icons.keyboard),
                Icon(Icons.calendar_view_day),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < isSelectedMode.length; buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelectedMode[buttonIndex] = true;
                    } else {
                      isSelectedMode[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelectedMode,
            ),

            // TODO Unit 토글 버튼 위젯
            Container(
              child: Text('Unit'),
              padding: EdgeInsets.all(10.0),
            ),
            ToggleButtons(
              // 기본 레이아웃 색상 설정
              borderColor: Colors.blue, // 외곽 테두리
              borderWidth: 2, // 외곽 선 굵기
              borderRadius: BorderRadius.circular(5.0),
              // 선택된 버튼 색상 설정
              fillColor: Colors.grey,             // 선택된 버튼 바탕색상
              selectedBorderColor: Colors.yellow, // 선택된 버튼 외관 색상
              selectedColor: Colors.white,        // 선택된 버튼 아이콘 색상

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'mm',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'inch',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < isSelectedUnit.length; buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelectedUnit[buttonIndex] = true;
                    } else {
                      isSelectedUnit[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelectedUnit,
            ),
          ],
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // row 끼리 공평한 공간을 부여받음
    );
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: oringTopRow(),
    );
  }

}// _TopViewState 끝





