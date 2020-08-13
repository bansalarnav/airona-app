import 'package:flutter/material.dart';
import 'package:xino_hackathon/widgets/flight.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

getData() async {
  var res = await http.get('http://xino-hack-api.herokuapp.com/flights');
  var data = json.decode(res.body);
  return data;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 20),
                    sliver: SliverAppBar(
                      floating: true,
                      expandedHeight: 200,
                      snap: true,
                      iconTheme: IconThemeData(
                        color: Colors.white,
                        size: 50,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          'Airona',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                        centerTitle: true,
                        background: Image.asset(
                          'images/appbar.jpg',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      centerTitle: true,
                      backgroundColor: Color(0xffffa36c),
                    ),
                  ),
                  Container(
                    child: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  snapshot.data[index]["name"] == 'Air Asia'
                                      ? Image.network(
                                          'https://i0.wp.com/bangkokmusiccity.com/wp-content/uploads/2019/10/AirAsia-Logo-PNG.png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                        )
                                      : snapshot.data[index]["name"] == 'Qatar' ? Image.asset('images/qatar.png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6): Image.asset('images/thai.png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 26,
                                  ),
                                  Text(
                                    snapshot.data[index]["name"],
                                    style: TextStyle(
                                        fontSize: 38,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  itemBuilder: (context, index2) {
                                    print('Delhi');
                                    return FlightCard(
                                        snapshot.data[index]["flights"][index2]
                                            ["to"],
                                        snapshot.data[index]["flights"][index2]
                                            ["from"],
                                        snapshot.data[index]["flights"][index2]
                                            ["duration"],
                                        snapshot.data[index]["flights"][index2]
                                            ["time"],
                                        snapshot.data[index]["flights"][index2]
                                            ["date"],
                                        snapshot.data[index]["flights"][index2]
                                            ["code"],
                                        snapshot.data[index]["flights"][index2]
                                            ["crewCode"]);
                                  },
                                  itemCount:
                                      snapshot.data[index]["flights"].length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ],
                          ),
                        );
                      }, childCount: snapshot.data.length),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffa36c)),),
              ),
            );
          }
        },
      ),
    );
  }
}
