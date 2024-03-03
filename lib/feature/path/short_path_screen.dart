import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/domain/model/response_model/shortest_path.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/feature/path/bloc/shortest_path_bloc.dart';
import 'package:riide/feature/path/result_path_screen.dart';
import 'package:riide/feature/shares/container.dart';
import 'package:riide/feature/shares/dialog.dart';
import 'package:super_rich_text/super_rich_text.dart';

class ShortPathScreen extends StatelessWidget {
  final List<VertexModel> vertex;
  const ShortPathScreen({super.key, required this.vertex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShortestPathBloc(),
      child: BlocConsumer<ShortestPathBloc, ShortestPathState>(
        listener: (context, state) {
          if (state is SuccessToCreatePath) {
            final vertexName = BlocProvider.of<ShortestPathBloc>(context)
                .getVertexResult(vertex: vertex, shortPath: state.shortestPath);
            final vertexid = BlocProvider.of<ShortestPathBloc>(context)
                .getVertexId(vertex: vertex, shortPath: state.shortestPath);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPathScreen(
                    result: vertexName,
                    node: vertexid,
                  ),
                ));
          }
          if (state is ErrorInCreatePath || state is ExcptionInCreatePath) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 5),
              content: Text('Check Your Data'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<ShortestPathBloc>(context);
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
                      text: 'rlliillde\n Shortest Path',
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
                                    'Select Your Destination',
                                    style:
                                        TextStyle(color: MainColor().appGreen),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: MainContainer(
                                containerText: 'Show The Shortest Path',
                                onTap: () {
                                  print(vertex[bloc.selectedSourceIndex!].name);
                                  BlocProvider.of<ShortestPathBloc>(context)
                                      .add(
                                    CreateNewPath(
                                      path: ShortestPathModel(
                                          source_id:
                                              '${vertex[bloc.selectedSourceIndex!].id}',
                                          target_id:
                                              '${vertex[bloc.selectedTargetIndex!].id}'),
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
