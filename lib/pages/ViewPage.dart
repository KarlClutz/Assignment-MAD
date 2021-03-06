import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:assignment_project/model/localSetting.dart';
import 'package:assignment_project/model/pet.dart';
import 'package:provider/provider.dart';
import 'package:assignment_project/notifier/UserNotifier.dart';
import 'package:assignment_project/model/request.dart';
import 'package:assignment_project/services/database_service.dart';

class ViewPage extends StatefulWidget {
  final Pet pet;
  ViewPage({Key key, @required this.pet}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Column(
                    children: <Widget>[
                      CarouselSlider(
                        height: 200,
                        initialPage: 0,
                        onPageChanged: (index) {
                          // setState(() {
                          //   _current = index;
                          // });
                        },
                        items: widget.pet.images.map((value) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(value)),
                                  color: Colors.grey,
                                ),
                                // child: Image.asset(
                                //   value,
                                //   fit: BoxFit.cover,
                                // ),
                              );
                            },
                          );
                        }).toList(),
                      )
                    ],
                  )),
                  SizedBox(height: 10),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 20),
                              child: Container(
                                  child: Text(
                                widget.pet.petName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 19),
                              )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Image.asset(
                                              (widget.pet.gender)
                                                  ? "assets/image/Male_Icon.png"
                                                  : "assets/image/Female_Icon.png",
                                              width: 18.0,
                                              height: 18.0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: (widget.pet.gender)
                                                ? " Male"
                                                : " Female",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      child: Icon(
                                    Icons.timelapse,
                                    color: Colors.grey,
                                    size: 15,
                                  )),
                                  Container(
                                    child: Text(
                                        widget.pet.dateCreated
                                            .toDate()
                                            .toString()
                                            .substring(0, 10),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Image.asset(
                                            "assets/image/Cat_Icon.png",
                                            width: 18.0,
                                            height: 18.0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " ${widget.pet.type}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      child: Icon(
                                    Icons.location_city,
                                    color: Colors.grey,
                                    size: 15,
                                  )),
                                  Container(
                                    child: Text(" ${widget.pet.location}",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 50,
                          color: primarySwatch,
                          thickness: 2,
                          indent: 15,
                          endIndent: 15,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Row(
                        //         children: [
                        //           Container(
                        //             child: Text("Breed",
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.black,
                        //                     fontSize: 15)),
                        //           ),
                        //           Container(
                        //             child: Text(" | ${pet.type}",
                        //                 style: TextStyle(
                        //                     color: Colors.black, fontSize: 15)),
                        //           ),
                        //         ],
                        //       ),
                        //       Row(
                        //         children: [
                        //           Container(
                        //             child: Text("Vaccinated",
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.black,
                        //                     fontSize: 15)),
                        //           ),
                        //           Container(
                        //             child: Text(" | Yes",
                        //                 style: TextStyle(
                        //                     color: Colors.black, fontSize: 15)),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text("Age",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 15)),
                                  ),
                                  Container(
                                    child: Text(" | ${widget.pet.age} years",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Disabilities",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 15)),
                                  ),
                                  Container(
                                    child: Text(
                                        (widget.pet.cacat == '')
                                            ? "| No"
                                            : "| ${widget.pet.cacat}",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Consumer<UserNotifier>(
                          builder: (context, notifier, child) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: RaisedButton(
                                    color: primarySwatch,
                                    onPressed: () {
                                      Request req = Request(
                                        petImage: widget.pet.images[0],
                                        petName: widget.pet.petName,
                                        phoneNumber: widget.pet.phoneNumber,
                                        postUID: widget.pet.docID,
                                        profilePic: notifier.getUserData.profilePicture,
                                        status: 'Pending',
                                        uidCreator: widget.pet.uidCreator,
                                        userUID: notifier.getUserUID,
                                        username: notifier.getUserData.username
                                      );
                                      DatabaseService().submitRequest(req);
                                    },
                                    child: Center(
                                      child: Text("Adopt Pet",
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        side: BorderSide(color: primarySwatch)),
                                  )),
                            );
                          },
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Text("Description",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: (widget.pet.info == "")
                                                ? "No additional info"
                                                : widget.pet.info,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: CircleAvatar(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 15,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  backgroundColor: primarySwatch,
                  radius: 15,
                ))
          ],
        ),
      ),
    );
  }
}
