import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/domain/model/request_model/pending_history_orders.dart';
import 'package:riide/core/domain/model/response_model/join_an_order.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/feature/orders/join_order/bloc/join_order_bloc.dart';

class JoinOrderScreen extends StatelessWidget {
  final int orderId;
  final List<PendingAndHistoryModel> orders;
  final List<VertexModel> vertex;
  const JoinOrderScreen(
      {super.key,
      required this.orderId,
      required this.orders,
      required this.vertex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JoinOrderBloc(),
      child: BlocConsumer<JoinOrderBloc, JoinOrderState>(
        listener: (context, state) {
          if (state is SuccessJoinOrder) {
            print('okkkkkkkkkkkkkkkkkkk');
          }
        },
        builder: (context, state) {
          print(orders);
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 5),
                    child: Text(
                      'Pick The Order You Want To Join iT',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 3,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: MainColor().backgroundAppGreen),
                            child: ListTile(
                              onTap: () {
                                BlocProvider.of<JoinOrderBloc>(context).add(
                                  JoinToOrder(
                                    joinOrder: JoinOrderModel(
                                      orderId: orders[index].id,
                                      numOfPeople: 1,
                                    ),
                                  ),
                                );
                              },
                              leading: Icon(
                                Icons.directions_bus_filled_sharp,
                                color: MainColor().appGreen,
                              ),
                              title: Text(
                                BlocProvider.of<JoinOrderBloc>(context)
                                        .getVertexNameById(
                                      id: orders[index].destinationVerticesId,
                                      vertex: vertex,
                                    ) ??
                                    '',
                                style: TextStyle(
                                  color: MainColor().appGreen,
                                ),
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
        },
      ),
    );
  }
}
