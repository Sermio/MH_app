import 'package:flutter/material.dart';

class Cappbar extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> scaffoldKey;

  const Cappbar(
      {
      // required this.scaffoldKey,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      flexibleSpace: const Image(
        image: NetworkImage(
          'https://imgs.search.brave.com/zhv-L9v2fmQDgEQq2MmUzlCnei_-wFyLnBgOoxJkTjk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZS5hcGkucGxheXN0/YXRpb24uY29tL3Z1/bGNhbi9pbWcvY2Zu/LzExMzA3bFd1VWhN/SUs4bHZrbEdMc2Vm/Wi1jdE5nTzdmeVlH/aGEzQUpEM1A2Y2RQ/TURtQUpoSmxkRU5m/dUxaTGJfYmdnVVhV/TFl5TndYVWVSZjZo/ZG85bWRhOTh5aGFQ/VS5wbmc',
        ),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
