import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(List<String> args) {
  

    runApp(MaterialApp(
      title:"calculadora de IMC",
      home: Home()));


}


class Home extends StatefulWidget {
@override
_HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
@override
Widget build(BuildContext context) {
return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh) ,
                onPressed: (){},
              )
          ],
        ),
        backgroundColor: Colors.white,
        body:SingleChildScrollView(child: 
         Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Icon(
                  Icons.person_outline,
                  size: 100,
                  color: Colors.green
                  ),
                  TextField(keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                
                                labelText: "Altura (cm)",
                                labelStyle: TextStyle(color: Colors.green, fontSize: 20.0)
                            ),
                            
                         textAlign: TextAlign.center,
                        
                  ),
                                TextField(keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                
                                labelText: "Peso (kg)",
                                labelStyle: TextStyle(color: Colors.green, fontSize: 20.0)
                            ),
                            
                         textAlign: TextAlign.center,
                        
                  ),
                  
                  Container(child:RaisedButton(
                    onPressed: (){},
                    child: Text("Calcular",style: TextStyle(color: Colors.white,fontSize: 15.0)),
                    color: Colors.green),
                    height: 50.0,)
                  
            ],


        ),
        
        
        )



);
}
}