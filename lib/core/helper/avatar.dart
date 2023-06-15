import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ordo_test/core/helper/colors.dart';
import 'package:ordo_test/core/helper/images.dart';

class Avatar {
  circle() {
    return CircleAvatar(
      backgroundColor: primaryColor,
      child: SvgPicture.asset(avatarImage, fit: BoxFit.cover),
    );
  }
}

Avatar avatar = Avatar();
