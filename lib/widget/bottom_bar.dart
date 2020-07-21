import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.black,
      child: Container(
        height: 50,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,



          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.trip_origin,
                size: 18
              ),
              child: Text(
                'Dimension Search',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                  Icons.space_bar,
                  size: 18
              ),
              child: Text(
                'O-ring Housing',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                  Icons.info_outline,
                  size: 18
              ),
              child: Text(
                'About Us',
                style: TextStyle(fontSize: 9),
              ),
            ),
          ],


        ),

      ),
    );
  }


}