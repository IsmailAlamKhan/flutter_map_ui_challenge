import 'package:flutter/material.dart';

class AdventureDetailInfoSection extends StatelessWidget {
  const AdventureDetailInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          AdventureDetailInfoItem(icon: Icons.verified_user, text: 'Verified User'),
          AdventureDetailInfoItem(icon: Icons.playlist_add_check_circle, text: 'Roadtrip Plan'),
          AdventureDetailInfoItem(icon: Icons.food_bank, text: 'Breakfast Included'),
        ],
      ),
    );
  }
}

class AdventureDetailInfoItem extends StatelessWidget {
  const AdventureDetailInfoItem({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(height: 8),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
