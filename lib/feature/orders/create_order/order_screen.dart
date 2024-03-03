import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/domain/model/response_model/complete_the_order.dart';
import 'package:riide/core/domain/model/response_model/delete_order.dart';
import 'package:riide/core/domain/model/response_model/orders.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/feature/delete/delete_order/bloc/delete_order_bloc.dart';
import 'package:riide/feature/orders/complete_order/bloc/complete_order_bloc.dart';
import 'package:riide/feature/orders/create_order/bloc/create_order_bloc.dart';
import 'package:riide/feature/shares/container.dart';
import 'package:riide/feature/shares/dialog.dart';
import 'package:super_rich_text/super_rich_text.dart';

class OrderScreen extends StatelessWidget {
  final List<VertexModel> vertex;
  const OrderScreen({super.key, required this.vertex});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateOrderBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteOrderBloc(),
        ),
        BlocProvider(
          create: (context) => CompleteOrderBloc(),
        ),
      ],
      child: BlocConsumer<CreateOrderBloc, CreateOrderState>(
        listener: (context, state) {
          if (state is SuccessInCreateOrder) {
            final blocComplete = BlocProvider.of<CompleteOrderBloc>(context);
            final blocDelete = BlocProvider.of<DeleteOrderBloc>(context);
            final bloc = BlocProvider.of<CreateOrderBloc>(context);

            showDialog(
              // barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: MainColor().appPrimerySolidBlack,
                content: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Order Data"),
                      Text(
                        "destination order is ${bloc.getVertexNameById(
                              id: state.order.destinationVerticesId,
                              vertex: vertex,
                            ) ?? ''}",
                        style: TextStyle(color: MainColor().appGreen),
                      ),
                      Text(
                        "Location order is ${bloc.getVertexNameById(
                              id: state.order.sourceVerticesId,
                              vertex: vertex,
                            ) ?? ''}",
                        style: TextStyle(color: MainColor().appGreen),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              blocComplete.add(
                                CompleteTheOrder(
                                  complete:
                                      CompleteOrderModel(id: state.order.id),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Commplete Order",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              blocDelete.add(
                                CancelOrder(
                                  theOrder:
                                      DeleteOrderModel(id: state.order.id),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Delete Order",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<CreateOrderBloc>(context);
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15,
                    ),
                    child: SuperRichText(
                      text: 'rlliillde Order',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                      ),
                      othersMarkers: [
                        MarkerText(
                          marker: 'll',
                          style: TextStyle(
                            color: MainColor().appGreen,
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: ShapeDecoration(
                        color: MainColor().appSeconderySolidBlack,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 26,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    dialog(
                                      context: context,
                                      vertex: vertex,
                                      itemBuilder: (context, index) =>
                                          TextButton(
                                        onPressed: () {
                                          bloc.selectedSourceIndex = index;
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          vertex[index].name,
                                          style: TextStyle(
                                              color: MainColor().appGreen),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Where are you now?',
                                    style:
                                        TextStyle(color: MainColor().appGreen),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    dialog(
                                      context: context,
                                      vertex: vertex,
                                      itemBuilder: (context, index) =>
                                          TextButton(
                                        onPressed: () {
                                          bloc.selectedTargetIndex = index;
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          vertex[index].name,
                                          style: TextStyle(
                                              color: MainColor().appGreen),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Where are you going?',
                                    style:
                                        TextStyle(color: MainColor().appGreen),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: MainContainer(
                                containerText: 'Create New Order',
                                onTap: () {
                                  bloc.add(
                                    CreateNewOrder(
                                      order: OrdersModel(
                                          top_passenger_count: 4,
                                          current_passenger_count: 1,
                                          destination_vertices_id:
                                              vertex[bloc.selectedTargetIndex!]
                                                  .id,
                                          is_hurry: true,
                                          genders: "both",
                                          source_vertices_id:
                                              vertex[bloc.selectedSourceIndex!]
                                                  .id),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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

