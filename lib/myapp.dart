import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'list_page.dart';
import 'register_card.dart';
import 'card.dart';


  final List<Cartao> cards = [Cartao(nameUser: "The Paris Credit", date: "02/10", numberCard: "12345678920", cvc: "132",cor:Colors.black)];
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ListPage(cards: cards),
    );
  }
}

class MyButton extends StatefulWidget {
  final Cartao card;
 
  const MyButton({super.key,required this.card});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  acionar() {
    cards.add(widget.card);
    Navigator.push(
      context,
      MaterialPageRoute(builder:(_)=>ListPage(cards: cards)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        margin: EdgeInsets.only(top:10),
        child: 
        FilledButton(
          style: ButtonStyle(),
          child: Text("Salvar"),
          onPressed: (){
            setState((){
              acionar();
            });
          },
      ));
  }
}

