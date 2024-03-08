import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_app/get_busLines/bloc/get_bus_lines_bloc.dart';
import 'package:hurry_app/get_busLines/service/getBusLinesService.dart';
import 'package:hurry_app/get_busLines/widget/lines_widget.dart';

class GetBusLinesWidget extends StatelessWidget {
  const GetBusLinesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => GetBusLinesBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Buslines Details',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color.fromARGB(255, 10, 26, 20),
          ),
          body: BlocConsumer<GetBusLinesBloc, GetBusLinesState>(
            listener: (context, state) {
              if (state is SuccessFetchingBusLinesData) {
                return print('SuccessFetchingSiginInData');
              } else if (state is ErrorFetchingBusLinesData) {
                return print('ErrorFetchingData');
              } else if (state is LoadingBusLinesData) {
                return print('LoadingData');
              } else {
                print('else state');
              }
            },
            builder: (context, state) {
              return Container(
                height: screenHeight,
                width: screenWidth,
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  radius: 0.75,
                  center: Alignment(0, -0.75),
                  colors: [Color.fromARGB(255, 16, 32, 26), Colors.black],
                )),
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth,
                      height: screenHeight * 80 / 100,
                      child: ListView.builder(
                          itemCount: getBusLinesModelResponse.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                getBusLinesModelResponse[index].name,
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LinesWidget(index: index)));
                              },
                            );
                          }),
                    ),
                    Container(
                        height: screenHeight * 0.075,
                        width: screenWidth * 0.9,
                        child: FloatingActionButton(
                            heroTag: 'getBus',
                            backgroundColor: Color.fromARGB(255, 17, 157, 110),
                            onPressed: () {
                              context
                                  .read<GetBusLinesBloc>()
                                  .add(GetBusLinesData());
                            },
                            child: Icon(Icons.abc))),
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
