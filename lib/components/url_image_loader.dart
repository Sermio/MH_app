import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UrlImageLoader extends StatelessWidget {
  final String itemName;
  final Future<String?> Function(String) loadImageUrlFunction;

  const UrlImageLoader({
    Key? key,
    required this.itemName,
    required this.loadImageUrlFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: loadImageUrlFunction(itemName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: double.infinity,
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          return _errorWidget();
        } else {
          return CachedNetworkImage(
            imageUrl: snapshot.data!,
            placeholder: (context, url) => const SizedBox(
              width: double.infinity,
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => _errorWidget(),
            fit: BoxFit.contain,
            width: double.infinity,
            height: 200,
          );
        }
      },
    );
  }

  Widget _errorWidget() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/canteen-monster-hunter-world-wiki-locations-npcs-felynes-skills.jpg"), // Usa la URL válida
          fit: BoxFit.contain,
        ),
      ),
      child: const Center(
        child: Text(
          "Image not found, but here's some food!",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(offset: Offset(1.0, 1.0), color: Colors.black),
              Shadow(offset: Offset(-1.0, 1.0), color: Colors.black),
              Shadow(offset: Offset(1.0, -1.0), color: Colors.black),
              Shadow(offset: Offset(-1.0, -1.0), color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
