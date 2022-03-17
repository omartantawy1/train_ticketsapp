import 'package:flutter/material.dart';

import 'paymentLogo.dart';
import 'qrCode.dart';
import 'schedule_Item_Container.dart';
import 'ticket_booking_home_page.dart';



class booking_train_qr extends StatefulWidget {

  @override
  State<booking_train_qr> createState() => _booking_train_qrState();
}

class _booking_train_qrState extends State<booking_train_qr> {
  bool qrVisible = false;
  int numOfVisibleQRS = 0;
  qrCode qrsCode = qrCode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ticketbookinghomepage()));

          },
        ),
        backgroundColor: Color(0xff240e8b),
        title: Text('Pick Ticket'),
        centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              // add icon, by default "3 dot" icon
               icon: Icon(Icons.circle_notifications),
                itemBuilder: (context){
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child:shedule_Item_Container(),
                    ),

                    PopupMenuItem<int>(
                      value: 1,
                      child: shedule_Item_Container(),
                    ),

                    PopupMenuItem<int>(
                      value: 2,
                      child: shedule_Item_Container(),
                    ),
                  ];
                },
                onSelected:(value){
                  if(value == 0){
                    print("My account menu is selected.");
                  }else if(value == 1){
                    print("Settings menu is selected.");
                  }else if(value == 2){
                    print("Logout menu is selected.");
                  }
                }
            ),
          ]
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                'Payment Methods:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  paymentLogo("assets/Fawry.png",),
                  paymentLogo("assets/voda_cash2.png"),
                  paymentLogo("assets/visaLogo.png"),
                ],
              ),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amberAccent),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)))),
                  onPressed: () {
                    if (numOfVisibleQRS == 0) {
                      qrVisible = true;
                      setState(() {
                        qrsCode=qrCode(qrVisible:true);
                      });
                    }
                  },
                  child: Icon(
                    Icons.vpn_key,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: qrsCode,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
