import 'package:flutter/material.dart';

import 'schedule_Item_Container.dart';
class schedule_item extends StatefulWidget {
String depart;
String arrive;
String type;
String timedepart;
String timearrive;
bool visible;

schedule_item({Key? key, this.depart='',this.arrive='',this.type='',this.visible=false, this.timedepart='', this.timearrive='',}) : super(key: key);
  @override
  State<schedule_item> createState() => _schedule_itemState();
}

class _schedule_itemState extends State<schedule_item> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          shedule_Item_Container(depart1: widget.depart,arrive1: widget.arrive,type1: widget.type,visible1: widget.visible,timedepart: '1:30',timearrive: '2:30',),
          shedule_Item_Container(depart1: widget.depart,arrive1: widget.arrive,type1: widget.type,visible1: widget.visible,timedepart: '4:30',timearrive: '6:30',),
          shedule_Item_Container(depart1: widget.depart,arrive1: widget.arrive,type1: widget.type,visible1: widget.visible),
          shedule_Item_Container(depart1: widget.depart,arrive1: widget.arrive,type1: widget.type,visible1: widget.visible),
          shedule_Item_Container(depart1: widget.depart,arrive1: widget.arrive,type1: widget.type,visible1: widget.visible),
        ],
      ),
    );
  }
}
