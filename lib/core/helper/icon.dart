import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Icon {
  svg(String? svg, {double? height, double? width, isRadius}) {
    return Container(
      height: height,
      width: width,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(isRadius == true ? 10 : 0),
          child: SvgPicture.asset(svg!)),
    );
  }
}

Icon icon = Icon();
