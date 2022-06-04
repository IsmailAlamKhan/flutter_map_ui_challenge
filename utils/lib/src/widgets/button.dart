import 'package:flutter/material.dart';

enum ButtonType { elevated, filled, filledTonal, text, outlined }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    this.onPressed,
    this.type = ButtonType.filled,
    this.style,
    this.icon,
  });

  final Widget child;
  final Widget? icon;
  final ButtonType type;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  ButtonStyle? _getStyle(
    BuildContext context,
    ButtonStyle? widgetStyle,
    ButtonType type,
  ) {
    ButtonStyle? style;
    if (widgetStyle != null || type == ButtonType.text || type == ButtonType.outlined) {
      return widgetStyle;
    }
    switch (type) {
      case ButtonType.elevated:
      case ButtonType.filled:
      case ButtonType.filledTonal:
        if (type == ButtonType.filled) {
          style = ElevatedButton.styleFrom(
            onPrimary: Theme.of(context).colorScheme.onPrimary,
            primary: Theme.of(context).colorScheme.primary,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0));
        } else if (type == ButtonType.filledTonal) {
          style = ElevatedButton.styleFrom(
            onPrimary: Theme.of(context).colorScheme.onSecondaryContainer,
            primary: Theme.of(context).colorScheme.secondaryContainer,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0));
        }
        if (widgetStyle != null && style != null) {
          style = style.merge(widgetStyle);
        }
        break;
      default:
    }
    return style;
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle? style = _getStyle(context, this.style, type);
    switch (type) {
      case ButtonType.elevated:
      case ButtonType.filled:
      case ButtonType.filledTonal:
        if (icon != null) {
          return ElevatedButton.icon(
            onPressed: onPressed,
            style: style,
            label: child,
            icon: icon!,
          );
        }
        return ElevatedButton(onPressed: onPressed, style: style, child: child);
      case ButtonType.text:
        if (icon != null) {
          return TextButton.icon(
            onPressed: onPressed,
            style: style,
            label: child,
            icon: icon!,
          );
        }
        return TextButton(onPressed: onPressed, style: style, child: child);
      case ButtonType.outlined:
        if (icon != null) {
          return OutlinedButton.icon(
            onPressed: onPressed,
            style: style,
            label: child,
            icon: icon!,
          );
        }
        return OutlinedButton(onPressed: onPressed, style: style, child: child);
    }
  }
}

class FilledButton extends AppButton {
  const FilledButton({
    super.key,
    required super.child,
    super.onPressed,
    super.type = ButtonType.filled,
    super.style,
  }) : super();

  const FilledButton.icon({
    super.key,
    required Widget label,
    super.onPressed,
    super.type = ButtonType.filled,
    super.style,
    required super.icon,
  }) : super(child: label);
}

class FilledTonalButton extends AppButton {
  const FilledTonalButton({
    super.key,
    required super.child,
    super.onPressed,
    super.type = ButtonType.filledTonal,
    super.style,
  }) : super();

  const FilledTonalButton.icon({
    super.key,
    required Widget label,
    super.onPressed,
    super.type = ButtonType.filledTonal,
    super.style,
    required super.icon,
  }) : super(child: label);
}
