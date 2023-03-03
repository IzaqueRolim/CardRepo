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
      body: 
        SingleChildScrollView(
          
          child: 
          Column(

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
              Container(
                width: 340,
                height: 60,
                margin: EdgeInsets.all(10),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 150,
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
                      width: 150,
                      height: 60,
                      child:
                        TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3)
                          ],
                          decoration: InputDecoration(
                          hintText: "000",
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
                    onTap: (){setState((){cor = Color(0xFF26973D);});},
                    child: Container(height: 40,width: 40,margin: EdgeInsets.only(left: 5,right: 5,top: 15),decoration: BoxDecoration(color: Color(0xFF26973D),borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                  GestureDetector(
                    onTap: (){setState((){cor = Color(0xFF01BDEA);});},
                    child: Container(height: 40,width: 40,margin: EdgeInsets.only(left: 5,right: 5,top: 15),decoration: BoxDecoration(color: Color(0xFF01BDEA),borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                  GestureDetector(
                    onTap: (){setState((){cor = Color(0xFFA513BEE);});},
                    child: Container(height: 40,width: 40,margin: EdgeInsets.only(left: 5,right: 5,top: 15),decoration: BoxDecoration(color: Color(0xFFA513BEE),borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                  GestureDetector(
                    onTap: (){setState((){cor = Color(0xFFED1578);});},
                    child: Container(height: 40,width: 40,margin: EdgeInsets.only(left: 5,right: 5,top: 15),decoration: BoxDecoration(color: Color(0xFFED1578),borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                  GestureDetector(
                    onTap: (){setState((){cor = Color(0xFFFF4E00);});},
                    child: Container(height: 40,width: 40,margin: EdgeInsets.only(left: 5,right: 5,top: 15),decoration: BoxDecoration(color: Color(0xFFFF4E00),borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                  GestureDetector(
                    onTap: (){setState((){cor = Color(0xFF1B201E0);});},
                    child: Container(height: 40,width: 40,margin: EdgeInsets.only(left: 5,right: 5,top: 15),decoration: BoxDecoration(color: Color(0xFF1B201E0),borderRadius: BorderRadius.all(Radius.circular(15)))),
                  ),
                 ],),
             MyButton(card: Cartao(nameUser: name, date: date, numberCard: number, cvc: cvc,cor: this.cor))
      ]
      )));
  }
}