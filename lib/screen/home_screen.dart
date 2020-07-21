import 'package:flutter/material.dart';
import 'package:oring_project_ex1/view_DimensionSearch/oring.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyTabbedPage();
  }
}



class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({ Key key }) : super(key: key);
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'O-ring'),
    Tab(text: 'X-ring'),
    Tab(text: 'Back-Up Ring '),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
//      resizeToAvoidBottomInset: false, // to Scaffold
//      appBar: AppBar(
//        bottom: TabBar(
//            labelColor: Colors.red,
//            controller: _tabController,
//            tabs: myTabs,
//            indicatorColor: Colors.blue
//        ),
//      ),

      appBar: TabBar(
          labelColor: Colors.yellow,
          controller: _tabController,
          tabs: myTabs,
          indicatorColor: Colors.yellow
      ),



      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {

          // 첫번째 oring 탭에서 화면세팅
          // 상단 탭 터치에 따라 다르게 보이면 화면

          if(tab.text == "O-ring"){
            return OringCalculator();
          }else{
            // 탭에서 String label 가져오기
            final String label = tab.text.toLowerCase();
            // 화면 출력
            return Center(
              child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 36, color: Colors.white),
              ),
            );
          }// 탭 터치에 따른 조건문 종료


        }).toList(),
      ),

    );
  }
}



class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

