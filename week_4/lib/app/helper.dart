import 'package:flutter/widgets.dart';

bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width < 600;
bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width > 600 && MediaQuery.of(context).size.width < 1200;
