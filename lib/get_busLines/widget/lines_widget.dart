// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hurry_app/get_busLines/service/getBusLinesService.dart';
import 'package:hurry_app/get_busLines/widget/get_busLine_widget.dart';

class LinesWidget extends StatelessWidget {
  final int index;

  const LinesWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> map = getBusLinesModelResponse[index].bus_line;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bus Line Details',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 10, 26, 20),
          // title: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context,
          //         MaterialPageRoute(builder: (context) => GetBusLinesWidget()));
          //   },
          //   icon: Icon(Icons.arrow_back_ios_new),
          // ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
            radius: 0.75,
            center: Alignment(0, -0.75),
            colors: const [Color.fromARGB(255, 16, 32, 26), Colors.black],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: SizedBox(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(getBusLinesModelResponse[index].id.toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 25)),
                      Text('    '),
                      Text(
                        getBusLinesModelResponse[index].name,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: SizedBox(
                  child: Row(
                    children: [
                      Text(
                        'city name : ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        getBusLinesModelResponse[index].city_name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                subtitle: SizedBox(
                  child: Row(
                    children: [
                      Text(
                        'price : ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        getBusLinesModelResponse[index].price.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child:
                    Text('Bus Line : ', style: TextStyle(color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: SizedBox(
                  width: screenWidth,
                  height: 450,
                  child: ListView.builder(
                    itemCount: map.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(map[index]['name'],
                            style: TextStyle(
                                color: Color.fromARGB(173, 255, 255, 255),
                                fontSize: 15)),
                        subtitle: Column(
                          children: [
                            Text(map[index]['longitude'].toString()),
                            Text(map[index]['latitude'].toString())
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Row(
                  children: [
                    Text('created at : ', style: TextStyle(color: Colors.grey)),
                    Text(
                      getBusLinesModelResponse[index].created_at,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Row(
                  children: [
                    Text('updated at : ', style: TextStyle(color: Colors.grey)),
                    Text(
                      getBusLinesModelResponse[index].updated_at,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
