import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/feature/history/bloc/history_bloc.dart';

class HistoryScreen extends StatelessWidget {
  final List<VertexModel> vertex;
  const HistoryScreen({super.key, required this.vertex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc()..add(GetAllHistory()),
      child: BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SuccessGetHistory) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated,
                  colors: [
                    Color.fromARGB(255, 7, 25, 19),
                    Colors.black,
                  ],
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 4),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                        itemCount: state.history.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: MainColor().backgroundAppGreen),
                              child: ListTile(
                                leading: Icon(
                                  Icons.map_outlined,
                                  color: MainColor().appGreen,
                                ),
                                title: Text(
                                  "Order Complet in ${state.history[index].updatedAt.year}:${state.history[index].updatedAt.month}:${state.history[index].updatedAt.day} ",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  "Time is ${state.history[index].updatedAt.hour}:${state.history[index].updatedAt.minute} ",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ErrorInGettingHistory) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated,
                  colors: [
                    Color.fromARGB(255, 7, 25, 19),
                    Colors.black,
                  ],
                ),
              ),
              child: const Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Text("Try again later"),
                ),
              ),
            );
          } else if (state is ExcptionInGettingHistory) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated,
                  colors: [
                    Color.fromARGB(255, 7, 25, 19),
                    Colors.black,
                  ],
                ),
              ),
              child: const Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Text("Check Your Internet"),
                ),
              ),
            );
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated,
                  colors: [
                    Color.fromARGB(255, 7, 25, 19),
                    Colors.black,
                  ],
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: CircularProgressIndicator(
                    color: MainColor().appGreen,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
