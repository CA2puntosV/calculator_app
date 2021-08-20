import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base_adapter.dart';

class CalculatorAdapter extends BaseAdapter {
  CalculatorAdapter({
    required this.getTextToDisplay,
    required this.getHistory,
    required this.buildRow,
    required this.buildWideRow,
  });

  final ValueGetter<String?> getTextToDisplay;
  final ValueGetter<String?> getHistory;
  final Widget Function(int index) buildRow;
  final Widget Function(int index) buildWideRow;

  @override
  Widget buildLandscape(BuildContext context) {
    List<Widget> items = [
      buildWideRow(0),
      buildWideRow(1),
      buildWideRow(2),
      buildWideRow(3),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF4c565e),
          ),
          child: Column(
            children: <Widget>[
              _landscape(),
              Container(
                child: Column(
                  children: items,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildPortrait(BuildContext context) {
    List<Widget> items = [
      buildRow(0),
      buildRow(1),
      buildRow(2),
      buildRow(3),
      buildRow(4),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 25.0,
              fontFamily: 'DoHyeon',
            ),
          ),
          backgroundColor: Color(0xFF4c565e),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF4c565e),
          ),
          child: Column(
            children: <Widget>[
              _portrait(),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: items,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _portrait() => Container(
        margin: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            historyCont(),
            mainTextCont(),
          ],
        ),
      );

  Widget _landscape() => Container(
        margin: EdgeInsets.only(
          right: 20.0,
          left: 20.0,
          top: 40.0,
        ),
        child: Container(
          // width: MediaQuery.of(context).size.width,
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              mainTextCont(),
            ],
          ),
        ),
      );

  Container mainTextCont() {
    return Container(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(
          top: 5.0,
          right: 12.0,
          bottom: 12.0,
          left: 12.0,
        ),
        child: Text(
          getTextToDisplay() ?? '',
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: 48.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Container historyCont() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Text(
          getHistory() ?? '',
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: 24.0,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
