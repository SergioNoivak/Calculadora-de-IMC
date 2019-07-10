import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


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

TextEditingController controladorKg = TextEditingController();
TextEditingController controladorCm = TextEditingController();
String textoInformativo = "";

GlobalKey<FormState> _formKey = GlobalKey<FormState>();


void resetar(){

  
  this.controladorCm.text = "";
  this.controladorKg.text = "";
setState(() {
  this.textoInformativo="informe seus dados";
  this._formKey = GlobalKey<FormState>();
});

}

void calcular(){
setState(() {


  double weight = double.parse(this.controladorKg.text);
  double height = double.parse(this.controladorCm.text)/100;
  double imc = weight/(height*height);
  
  if(imc<18.6)
    this.textoInformativo = "Abaixo do peso imc = ${imc.toStringAsPrecision(4)}";
  else if(imc>= 18.6 && imc<24.9)
    this.textoInformativo = "ok, peso ideal imc = ${imc.toStringAsPrecision(4)}";
  else if(imc>= 24.9 && imc<29.9)
    this.textoInformativo = "Levemente acima do peso  imc = ${imc.toStringAsPrecision(4)}";
  else if(imc>= 29.9 && imc<34.9)
    this.textoInformativo = "Obesidade grau 1 imc = ${imc.toStringAsPrecision(4)}";
  else if(imc>= 34.9 && imc<39.9)
    this.textoInformativo = "Obesidade grau 2 imc = ${imc.toStringAsPrecision(4)}";
  else if(imc>= 40 )
    this.textoInformativo = "Obesidade grau 3 imc = ${imc.toStringAsPrecision(4)}";
      
});

}

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
                onPressed: resetar ,
              )
          ],
        ),
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child:Form(
              key: this._formKey,
              child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Icon(
                  Icons.person_outline,
                  size: 100,
                  color: Colors.green
                  ),
                  TextFormField(keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                
                                labelText: "Altura (cm)",
                                labelStyle: TextStyle(color: Colors.green, fontSize: 20.0)
                            ),
                            
                         textAlign: TextAlign.center,
                          controller: controladorCm,     
                          validator: (value){
                            if(value.isEmpty)
                              return "insira sua altura";



                          },
                  ),
                    TextFormField(keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                
                                labelText: "Peso (kg)",
                                labelStyle: TextStyle(color: Colors.green, fontSize: 20.0)
                            ),
                            
                         textAlign: TextAlign.center,
                        controller: controladorKg,
                         validator: (value){
                            if(value.isEmpty)
                              return "insira seu Peso";
                          }
                  ),
                  
                  Container(
                    
                    child:RaisedButton(
                    onPressed:(){

                      if(this._formKey.currentState.validate())
                        calcular();


                    } ,
                    child: Text("Calcular",style: TextStyle(color: Colors.white,fontSize: 15.0)),
                    color: Colors.green),
                    height: 50.0,),
                Container(  
                  child : Padding(padding: EdgeInsets.all(10), child:Text("$textoInformativo",style: TextStyle(color: Colors.blue),), ),       
                  alignment: Alignment.center,
                  
                )
                  
            ],


        ),
        


          )

        
        )



);
}
}