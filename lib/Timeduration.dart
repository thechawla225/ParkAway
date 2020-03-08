import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class TimeScreen extends StatefulWidget {
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
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
                child: Text("Time Duration", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
        
		// Use it from the context of a stateful widget, passing in
		// and saving the duration as a state variable.
            SizedBox(height: 30),
            DurationPicker(
              duration: _duration,
              onChange: (val) {
                this.setState(() => _duration = val);
              },
              snapToMins: 5.0,
            ),
            SizedBox(height: 30),
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