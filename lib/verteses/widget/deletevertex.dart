import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_app/domain/model/delete_vertex_model.dart';
import 'package:hurry_app/verteses/bloc/verteses_bloc.dart';
import 'package:hurry_app/verteses/service/vertesesService.dart';
import 'package:hurry_app/verteses/widget/vertexdetails.dart';

class VertexWidget extends StatelessWidget {
  const VertexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int ind = 0;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VertesesBloc(),
        ),
        BlocProvider(create: (context) => VertesesBloc())
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Verteses',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color.fromARGB(255, 10, 26, 20),
          ),
          body: Container(
            width: screenWidth,
            decoration: const BoxDecoration(
                gradient: RadialGradient(
              radius: 0.75,
              center: Alignment(0, -0.75),
              colors: [Color.fromARGB(255, 16, 32, 26), Colors.black],
            )),
            child: Column(
              children: [
                BlocConsumer<VertesesBloc, VertesesState>(
                  listener: (context, state) {
                    if (state is SuccessFetchingVerteses) {
                      return print('Success f');
                    } else if (state is LoadingVerteses) {
                      return print('Loading f');
                    } else if (state is ErrorFetchingVerteses) {
                      return print('Error f');
                    } else {
                      return print('Else f');
                    }
                  },
                  builder: (BuildContext context, VertesesState state) {
                    return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<VertesesBloc>(context)
                              .add(GetDataVerteses());
                          // context.read<VertesesBloc>().add(GetDataVerteses());
                          print(resultModel);
                        },
                        child: Icon(Icons.abc));
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.8,
                  width: screenWidth,
                  child: BlocConsumer<VertesesBloc, VertesesState>(
                    listener: (context, state) {
                      if (state is SuccessDeletingVertex) {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('Vertex Deleted'),
                          backgroundColor: Color.fromARGB(255, 13, 25, 21),
                        ));
                        return print('Success delete');
                      } else if (state is LoadingVerteses) {
                        return print('Loading delete');
                      } else if (state is ErrorFetchingVerteses) {
                        return print('Error delete');
                      } else {
                        return print('Else delete');
                      }
                    },
                    builder: (context, state) {
                      return ListView.builder(
                          itemCount: resultModel.length,
                          itemBuilder: (context, index) {
                            ind = index;
                            return ListTile(
                                onTap: () {
                                  DeleteVertexModel deleteVertexModel =
                                      DeleteVertexModel(
                                          id: resultModel[index].id);

                                  BlocProvider.of<VertesesBloc>(context).add(
                                      DeleteVertex(
                                          intIndex: deleteVertexModel));

                                  // context
                                  //     .read<VertesesBloc>()
                                  //     .add(DeletVertex(intIndex: ind));
                                  // context
                                  //     .read<VertesesBloc>()
                                  //     .add(GetDataVerteses());
                                },
                                onLongPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VertexDetailsWidget(
                                        index: ind
                                      ),
                                    ),
                                  );
                                },
                                title: Text(
                                  resultModel[index].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle:
                                    Text(resultModel[index].id.toString()),
                                trailing: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 104, 41, 36),
                                ));
                          });
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
