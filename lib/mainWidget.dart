import 'package:flutter/material.dart';
import 'package:hurry_app/get_busLines/widget/get_busLine_widget.dart';
import 'package:hurry_app/store_busLine/widgets/store_busline_widget.dart';
import 'package:hurry_app/verteses/widget/deletevertex.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          radius: 0.75,
          center: Alignment(0, 0),
          colors: [Color.fromARGB(255, 24, 54, 43), Colors.black],
        )),
        child: Column(
          children: [
            Text(
              'Hurry App as Admin',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.42,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        gradient: RadialGradient(
                          radius: 1.75,
                          center: Alignment(1, 1),
                          colors: [
                            Color.fromARGB(255, 32, 99, 74),
                            Colors.black
                          ],
                        )),
                    child: FloatingActionButton(
                        // elevation: 0.01,
                        heroTag: 've',
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VertexWidget(),
                            ),
                          );
                        },
                        child: Container(
                          child: Center(
                              child: Text('Vertex functiions',
                                  style: TextStyle(color: Colors.grey))),
                        )),
                  ),
                ),
                Container(
                  width: screenWidth * 0.43,
                  height: screenHeight * 0.42,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      gradient: RadialGradient(
                        radius: 1.75,
                        center: Alignment(-1, 1),
                        colors: [Color.fromARGB(255, 32, 99, 74), Colors.black],
                      )),
                  child: FloatingActionButton(
                      // elevation: 0.01,
                      heroTag: 'vertex',
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VertexWidget(),
                          ),
                        );
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          'Vertex functions',
                          style: TextStyle(color: Colors.grey),
                        )),
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.42,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        gradient: RadialGradient(
                          radius: 1.75,
                          center: Alignment(1, -1),
                          colors: [
                            Color.fromARGB(255, 32, 99, 74),
                            Colors.black
                          ],
                        )),
                    child: FloatingActionButton(
                        heroTag: 'getBus',
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetBusLinesWidget(),
                            ),
                          );
                        },
                        child: Container(
                          child: Center(
                              child: Text('Get Buslines',
                                  style: TextStyle(color: Colors.grey))),
                        )),
                  ),
                ),
                Container(
                  width: screenWidth * 0.43,
                  height: screenHeight * 0.42,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      gradient: RadialGradient(
                        radius: 1.75,
                        center: Alignment(-1, -1),
                        colors: [Color.fromARGB(255, 32, 99, 74), Colors.black],
                      )),
                  child: FloatingActionButton(
                      // elevation: 0.01,
                      heroTag: 'store',
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoreBusLineWidget(),
                          ),
                        );
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          'Store Busline',
                          style: TextStyle(color: Colors.grey),
                        )),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
