import 'package:flutter/material.dart';

class paymentLogo extends StatelessWidget {
  paymentLogo(this.imageBath);
String imageBath='';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(5),
        child: InkWell(
          onTap: (){},
          child: Image.asset(imageBath,width: double.tryParse(imageBath),height: double.tryParse(imageBath),
          fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
