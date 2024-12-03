import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../utilities/colors.dart';

Widget videoScreenIcons(
    {required BuildContext context,
    IconData? icon,
    String? data,
    double? top, 
    double? bottom,
    double? left,
    double? right}) {
  return Positioned(
    top: top,
    bottom: bottom,
    right: right,
    left: left,
    child: IconButton(
        onPressed: () {},
        icon:  Icon(
          icon,
          color: videoScreenIconColor,
        )),
  );
}
