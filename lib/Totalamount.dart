import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class TotalAmount extends StatefulWidget {
  @override
  _TotalAmountState createState() => _TotalAmountState();
}

class _TotalAmountState extends State<TotalAmount> {
  @override
  Widget build(BuildContext context) {
    Duration _duration = Duration(hours: 0, minutes: 0);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(MdiIcons.arrowLeftThick) , color: Colors.black,),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
              SizedBox(height: 130,),

              Center(
                child: Text("Total Amount", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 60,
          width: 280,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.all( Radius.circular(29.0),
            ),
          ),
          child: Center(
            child: Text("50", style: TextStyle(color: Colors.black, fontSize: 30, ),

        ),
          ),

        ) ,
            SizedBox(
              height: 30,
            ),

        Text("Pay Via" , style: TextStyle(color: Colors.black, fontSize: 30), ),
            SizedBox(
              height: 30,
            ),
        InkWell(child:
        Container(
          height: 60,
          width: 280,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.all( Radius.circular(29.0),
            ),
          ),
          child: Center(
            child: Text("Confirm", style: TextStyle(color: Colors.black, fontSize: 30, ),

        ),
          ),

        ) ,
        )
        ],
        ),
        ),
    
      
    );
  }
}