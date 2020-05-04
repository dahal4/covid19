import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 155.0,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Card(
              elevation: 20.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          elevation: 10.0,
                          child: Column(
                            children: <Widget>[
                              Text(
                                suggestionList[index]['country'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Image.network(
                                suggestionList[index]['countryInfo']['flag'],
                                height: 50,
                                width: 60,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    child: Column(
                      children: <Widget>[
                        Text(
                            'CONFIRMED:' +
                                suggestionList[index]['cases'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left),
                        Text(
                            'ACTIVE:' +
                                suggestionList[index]['active'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]),
                            textAlign: TextAlign.left),
                        Text(
                            'RECOVERED:' +
                                suggestionList[index]['recovered'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent[700]),
                            textAlign: TextAlign.left),
                        Text(
                          'DEATHS:' +
                              suggestionList[index]['deaths'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                            'TODAY CASES:' +
                                suggestionList[index]['todayCases'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.left),
                        Text(
                          'TODAY DEATH:' +
                              suggestionList[index]['todayDeaths'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                            'CRITICAL:' +
                                suggestionList[index]['critical'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[900]),
                            textAlign: TextAlign.left),
                        Text(
                            'TOTAL TEST:' +
                                suggestionList[index]['tests'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple[900]),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
