import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/screens/card_details.dart';

class Ccard extends StatelessWidget {
  final Monster monster;

  const Ccard({Key? key, required this.monster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CardDetails(monster)));
      },
      child: Card(
        child: ListTile(
          // leading: const Icon(Icons.pets_outlined),
          // trailing: IconButton(
          //   icon: const Icon(Icons.add_shopping_cart_sharp),
          //   onPressed: () {},
          // ),
          title: Text(
            monster.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(monster.description),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    "Type: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    monster.type,
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Species: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    monster.species,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  final double price;

  const PriceWidget({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${price.toStringAsFixed(2)} €',
      style: const TextStyle(fontWeight: FontWeight.w900),
    );
  }
}
