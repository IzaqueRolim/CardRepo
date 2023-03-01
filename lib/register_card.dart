import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:myfirstapp/card.dart';
import 'myapp.dart';
import 'card_component.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({super.key });

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {

  var name = "Your Name",number="0000 0000 0000 0000",cvc="000",date="00/00";
  late Color cor = Colors.black;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crie seu cartao"),centerTitle: true,),
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CardComponent(name: name,date: date,number: number,cvc:cvc,altura: 200,largura: 340,cor:this.cor),
               SizedBox(
                width: 340,
                height: 60,
                child:
                  TextField(
                    inputFormatters: [
                      MaskedInputFormatter("#### #### #### ####",allowedCharMatcher: RegExp(r'[0-9]')),
                     // FilteringTextInputFormatter.digitsOnly,
                      // LengthLimitingTextInputFormatter(16)
                    ],
                    decoration: InputDecoration(
                      hintText: "0000 0000 0000 0000",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      setState(() {
                        number=value;
                      });
                    },
                    )
              ),
              SizedBox(
                width: 340,
                height: 60,
                child:
                  TextField(
                    decoration: InputDecoration(
                      hintText: name, 
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) => {
                        setState((){
                          
                           name=value;
                          
                        })
                    })
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 170,
                      height: 60,
                      child:
                        TextField(
                          inputFormatters: [  
                            MaskedInputFormatter("##/##",allowedCharMatcher: RegExp(r'[0-9]'))
                          ],
                          decoration: InputDecoration(
                          hintText: "00/00",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                        keyboardType: TextInputType.datetime,
                        onChanged:(value){
                          setState((){
                            date=value;
                          });
                        })
                  ),
                  SizedBox(
                      width: 170,
                      height: 60,
                      child:
                        TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3)
                          ],
                          decoration: InputDecoration(
                          hintText: "CVC",
                          labelText: "",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                        keyboardType: TextInputType.number,
                        onChanged:(value){
                          setState(() {
                            cvc=value;
                          });
                        }
                        ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: (){setState((){cor = Colors.blue;});},
                    child: Container(height: 30,width: 30,margin: EdgeInsets.only(left: 5,right: 5),decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                  GestureDetector(
                    onTap: (){setState((){cor = Colors.green;});},
                    child: Container(height: 30,width: 30,margin: EdgeInsets.only(left: 5,right: 5),decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                  GestureDetector(
                    onTap: (){setState((){cor = Colors.red;});},
                    child: Container(height: 30,width: 30,margin: EdgeInsets.only(left: 5,right: 5),decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                  GestureDetector(
                    onTap: (){setState((){cor = Colors.purple;});},
                    child: Container(height: 30,width: 30,margin: EdgeInsets.only(left: 5,right: 5),decoration: BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                 ],),
             MyButton(card: Cartao(nameUser: name, date: date, numberCard: number, cvc: cvc,cor: this.cor))
      ]
      ));
  }
}