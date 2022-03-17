import 'package:flutter/material.dart';

import 'booking_train_qr.dart';




class shedule_Item_Container extends StatefulWidget {
  String depart1;
  String arrive1;
  String type1;
  String timedepart;
  String timearrive;
  bool visible1;

  shedule_Item_Container({this.depart1='',this.arrive1='',this.type1='',this.visible1=false,this.timedepart='',this.timearrive='',});
  @override
  State<shedule_Item_Container> createState() => _shedule_Item_ContainerState();
}

class _shedule_Item_ContainerState extends State<shedule_Item_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffffffff)),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(
                Icons.train,
                color: Color(0xfff9c449),
              ),
              SizedBox(width: 2,),
              Text('Departure',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff9c449)),),
              Spacer(),
              Text(
                'Arrival',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff9c449)),
              ),
            ],
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.depart1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(widget.type1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(widget.timedepart,
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => booking_train_qr()));
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(0xfff9c449),
                ),
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.arrive1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  Text('around price:\n 25EGP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(widget.timearrive,
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                ],

              )
            ],
          ),
        ],
      ),
    )
    ;
  }
}
