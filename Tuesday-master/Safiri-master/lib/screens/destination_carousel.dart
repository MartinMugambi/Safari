import 'package:flutter/material.dart';
import 'package:msafiri/screens/destinationdetails_screen.dart';
import 'package:msafiri/screens/destinations.dart';

import 'horizontal_list_item.dart';
//import 'maasaimarascreen.dart';

class DestinationCarousel extends StatefulWidget {
  final Destination destinationList;

  const DestinationCarousel({Key key, this.destinationList}) : super(key: key);
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 270,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinationList.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destinationLists = destinationList[index];
              return Container(
                padding: const EdgeInsets.all(10),
                width: 160,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DestinationDetailsScreen(
                              destinationList: destinationLists),
                        ));
                  },
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 10,
                        child: Container(
                          height: 180,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                destinationLists.imageUrl,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        destinationLists.title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            } //],
            ),
      ),
    );
  }
}
