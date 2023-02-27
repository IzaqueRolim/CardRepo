import 'package:flutter/material.dart';
import 'package:myfirstapp/register_card.dart';
import 'view_card.dart';
import 'card.dart';
import 'card_component.dart';

class ListPage extends StatefulWidget {
  final List<Cartao> cards;
  const ListPage({super.key,required this.cards});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
 
  mostrarDetalhes(Cartao card) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewCard(card: card),
      ),
    );
  }
  addCard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RegisterCard()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seus Cartoes")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
          child: Column(
            children: [
              for(var i = 0; i <widget.cards.length; i++)
                GestureDetector(
                  onTap: (){
                    setState(() {
                      mostrarDetalhes(widget.cards[i]);
                    });
                  },
                  child: CardComponent(name: widget.cards[i].nameUser,date:widget.cards[i].date,number: widget.cards[i].numberCard,altura:220,largura:380),
                )
              ],
           )),
      floatingActionButton: FloatingActionButton(onPressed: ()=>addCard(),child: Icon(Icons.add)),
    );
  }
}