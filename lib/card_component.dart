import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardComponent extends StatefulWidget {
  final name,date,number,cvc,altura,largura,cor;
  
  
  const CardComponent({super.key,required this.name,this.date,this.number,this.altura,this.largura,this.cvc,this.cor});

  @override
  State<CardComponent> createState() => _CardState();
}


class _CardState extends State<CardComponent> {

  bool toogle = true;

  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
        onTap: (){
          if(toogle){
            setState(() {
              toogle = false;
            });
          }
          else{
            setState(() {
              toogle = true;
            });
          }
        },
        child:
        Container(
            width: widget.largura.toDouble(),
            height: widget.altura.toDouble(),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: widget.cor),
            child: this.toogle ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[      
                 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Image.network(height: 20,"https://logosmarcas.net/wp-content/uploads/2020/09/Mastercard-Logo.png"),       
                    RotatedBox(quarterTurns: 1,child: Icon(color:Colors.white,Icons.wifi))
                  ]
                ),
                Text(widget.number,style: TextStyle(color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.name,style:TextStyle(color: Colors.white)),
                    Text(widget.date,style:TextStyle(color: Colors.white))
                ])
              ]
              ):
               Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:[
                    SizedBox(width: widget.largura*1.5, height: 40,child: Container(color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.cvc,style:TextStyle(color: Colors.white))
                    ])
                  ]
              )));
        }
}