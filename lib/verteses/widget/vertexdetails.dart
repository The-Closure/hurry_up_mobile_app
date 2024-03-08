// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hurry_app/get_busLines/service/getBusLinesService.dart';
import 'package:hurry_app/get_busLines/widget/get_busLine_widget.dart';
import 'package:hurry_app/verteses/service/vertesesService.dart';

class VertexDetailsWidget extends StatelessWidget {
  final int index;

  const VertexDetailsWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Vertex Details',
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
                      Text(resultModel[index].id.toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 25)),
                      Text('    '),
                      Text(
                        resultModel[index].name,
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
                        'Bus Line id : ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        resultModel[index].bus_line_id.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                subtitle: SizedBox(
                  child: Row(
                    children: [
                      Text(
                        'Is Busy : ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        resultModel[index].is_busy.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0, bottom: 20),
                child: Row(
                  children: [
                    Text('feedback count : ',
                        style: TextStyle(color: Colors.grey)),
                    Text(resultModel[index].feedback_count.toString(),
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Row(
                  children: [
                    Text(
                      'latitude : ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      resultModel[index].latitude,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      'longitude : ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      resultModel[index].longitude,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 50.0),
              //   child: SizedBox(
              //     width: screenWidth,
              //     height: 450,
              //     child: ListView.builder(
              //       itemCount: resultModel.length,
              //       itemBuilder: (context, index) {
              //         return ListTile(
              //           title: Text(resultModel[index].name,
              //               style: TextStyle(
              //                   color: Color.fromARGB(173, 255, 255, 255),
              //                   fontSize: 15)),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Row(
                  children: [
                    Text('created at : ', style: TextStyle(color: Colors.grey)),
                    Text(
                      resultModel[index].created_at,
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
                      resultModel[index].updated_at,
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
