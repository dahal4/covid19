import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;
  const WorldwidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
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
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'TODAY CASES',
            panelColor: Colors.black45,
            textColor: Colors.black,
            count: worldData['todayCases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.greenAccent[100],
            textColor: Colors.greenAccent[700],
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.red[100],
            textColor: Colors.red[900],
            count: worldData['deaths'].toString(),
          ),
          StatusPanel(
            title: 'TODAY DEATHS',
            panelColor: Colors.red[100],
            textColor: Colors.red[900],
            count: worldData['todayDeaths'].toString(),
          ),
          StatusPanel(
            title: 'CRITICAL',
            panelColor: Colors.orange[100],
            textColor: Colors.orange[900],
            count: worldData['critical'].toString(),
          ),
          StatusPanel(
            title: 'TOTAL TESTS',
            panelColor: Colors.purple[100],
            textColor: Colors.purple[900],
            count: worldData['tests'].toString(),
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
        borderRadius: BorderRadius.circular(20),
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
