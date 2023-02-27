import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myfirstapp/card.dart';
import 'card_component.dart';


class ViewCard extends StatefulWidget {
 
  final Cartao card;
  const ViewCard({super.key, required this.card});

  @override
  State<ViewCard> createState() => _ViewCardState();
}

class _ViewCardState extends State<ViewCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.card.nameUser),centerTitle: true),
      body: CardComponent(name: widget.card.nameUser,date: widget.card.date,number: widget.card.numberCard,altura: 250,largura: 440,)
    );
  }
}