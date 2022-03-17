import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myTicketTab extends StatelessWidget {
  const myTicketTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
   child: Column(
     children: [
       Text('Stations'),
       Container(
         padding: EdgeInsets.all(10),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(16),
         ),
         child:Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text('-Select Station'),
             Icon(Icons.arrow_drop_down),
           ],
         ) ,
       )
     ],
   ));
  }
}
