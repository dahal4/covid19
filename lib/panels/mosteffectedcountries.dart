import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Wrap(
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      Image.network(
                        countryData[index]['countryInfo']['flag'],
                        height: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        countryData[index]['country'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Wrap(direction: Axis.vertical, children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        MostAffectedStatusPanel(
                          title: 'CONFIRMED',
                          panelColor: Colors.orange[100],
                          textColor: Colors.orange[900],
                          count: countryData[index]['cases'].toString(),
                        ),
                        MostAffectedStatusPanel(
                          title: 'DEATHS',
                          panelColor: Colors.red[100],
                          textColor: Colors.red[900],
                          count: countryData[index]['deaths'].toString(),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class MostAffectedStatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const MostAffectedStatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69.0,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        color: panelColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}
