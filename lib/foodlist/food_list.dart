import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import 'food_cartmodel.dart';
import 'food_cartprovider.dart';
import 'food_cartscreen.dart';
import 'food_dbhelper.dart';
class foodlist extends StatefulWidget {
  const foodlist({Key? key}) : super(key: key);

  @override
  _foodlistState createState() => _foodlistState();
}

class _foodlistState extends State<foodlist> {
  List<String> productName = ['Rice with meat' , 'vegetables salad' , 'Burger Sandwich' , 'Shrimp Dish' , 'Rice with chicken' , 'Chicken Sandwich','Tuna salad',] ;
  List<int> productPrice = [30,10 , 20 , 40 , 50, 60 , 30 ] ;
  List<String> productImage = [
    'https://banner2.cleanpng.com/20180208/rpw/kisspng-mongolian-beef-nasi-campur-cooked-rice-thai-cuisin-black-pepper-beef-rice-5a7c9e8c7bb778.7344602815181164925068.jpg',
    'https://st.depositphotos.com/1004373/1268/i/600/depositphotos_12682057-stock-photo-fresh-salad.jpg',
    'https://storage.eu.content-cdn.io/cdn-cgi/image/width=300,quality=75,format=auto,fit=cover,g=top/am-resources/b7d7f7ad-cafb-4c0a-afb8-1a5341e7212b/Images/ProductImages/Source/super-star%20burger%20new.png',
   'https://www.acouplecooks.com/wp-content/uploads/2020/12/Honey-Garlic-Shrimp-026.jpg',
    'https://assets-global.website-files.com/5d03b4e13011831ae4624b37/61ff6b8686c6708c070e7d41_production-meal-image-e4122aa8-0fe7-4854-b6f5-e27e0c5be918.jpeg',
    'https://images.deliveryhero.io/image/talabat/Menuitems/MFC637795918254992253.jpg',
    'https://www.pngitem.com/pimgs/m/100-1009187_transparent-salad-png-tuna-nicoise-salad-png-png.png',
    '',
    '',
    '',
  ] ;

  Foodbhelper? dbHelper =Foodbhelper();
  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<Foodcartprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
          backgroundColor: Color(0xff302b63),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>cartscreen()),);
            },
            child: Center(
              child: Badge(
                showBadge: true,
                badgeContent: Consumer<Foodcartprovider>(
                  builder: (context, value , child){
                    return Text('cart',style: TextStyle(color: Colors.white));
                  },
                ),
                animationType: BadgeAnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),

          SizedBox(width: 20.0)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context, index){
                  return Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  height: 100,
                                  width: 100,
                                  image: NetworkImage(productImage[index].toString()),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(productName[index].toString() ,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(" "+r"L.E"+ productPrice[index].toString() ,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                      ),

                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: (){
                                            print(index);
                                            print(index);
                                            print(productName[index].toString());
                                            print( productPrice[index].toString());
                                            print( productPrice[index]);
                                            print('1');
                                            print(productImage[index].toString());

                                            dbHelper!.insert(
                                                Foodcart(
                                                    id: index,
                                                    productId: index.toString(),
                                                    productName: productName[index].toString(),
                                                    initialPrice: productPrice[index],
                                                    productPrice: productPrice[index],
                                                    quantity: 1,
                                                    image: productImage[index].toString(), unitTag: '')
                                            ).then((value){

                                              cart.addTotalPrice(double.parse(productPrice[index].toString()));
                                              cart.addCounter();

                                              final snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Product is added to cart'), duration: Duration(seconds: 1),);

                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                            }).onError((error, stackTrace){
                                              print("error"+error.toString());
                                              final snackBar = SnackBar(backgroundColor: Colors.red ,content: Text('Product is already added in cart'), duration: Duration(seconds: 1));

                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            });
                                          },
                                          child:  Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Color(0xfffdbb2d),
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: const Center(
                                              child:  Text('Add to cart' , style: TextStyle(color: Colors.white),),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
}
