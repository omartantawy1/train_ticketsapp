import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ticket_booking_app.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );

  runApp(ticketbookingapp());
}

