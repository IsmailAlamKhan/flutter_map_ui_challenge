import 'package:flutter/material.dart';

class AdventureDetailBottomNavbar extends StatelessWidget {
  const AdventureDetailBottomNavbar({super.key});

  static const height = 80.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.white,
              Colors.white.withAlpha(10),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: const [
              AdventureDetailBottomNavButton(
                color: Color(0xFFf63c01),
                icon: Icons.favorite,
              ),
              SizedBox(width: 8),
              AdventureDetailBottomNavButton(
                color: Color(0xFF524ae7),
                icon: Icons.assistant_navigation,
              ),
              SizedBox(width: 8),
              Expanded(
                child: AdventureDetailBottomNavButton(
                  color: Color(0xFF53cba7),
                  text: 'Book Now',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdventureDetailBottomNavButton extends StatelessWidget {
  const AdventureDetailBottomNavButton({
    super.key,
    this.icon,
    this.text,
    this.onTap,
    required this.color,
  });

  final IconData? icon;
  final String? text;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );
    final backgroundColor = colors.secondary;
    final isIconButton = icon != null;
    OutlinedBorder shape;
    if (isIconButton) {
      shape = const CircleBorder();
    } else {
      shape = const StadiumBorder();
    }

    return Material(
      color: backgroundColor,
      shape: shape.copyWith(side: BorderSide(color: color)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: isIconButton
                ? Icon(icon, color: color)
                : Text(
                    text!,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
