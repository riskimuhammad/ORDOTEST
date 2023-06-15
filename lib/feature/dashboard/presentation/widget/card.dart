import 'package:flutter/material.dart';
import 'package:ordo_test/core/helper/colors.dart';
import 'package:ordo_test/core/helper/icon.dart';
import 'package:ordo_test/core/helper/languagesKey.dart';
import 'package:ordo_test/core/helper/textstyle.dart';

class BuildCard {
  menu({value, subtitle, svg, String? persentase, Color? color, style}) {
    return Container(
      height: 130,
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: secondColor.withOpacity(.3),
              blurRadius: 10,
              offset: Offset(3, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: CircleAvatar(
                  backgroundColor: color!.withOpacity(.4),
                  child: icon.svg(svg, height: 10, width: 10),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                languagesKey.totalLead,
                style: smalltextStyleBlack,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: largetextStyleBlack_Fz27,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                subtitle,
                style: smalltextStyleGrey,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                persentase!,
                style: persentase.contains('-')
                    ? smalltextStyleRedW500
                    : smalltextStyleBlackW500,
              ),
            ],
          )
        ],
      ),
    );
  }

  listTile(
      {title,
      subTitle,
      color,
      iconSubTitle,
      iconStatus,
      status,
      avatar,
      price,
      context}) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border(
              bottom: BorderSide(color: greyColor.withOpacity(.3), width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: icon.svg(avatar, height: 60, width: 60, isRadius: true),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: normaltextStyleBlack,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      icon.svg(iconSubTitle),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        subTitle,
                        style: smalltextStyleGrey,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 100,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon.svg(iconStatus),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      status,
                      style: smalltextStyleWhite,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                price,
                style: normaltextStyleBlack,
              )
            ],
          )
        ],
      ),
    );
  }

  leaderBoardCard(
      {rank,
      title,
      subTitle,
      color,
      iconSubTitle,
      avatar,
      member,
      status,
      context}) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border(
              bottom: BorderSide(color: greyColor.withOpacity(.3), width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                rank,
                style: largetextStylePrimary,
              ),
              SizedBox(
                width: 18,
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: icon.svg(avatar, height: 60, width: 60, isRadius: true),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: normaltextStyleBlack,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      icon.svg(iconSubTitle),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        subTitle,
                        style: smalltextStyleGrey,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                member,
                style: normaltextStylePrimary,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                status,
                style: smalltextStyleGrey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
