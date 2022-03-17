import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launch_review/launch_review.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'booking_train_qr.dart';
import 'package:get/get.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'emergency_list.dart';
import 'foodlist/food_list.dart';
import 'schedule_Item.dart';
import 'schedule_Item_Container.dart';
import 'signup/login_screen.dart';
import 'signup/profile_page.dart';
import 'sourceBottomSheet.dart';
import 'typeBottomSheet.dart';

class ticketbookinghomepage extends StatefulWidget {
  @override
  _ticketbookinghomepageState createState() => _ticketbookinghomepageState();
}

class _ticketbookinghomepageState extends State<ticketbookinghomepage> {
  int pageindex = 0;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }



  @override


  List imgs=[

    'assets/egypt2.jfif',
    'assets/egypt4.jpg',
    'assets/train.jpg',
    'assets/trainh.jpg',

  ];

  bool visible = false;
  int numOfVisibleScheduled = 0;
  var valuechoose;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();


  schedule_item schedule = schedule_item();
  TextField departureText = TextField();
  TextField arriveText = TextField();
  TextField storeText = TextField();
  TextField typeText = TextField();

   List destimgs = [
     'assets/mahtetmasr.png',
     'assets/f1b7cd1c476609de5c0003d928da7b72.jpg',
     'assets/download1.jpg',
     'assets/download3.jpg',

  ];

  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
            color:Colors.white ,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [  Color(0xff3c4cad),
                Color(0xffffdde1),],
            ),
          ) ,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250),
                  ),
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [  Color(0xff800080),
                      Color(0xffffc0cb),],
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text("P S T",
                    style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home,size: 25,color:Colors.blueAccent ),
                title: Text('Home', style: TextStyle(fontSize: 18, color:Colors.white),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ticketbookinghomepage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.person_add_alt_1, size: 25,color:Colors.blueAccent),
                title: Text('My Profile',style: TextStyle(fontSize: 18,color:Colors.white ),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>profilepage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.login, size: 25,color: Theme.of(context).accentColor,),
                title: Text('Login',style: TextStyle(fontSize: 18,color:Colors.white),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>loginscreen()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.attribution, size: 12,color: Theme.of(context).accentColor,),
                title: Text('My Journeys',style: TextStyle(fontSize: 18,color:Colors.white),),
                onTap: () {},
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: 12,color: Theme.of(context).accentColor,),
                title: Text('Logout',style: TextStyle(fontSize: 18,color:Colors.white),),
                onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          loginscreen()),);
                },
              ),
            ],
          ),
        ),
      ),

      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: PageView(controller: pageController, children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    color: Color(0xff3c4cad),
                  ),
                  child: Swiper(itemCount: 4,
                    controller: SwiperController(

                    ),
                    pagination: SwiperPagination(
                    ),
                    itemBuilder: (context, index){
                      return Stack(
                        children:[
                          Container(
                        width:450,
                            child: Image.asset(imgs[index],fit: BoxFit.fill,),
                          ),
                          Container(
                          padding: EdgeInsets.all(16),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),

                                  ),
                                  InkWell(
                                    onTap:()=> Scaffold.of(context).openEndDrawer(),
                                    child: CircleAvatar(
                                    backgroundImage:NetworkImage('https://www.seekpng.com/png/detail/5-58081_settings-icon-in-color.png'),

                                      ),
                                  ),

                                ],
                              ),

                              Text("Get Discount Up To",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 20
                              ),),
                              Text("30%",style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),

                            ],
                          ),
                        ),
                      ]);
                    },

                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://mymickeyvacation.com/wp-content/uploads/2018/01/mobile-order-logo.png'),
                                    radius: 12,
                                    backgroundColor: Colors.orange[50],

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Passenger Service',
                                      style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),

                      Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0xffe7e7e7))),
                                    child: Center(
                                      child: Icon(
                                        Icons.fastfood,
                                        color: Color(0xfff9c449),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 foodlist()));
                                    },
                                    child: Text("",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0xffe7e7e7))),
                                    child: Center(
                                      child: Icon(
                                        Icons.emoji_food_beverage,
                                        color: Color(0xfff04393),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                    },
                                    child: Text("",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0xffe7e7e7))),
                                    child: Center(
                                      child: Icon(
                                        Icons.personal_injury,
                                        color: Color(0xff240e8b),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  emergencylist()));
                                    },
                                    child: Text("",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Upcoming Train',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      'you have 2 upcoming tickets',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: TextButton(
                                    onPressed: () {

                                    },
                                    child: Text("See All",
                                        style: TextStyle(
                                            color: Color(0xff240e8b))),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 7,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffE7E7E7)),
                                  borderRadius: BorderRadius.circular(6)),
                              padding: EdgeInsets.all(2),
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
                                      Spacer(),
                                      Text(
                                        '3 Seats',
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Cairo ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('6 jan 21',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('3:20',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xfff9c449),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            " Alexandria",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('6 jan 21',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('5:45',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffE7E7E7)),
                                  borderRadius: BorderRadius.circular(6)),
                              padding: EdgeInsets.all(2),
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
                                      Spacer(),
                                      Text(
                                        '3 Seats',
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Cairo ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('6 jan 21',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('3:20',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xfff9c449),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            " Alexandria",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('6 jan 21',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('5:45',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top destinations',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text('Recommendations',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff240e8b))),
                            ],
                          )),
                      Expanded(
         flex:9,
             child: ListView.builder(
             scrollDirection: Axis.horizontal,
          itemCount: destimgs.length, itemBuilder: (context, index) {
              return Container(
               width: 180,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Card(
          child: Container(
            child: Image.asset(destimgs[index],fit:BoxFit.fill,)
              ),
          ),

      );
           }),
                      )],
                  ),
                ),
              ],
            ),
          ),

          Scaffold(
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
                title: Text('Search By Station'),
                centerTitle: true,
                actions: <Widget>[
                  PopupMenuButton(
                    // add icon, by default "3 dot" icon
                      icon: Icon(Icons.circle_notifications),
                      itemBuilder: (context){
                        return [
                          PopupMenuItem<int>(
                            value: 0,
                            child:shedule_Item_Container(depart1: controller1.text,arrive1:controller2.text,type1: controller3.text,visible1: true),
                          ),

                        ];
                      },
                      onSelected:(value){
                        if(value == 0){
                          MaterialPageRoute(
                              builder: (context) => booking_train_qr());
                        }
                      }
                  ),
                ]
            ),
            body: ListView(
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Departure Station'),
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: departureText = TextField(
                              controller: controller1,
                              autocorrect: true,
                              decoration: InputDecoration(
                                  labelText: '-Select Station',
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      showSourceBottomSheet(
                                          context, controller1);
                                      setState(() {
                                        // controller.text= bs.value;
                                      });
                                    },
                                    child: Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30)))),
                            ))
                      ],
                    )),
                SizedBox(height: 2),
                IconButton(
                  icon: Icon(Icons.wifi_protected_setup_rounded),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      if(departureText==departureText&&arriveText==arriveText){
                        storeText=departureText;
                        departureText=arriveText;
                        arriveText=storeText;
                        controller4=controller1;
                        controller1=controller2;
                        controller2=controller4;

                      }
                    });
                  },
                ),
                SizedBox(height: 2),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text('ِِِArrival Station'),
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: arriveText = TextField(
                            controller: controller2,
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelText: '-Select Station',
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    showDestinationBottomSheet(
                                        context, controller2);
                                    setState(() {
                                      //  controller.text= bs.value;
                                    });
                                  },
                                  child: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30)))),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 5),

                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text('ِِِTrain Type'),
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: typeText = TextField(
                            controller: controller3,
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelText: '-Select type',
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    showTypeBottomSheet(
                                        context, controller3);

                                    setState(() {
                                      //  controller.text= bs.value;
                                    });
                                  },
                                  child: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30)))),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: SizedBox(
                    height: 80,
                    width: 10,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.amberAccent),
                          padding:
                          MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(600)))),
                      onPressed: () {
                        if (numOfVisibleScheduled == 0) {
                          visible = true;
                          setState(() {
                            schedule = schedule_item(
                                depart: controller1.text,
                                arrive: controller2.text,
                                type: controller3.text,
                                visible: true);
                          });
                        }
                      },
                      child: Icon(
                        Icons.train,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                schedule,
              ],
            ),
          ),

          Scaffold(
            appBar: AppBar(

              backgroundColor: Color(0xff240e8b),
              title: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.grey[300],
            body: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.format_align_center_outlined),
                    title: Text('Sign Up'),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginscreen()));
                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.format_align_center_outlined),
                    title: Text('Sign out'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Exit',
                        middleText:'Are You Sure To Exit',
                        textConfirm: 'Yes',
                        textCancel:'no',
                      );

                    },
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Exit'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.rate_review_outlined),
                      onPressed: () {
                        LaunchReview.launch(
                            androidAppId: "com.example.testapp",
                            iOSAppId: '33443434');
                      },
                    ),
                    title: Text('Give Us Your Feedback'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: pageindex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            pageindex = index;
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Color(0xffF09819),
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.align_vertical_bottom),
                title: Text('My Ticket'),
                activeColor: Colors.purpleAccent
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.purple
            ),

          ],
        )
    );
  }
}
void showSourceBottomSheet(BuildContext context, TextEditingController _cont) {
  sourceBottomSheet bs = sourceBottomSheet(_cont);
  //bs.sourceBottomSheet1(_cont);
  showModalBottomSheet(
      context: context,
      builder: (buildContext) {
        return bs;
        //    return sourceBottomSheet();
      });
}

void showDestinationBottomSheet(
    BuildContext context, TextEditingController _cont) {
  sourceBottomSheet bs = sourceBottomSheet(_cont);
  //bs.sourceBottomSheet1(_cont);
  showModalBottomSheet(
      context: context,
      builder: (buildContext) {
        return bs;
        //    return sourceBottomSheet();
      });
}
void showTypeBottomSheet(
    BuildContext context, TextEditingController _cont) {
  typeBottomSheet bs = typeBottomSheet(_cont);
  //bs.sourceBottomSheet1(_cont);
  showModalBottomSheet(
      context: context,
      builder: (buildContext) {
        return bs;
        //    return sourceBottomSheet();
      });
}