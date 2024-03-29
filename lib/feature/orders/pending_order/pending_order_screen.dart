import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/feature/orders/join_order/join_order_screen.dart';
import 'package:riide/feature/orders/pending_order/bloc/pending_order_bloc.dart';
import 'package:riide/feature/shares/container.dart';
import 'package:riide/feature/shares/dialog.dart';
import 'package:super_rich_text/super_rich_text.dart';

class PendingOrderScreen extends StatelessWidget {
  final List<VertexModel> vertex;
  const PendingOrderScreen({super.key, required this.vertex});

  @override
  Widget build(BuildContext context) {
    late int orderIdSelact;
    return BlocProvider(
      create: (context) => PendingOrderBloc(),
      child: BlocConsumer<PendingOrderBloc, PendingOrderState>(
        listener: (context, state) {
          if (state is SuccessPendingOrder) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JoinOrderScreen(
                  orderId: orderIdSelact,
                  orders: state.pendingOrder,
                  vertex: vertex,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<PendingOrderBloc>(context);
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
                      text: 'rlliillde\n Join Order',
                      textAlign: TextAlign.center,
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
                                    'Pick Your Location',
                                    style:
                                        TextStyle(color: MainColor().appGreen),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: MainContainer(
                                containerText: 'Show Me The Orders',
                                onTap: () {
                                  BlocProvider.of<PendingOrderBloc>(context)
                                      .add(
                                    Pending(
                                      sourceId:
                                          vertex[bloc.selectedSourceIndex!]
                                              .id
                                              .toString(),
                                    ),
                                  );
                                  orderIdSelact =
                                      vertex[bloc.selectedSourceIndex!].id;
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

