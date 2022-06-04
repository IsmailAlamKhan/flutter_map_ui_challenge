import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Avatar(image: NetworkImage('https://i.pravatar.cc/150?img=49')),
      centerTitle: true,
      actions: [IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {})],
    );
  }
}
