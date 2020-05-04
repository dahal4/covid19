import 'package:flutter/material.dart';

class NepalPanel extends StatelessWidget {
  final Map nepalData;
  const NepalPanel({Key key, this.nepalData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.black45,
            textColor: Colors.black,
            count: nepalData['cases'].toString(),
          ),
          StatusPanel(
            title: 'TODAY CASES',
            panelColor: Colors.black45,
            textColor: Colors.black,
            count: nepalData['todayCases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: nepalData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.greenAccent[100],
            textColor: Colors.greenAccent[700],
            count: nepalData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.red[100],
            textColor: Colors.red[900],
            count: nepalData['deaths'].toString(),
          ),
          StatusPanel(
            title: 'TODAY DEATHS',
            panelColor: Colors.red[100],
            textColor: Colors.red[900],
            count: nepalData['todayDeaths'].toString(),
          ),
          StatusPanel(
            title: 'CRITICAL',
            panelColor: Colors.orange[100],
            textColor: Colors.orange[900],
            count: nepalData['critical'].toString(),
          ),
          StatusPanel(
            title: 'TOTAL TESTS',
            panelColor: Colors.purple[100],
            textColor: Colors.purple[900],
            count: nepalData['tests'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: panelColor,
      ),
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}
