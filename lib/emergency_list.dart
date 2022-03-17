import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
class emergencylist extends StatefulWidget {
  const emergencylist({Key? key}) : super(key: key);

  @override
  _emergencylistState createState() => _emergencylistState();
}

class _emergencylistState extends State<emergencylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
appBar: AppBar(
  backgroundColor: Color(0xff302b63),
  title: Text('Emergency '),
  centerTitle: true,
),
      body: Column(
        children:[ Card(
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/423-4230973_logo-of-ambulance.png')
            ),
            title: Text('Ambulance'),
            subtitle: Text('123'),
            trailing: InkWell
              (
         onTap: (){
           FlutterPhoneDirectCaller.callNumber('123');
         },
                child: Icon(Icons.call,color: Colors.deepPurple,)),
          ),
        ),
          SizedBox(height: 10,),
          Card(
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage('assets/Egyptian_Police_Emblem.svg.png')
            ),
            title: Text('Ambulance'),
            subtitle: Text('122',style: TextStyle(fontSize: 15),),
            trailing: InkWell
              (
                onTap: (){
                  FlutterPhoneDirectCaller.callNumber('122');
                },
                child: Icon(Icons.call,color: Colors.deepPurple,)),
          ),
        ),
      ]
      ),
    );
  }
}