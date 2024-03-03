import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/domain/model/response_model/feedback.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/feature/feedback/bloc/feedback_bloc.dart';

class ResultPathScreen extends StatelessWidget {
  final List<String> result;
  final List<int> node;
  const ResultPathScreen({super.key, required this.result, required this.node});

  @override
  Widget build(BuildContext context) {
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
      child: BlocProvider(
        create: (context) => FeedbackBloc(),
        child: BlocConsumer<FeedbackBloc, FeedbackState>(
          listener: (context, state) {
            if (state is SuccessFeedback) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 7),
                  content: Text('we take your feedback'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
            if (state is ErrorFeedback || state is ExcptionFeedback) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 7),
                  content: Text('please Try again'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 5,
                  ),
                  Text(
                    'You Need To take The Road',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Presse The Vertex That You Want To Give It Feedback',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 30,
                      color: MainColor().appGreen,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: MainColor().backgroundAppGreen),
                            child: ListTile(
                              onTap: () {
                                BlocProvider.of<FeedbackBloc>(context).add(
                                  GiveFeedback(
                                    feedback:
                                        FeedbackModel(vertexId: node[index]),
                                  ),
                                );
                              },
                              leading: Icon(
                                Icons.directions_bus_filled_sharp,
                                color: MainColor().appGreen,
                              ),
                              title: Text(
                                result[index],
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
            );
          },
        ),
      ),
    );
  }
}
