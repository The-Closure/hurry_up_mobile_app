import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/core/resources/font.dart';
import 'package:riide/feature/shares/main_container.dart';

Future detailsShowBottomSheet(context) async {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: MainColor().appPrimerySolidBlack,
    builder: (BuildContext context) {
      return AddFeedContainer(context: context);
    }
  );
}

class AddFeedContainer extends StatefulWidget {
  AddFeedContainer({
    Key? key,
    required this.context,
  }) : super(key: key);
  BuildContext context;

  @override
  State<AddFeedContainer> createState() => _AddFeedContainerState();
}

class _AddFeedContainerState extends State<AddFeedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(this.widget.context).size.width - 64,
      height: MediaQuery.of(this.widget.context).size.height * 0.45,
      decoration: BoxDecoration(
        color: MainColor().appPrimeryTranspertensBlack,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: MainColor().appSeconderySolidBlack,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'time left',
                    style: RiideFontStyle().line1TextStyle(),
                  ),
                  // MainContainer(
                  //     context: context,
                  //     containerText: 'if (state is)',
                  //   onTap:
                  //      ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      //price
                      Container(
                        width: MediaQuery.of(context).size.width * 0.261,
                        height: MediaQuery.of(context).size.height * 0.109,
                        decoration: BoxDecoration(
                          color: MainColor().appSeconderySolidBlack,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            //icon
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.circleDollarToSlot,
                                    color: Color(0xFFF11A4C),
                                    size: 21,
                                  )
                                ]),
                            //text info
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '\$25.00',
                                  style: RiideFontStyle().line1TextStyle(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      //rating
                      Container(
                        width: MediaQuery.of(context).size.width * 0.261,
                        height: MediaQuery.of(context).size.height * 0.109,
                        decoration: BoxDecoration(
                          color: MainColor().appSeconderySolidBlack,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            //icon
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.star,
                                    color: Color(0xFFFFE416),
                                    size: 21,
                                  )
                                ]),
                            //text info
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '4.9',
                                  style: RiideFontStyle().line1TextStyle(),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  //distance
                  Container(
                    width: MediaQuery.of(context).size.width * 0.261 * 2,
                    height: MediaQuery.of(context).size.height * 0.109,
                    decoration: BoxDecoration(
                      color: MainColor().appSeconderySolidBlack,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        //icon
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.locationDot,
                                color: Color(0xFFAEFA24),
                                size: 21,
                              )
                            ]),
                        //text info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Distance',
                              style: RiideFontStyle().line1TextStyle(),
                            ),
                            Text(
                              '2.9',
                              style: RiideFontStyle().line1TextStyle(),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4206,
                height: MediaQuery.of(context).size.height * 0.233,
                decoration: BoxDecoration(
                  color: MainColor().appSeconderySolidBlack,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    //icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.thumbsUp,
                          color: Color(0xFFCA5FF4CA),
                          size: 21,
                        )
                      ],
                    ),
                    //text info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '25',
                          style: TextStyle(
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w800,
                            color: MainColor().appWhite,
                            fontSize: 40.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Recommend',
                          style: RiideFontStyle().line2TextStyle(),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
