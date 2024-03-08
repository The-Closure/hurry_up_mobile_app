// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_app/get_busLines/widget/get_busLine_widget.dart';
import 'package:hurry_app/mainWidget.dart';
import 'package:hurry_app/store_busLine/bloc/store_bus_line_bloc.dart';

TextEditingController name = TextEditingController();
TextEditingController price = TextEditingController();
// TextEditingController();
TextEditingController city_name = TextEditingController();

List<TextEditingController> lineName =
    List.generate(5, (index) => TextEditingController());
List<TextEditingController> longLine =
    List.generate(5, (index) => TextEditingController());
List<TextEditingController> lateName =
    List.generate(5, (index) => TextEditingController());

// List<String> liName = [
//   'باب توما',
//   'ساحة التحرير',
//   'اول شارع بغداد الراجع',
//   'اخر شارع بغداد',
//   'المزرعة'
// ];
// List<double> loLine = [36.1, 36.2, 36.3, 36.4, 36.5];
// List<double> laLine = [36.1, 36.2, 36.3, 36.4, 36.5];

class StoreBusLineWidget extends StatefulWidget {
  const StoreBusLineWidget({super.key});

  @override
  State<StoreBusLineWidget> createState() => _StoreBusLineWidgetState();
}

class _StoreBusLineWidgetState extends State<StoreBusLineWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => StoreBusLineBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocConsumer<StoreBusLineBloc, StoreBusLineState>(
            listener: (BuildContext context, StoreBusLineState state) {
              if (state is SuccessFetchingBusLine) {
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Bus Line Added'),
                  backgroundColor: Color.fromARGB(255, 13, 25, 21),
                ));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GetBusLinesWidget()));
                return print('SuccessFetchingBusLine');
              } else if (state is ErrorFetchingBusLine) {
                return print('ErrorFetchingData');
              } else if (state is LoadingDataa) {
                return print('LoadingData');
              } else {
                print('else state');
              }
            },
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  radius: 0.75,
                  center: Alignment(0, -0.75),
                  colors: const [Color.fromARGB(255, 16, 32, 26), Colors.black],
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainWidget(),
                                      ));
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.grey,
                                  size: 50,
                                )),
                            Icon(
                              Icons.bus_alert,
                              size: 105,
                            ),
                          ],
                        )),
                    Text(
                      'Add Bus Line',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Line Name',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          SizedBox(
                            width: screenWidth * 340 / screenWidth,
                            height: 38,
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              controller: name,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 0)),
                                  fillColor: Color.fromARGB(255, 21, 21, 21),
                                  filled: true,
                                  hintText: 'Enter line name',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(123, 158, 158, 158),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'price',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            SizedBox(
                              width: screenWidth * 145 / screenWidth,
                              height: 38,
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey),
                                keyboardType: TextInputType.number,
                                controller: price,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    fillColor: Color.fromARGB(255, 21, 21, 21),
                                    filled: true,
                                    hintText: 'Enter price',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(123, 158, 158, 158),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'city name',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            SizedBox(
                              width: screenWidth * 145 / screenWidth,
                              height: 38,
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey),
                                keyboardType: TextInputType.text,
                                controller: city_name,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    fillColor: Color.fromARGB(255, 21, 21, 21),
                                    filled: true,
                                    hintText: 'Enter city name',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(123, 158, 158, 158),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Bus Line',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'line name',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                            SizedBox(
                              width: screenWidth * 105 / screenWidth,
                              height: 38,
                              child: TextFormField(
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                keyboardType: TextInputType.text,
                                controller: lineName[0],
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    fillColor: Color.fromARGB(255, 21, 21, 21),
                                    filled: true,
                                    hintText: 'Enter Line Name',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(123, 158, 158, 158),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'longitude',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                            SizedBox(
                              width: screenWidth * 105 / screenWidth,
                              height: 38,
                              child: TextFormField(
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                keyboardType: TextInputType.number,
                                controller: longLine[0],
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    fillColor: Color.fromARGB(255, 21, 21, 21),
                                    filled: true,
                                    hintText: 'Enter longitude',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(123, 158, 158, 158),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'latitude',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                            SizedBox(
                              width: screenWidth * 105 / screenWidth,
                              height: 38,
                              child: TextFormField(
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                keyboardType: TextInputType.number,
                                controller: lateName[0],
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    fillColor: Color.fromARGB(255, 21, 21, 21),
                                    filled: true,
                                    hintText: 'Enter latitude',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(123, 158, 158, 158),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'line name',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              SizedBox(
                                width: screenWidth * 105 / screenWidth,
                                height: 38,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  keyboardType: TextInputType.text,
                                  controller: lineName[1],
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      fillColor:
                                          Color.fromARGB(255, 21, 21, 21),
                                      filled: true,
                                      hintText: 'Enter Line Name',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 158, 158, 158),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'longitude',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              SizedBox(
                                width: screenWidth * 105 / screenWidth,
                                height: 38,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  keyboardType: TextInputType.number,
                                  controller: longLine[1],
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      fillColor:
                                          Color.fromARGB(255, 21, 21, 21),
                                      filled: true,
                                      hintText: 'Enter longitude',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 158, 158, 158),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'latitude',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              SizedBox(
                                width: screenWidth * 105 / screenWidth,
                                height: 38,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  keyboardType: TextInputType.number,
                                  controller: lateName[1],
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      fillColor:
                                          Color.fromARGB(255, 21, 21, 21),
                                      filled: true,
                                      hintText: 'Enter latitude',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 158, 158, 158),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'line name',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              SizedBox(
                                width: screenWidth * 105 / screenWidth,
                                height: 38,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  keyboardType: TextInputType.text,
                                  controller: lineName[2],
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      fillColor:
                                          Color.fromARGB(255, 21, 21, 21),
                                      filled: true,
                                      hintText: 'Enter Line Name',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 158, 158, 158),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'longitude',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              SizedBox(
                                width: screenWidth * 105 / screenWidth,
                                height: 38,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  keyboardType: TextInputType.number,
                                  controller: longLine[2],
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      fillColor:
                                          Color.fromARGB(255, 21, 21, 21),
                                      filled: true,
                                      hintText: 'Enter longitude',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 158, 158, 158),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'latitude',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              SizedBox(
                                width: screenWidth * 105 / screenWidth,
                                height: 38,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  keyboardType: TextInputType.number,
                                  controller: lateName[2],
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      fillColor:
                                          Color.fromARGB(255, 21, 21, 21),
                                      filled: true,
                                      hintText: 'Enter latitude',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 158, 158, 158),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'line name',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                            SizedBox(
                              width: screenWidth * 105 / screenWidth,
                              height: 38,
                              child: TextFormField(
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                keyboardType: TextInputType.text,
                                controller: lineName[3],
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    fillColor: Color.fromARGB(255, 21, 21, 21),
                                    filled: true,
                                    hintText: 'Enter Line Name',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(123, 158, 158, 158),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'longitude',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                            SizedBox(
                              width: screenWidth * 105 / screenWidth,
                              height: 38,
                              child: TextFormField(
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                keyboardType: TextInputType.number,
                                controller: longLine[3],
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    fillColor: Color.fromARGB(255, 21, 21, 21),
                                    filled: true,
                                    hintText: 'Enter longitude',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(123, 158, 158, 158),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'latitude',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                            SizedBox(
                              width: screenWidth * 105 / screenWidth,
                              height: 38,
                              child: TextFormField(
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                keyboardType: TextInputType.number,
                                controller: lateName[3],
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 0)),
                                    fillColor: Color.fromARGB(255, 21, 21, 21),
                                    filled: true,
                                    hintText: 'Enter latitude',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(123, 158, 158, 158),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'line name',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              SizedBox(
                                width: screenWidth * 105 / screenWidth,
                                height: 38,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  keyboardType: TextInputType.text,
                                  controller: lineName[4],
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      fillColor:
                                          Color.fromARGB(255, 21, 21, 21),
                                      filled: true,
                                      hintText: 'Enter Line Name',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 158, 158, 158),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'longitude',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              SizedBox(
                                width: screenWidth * 105 / screenWidth,
                                height: 38,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  keyboardType: TextInputType.number,
                                  controller: longLine[4],
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      fillColor:
                                          Color.fromARGB(255, 21, 21, 21),
                                      filled: true,
                                      hintText: 'Enter longitude',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 158, 158, 158),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'latitude',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              SizedBox(
                                width: screenWidth * 105 / screenWidth,
                                height: 38,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  keyboardType: TextInputType.number,
                                  controller: lateName[4],
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 0)),
                                      fillColor:
                                          Color.fromARGB(255, 21, 21, 21),
                                      filled: true,
                                      hintText: 'Enter latitude',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 158, 158, 158),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: screenWidth * 340 / screenWidth,
                        child: FloatingActionButton(
                          heroTag: 'store',
                          backgroundColor: Color(0xff4CE5B1),
                          onPressed: () {
                            // List<Map<String, dynamic>> data = [
                            //   {'name': lineName[0].text},
                            //   {'longitude': longLine[0].text},
                            //   {'latitude': lateName[0].text},
                            //   {'name': lineName[1].text},
                            //   {'longitude': longLine[1].text},
                            //   {'latitude': lateName[1].text},
                            //   {'name': lineName[2].text},
                            //   {'longitude': longLine[2].text},
                            //   {'latitude': lateName[2].text},
                            //   {'name': lineName[3].text},
                            //   {'longitude': longLine[3].text},
                            //   {'latitude': lateName[3].text},
                            // ];
                            // List<Map<String, dynamic>> data = [
                            //   {
                            //     'name': 'liName[0]',
                            //     "longitude": /*loLine[0]*/ 1,
                            //     "latitude": /*laLine[0]*/ 2,
                            //   },
                            //   {
                            //     'name': 'liName[1]',
                            //     "longitude": /*loLine[1]*/ 1,
                            //     "latitude": /*laLine[1]*/ 2,
                            //   },
                            //   {
                            //     'name': 'liName[2]',
                            //     "longitude": /*loLine[2]*/ 1,
                            //     "latitude": /*laLine[2]*/ 2,
                            //   },
                            //   {
                            //     'name': 'liName[3]',
                            //     "longitude": /*loLine[3]*/ 1,
                            //     "latitude": /*laLine[3]*/ 2,
                            //   },
                            //   {
                            //     'name': 'liName[4]',
                            //     "longitude": /*loLine[4]*/ 1,
                            //     "latitude": /*laLine[4]*/ 2,
                            //   },
                            // ];

                            // String pr = int price.text;
                            var deta = {
                              "name": name.text,
                              "price": int.parse(price.text),
                              "city_name": city_name.text,
                              "bus_line": [
                                {
                                  "name": lineName[0].text,
                                  "longitude": longLine[0].text,
                                  "latitude": lateName[0].text
                                },
                                {
                                  "name": lineName[1].text,
                                  "longitude": longLine[1].text,
                                  "latitude": lateName[1].text
                                },
                                {
                                  "name": lineName[2].text,
                                  "longitude": longLine[2].text,
                                  "latitude": lateName[2].text
                                },
                                {
                                  "name": lineName[3].text,
                                  "longitude": longLine[3].text,
                                  "latitude": lateName[3].text
                                },
                                {
                                  "name": lineName[4].text,
                                  "longitude": longLine[4].text,
                                  "latitude": lateName[4].text
                                }
                              ]
                            };
                            // StoreBusLineModel storeBusLineModel =
                            //     StoreBusLineModel(
                            //         name: 'name.text',
                            //         price: /*int.parse(price.text)*/ 105,
                            //         city_name: 'city_name.text',
                            //         bus_line: []);
                            // String omar = jsonEncode({
                            //   "name": name,
                            //   "price": price,
                            //   "city_name": city_name,
                            //   "bus_line": [
                            //     {
                            //       "name": lineName[0],
                            //       "longitude": longLine[0],
                            //       "latitude": lateName[0]
                            //     },
                            //     {
                            //       "name": lineName[1],
                            //       "longitude": longLine[1],
                            //       "latitude": lateName[1]
                            //     },
                            //     {
                            //       "name": lineName[2],
                            //       "longitude": longLine[2],
                            //       "latitude": lateName[2]
                            //     },
                            //     {
                            //       "name": lineName[3],
                            //       "longitude": longLine[3],
                            //       "latitude": lateName[3]
                            //     },
                            //     {
                            //       "name": lineName[4],
                            //       "longitude": longLine[4],
                            //       "latitude": lateName[4]
                            //     }
                            //   ]
                            // });
                            context
                                .read<StoreBusLineBloc>()
                                .add(PostBusLineData(deta: deta));
                          },
                          child: Text(
                            'add line',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

var gendertype = ['Male', 'Female'];
