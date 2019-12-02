
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 List<String> _locations = ['India','USA','Europe','Australia','UAE','Latin America','China']; // Option 2
  String _selectedLocation;
 Map<String,String> m={'India':'Enter Your Aadhar Number','USA':'Enter Your SSN',
 'Europe': 'Enter Your Driving License','Australia':'Enter Your Driving License','UAE':'Enter Your Driving License',
 'Latin America':'Enter Your Driving License','China':'Enter Your Driving License'};
 TextEditingController t1=new TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Card(
               child: Container(
                //  height: 50.0,
                //  width: 200.0,
                //  margin: const EdgeInsets.all(15.0),
                //  padding: const EdgeInsets.all(3.0),
                 decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                 padding: EdgeInsets.symmetric(horizontal: 2.0,vertical: 4.0),
                 child: DropdownButton(
            hint: Text('Choose your Country'), // Not necessary for Option 1
            value: _selectedLocation,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
          //  elevation: 16,
            onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue;
                    t1.text=m[newValue];
                  });
            },
            items: _locations.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
            }).toList(),
          ),
               ),
             ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 2.0,vertical: 4.0),)
          ,Card(
             margin: const EdgeInsets.all(30.0),
            child: Container(
              // height: 80.0,
              // width: 200.0,
              // margin: const EdgeInsets.all(15.0),
              // padding: const EdgeInsets.all(3.0),
                padding: EdgeInsets.symmetric(horizontal: 2.0,vertical: 4.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: TextFormField(onTap: (){
                 setState(() {
                   t1.clear();
                  });
              },
                            controller: t1,
              decoration: InputDecoration(
                hintText: t1.text,
               // labelStyle: TextStyle(height: 10000.0,color: Colors.black),
                contentPadding: EdgeInsets.symmetric(horizontal: 2.0,vertical: 4.0)
              ),
              
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(child:Text('Submit' ),onPressed:(){
              String s=t1.text;
              showDialog<String>(
            context: context,
            builder: (BuildContext context)=> AlertDialog(title: Text('$_selectedLocation') ,
            content: Text('Your ID: $s'),
            
            actions: <Widget>[FlatButton(child: Text('OK'),
            onPressed: ()=>Navigator.pop(context,'OK'),)],)
              );
              // Navigator.push(context, res(_selectedLocation,t1.text));
            }
            ),
          )
          ],
        ),
      ),
    );
  }

}
// class res extends StatelessWidget{
//   res(String selectedLocation, String text);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return ;
//   }

// }
