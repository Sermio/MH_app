import 'package:flutter/material.dart';
import 'package:mh_app/components/c_drawer.dart';
import 'package:mh_app/components/c_appbar.dart';
import 'package:mh_app/components/c_card_filter.dart';

class CardList extends StatefulWidget {
  final Future<List<dynamic>> Function()
      fetchCardData; // Cambia a List<Monster>
  final Widget Function(Future<List<dynamic>> futureData, String filterText)
      cardListWidget;

  const CardList({
    super.key,
    required this.fetchCardData,
    required this.cardListWidget,
  });

  @override
  State<CardList> createState() {
    return _CardListState();
  }
}

class _CardListState extends State<CardList> {
  String filterText = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: Cappbar(scaffoldKey: _scaffoldKey),
        drawer: const Cdrawer(),
        body: Column(
          children: [
            CcardFilter(
              filterText: filterText,
              onFilterChanged: (value) {
                setState(() {
                  filterText = value;
                });
              },
            ),
            Expanded(
              child: widget.cardListWidget(widget.fetchCardData(), filterText),
            ),
          ],
        ),
      ),
    );
  }
}
