import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ordo_test/core/helper/colors.dart';
import 'package:ordo_test/core/helper/icon.dart';
import 'package:ordo_test/core/helper/images.dart';
import 'package:ordo_test/core/helper/languagesKey.dart';
import 'package:ordo_test/core/helper/textstyle.dart';
import 'package:ordo_test/core/helper/avatar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ordo_test/feature/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:ordo_test/feature/dashboard/presentation/widget/card.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final dashboardController = Get.put(DashboardController());
  final card = BuildCard();
  @override
  void initState() {
    dashboardController.build();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          _silverBar(),
          _pefermanceIndicatorMenu(),
        ],
      ),
    );
  }

  _silverBar() {
    return SliverAppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        floating: true,
        expandedHeight: 450,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: [
            StretchMode.zoomBackground,
          ],
          collapseMode: CollapseMode.pin,
          background: Container(
            margin: EdgeInsets.only(top: 20),
            height: 450,
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    left: 0,
                    top: 25,
                    child: Center(
                        child: Text(
                      languagesKey.titleDashboard,
                      style: mediumtextStyleWhite,
                    ))),
                Positioned(
                  right: 20,
                  top: 20,
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        icon.svg(notification, height: 25, width: 25),
                        SizedBox(
                          width: 15,
                        ),
                        avatar.circle(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [_header(), _chart(), _slidebar()],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                languagesKey.totalRevenue,
                style: normaltextStyleWhiteW400,
              ),
              Text(
                'Rp 257.500.000',
                style: largetextStyleWhite,
              ),
            ],
          ),
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              position: PopupMenuPosition.under,
              icon: icon.svg(menuCircleVertical, height: 20, width: 20),
              color: whiteColor,
              splashRadius: 20,
              initialValue: 1,
              itemBuilder: (context) => [
                    PopupMenuItem(
                        textStyle: smalltextStylePrimary,
                        value: 1,
                        child: Text('Daily')),
                    PopupMenuItem(
                      textStyle: smalltextStylePrimary,
                      child: Text('Weekly'),
                      value: 2,
                    ),
                    PopupMenuItem(
                      textStyle: smalltextStylePrimary,
                      child: Text('Monthly'),
                      value: 3,
                    ),
                  ]),
        ],
      ),
    );
  }

  _chart() {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.70,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(enabled: true),
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: false,
                drawVerticalLine: false,
                verticalInterval: 2,
                horizontalInterval: 3,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: false,
                border: Border.all(color: const Color(0xff37434d)),
              ),
              minX: 0,
              maxX: 5,
              minY: 0,
              maxY: 6,
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 3.94),
                    FlSpot(1, 3.87),
                    FlSpot(2, 3.75),
                    FlSpot(3, 3.90),
                    FlSpot(4, 3.94),
                    FlSpot(5, 3.86),
                    FlSpot(6, 3.90),
                  ],
                  isCurved: false,
                  gradient: LinearGradient(
                    colors: [
                      ColorTween(begin: whiteColor, end: whiteColor).lerp(0.2)!,
                      ColorTween(begin: whiteColor, end: whiteColor).lerp(0.2)!,
                    ],
                  ),
                  barWidth: 3,
                  dotData: FlDotData(
                    show: true,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorTween(begin: secondColor, end: secondColor)
                            .lerp(0.2)!,
                        ColorTween(begin: primaryColor, end: primaryColor)
                            .lerp(0.2)!,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: dashboardController.weekly
                  .map((day) => Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          day,
                          style: normaltextStyleWhiteW400,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  _slidebar() {
    return Obx(() => Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dashboardController.slide
                .map((element) => Container(
                      width: 26,
                      height: 4,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          color:
                              element == dashboardController.slideSelected.value
                                  ? whiteColor
                                  : whiteColor.withOpacity(.3),
                          borderRadius: BorderRadius.circular(20)),
                    ))
                .toList(),
          ),
        ));
  }

  _pefermanceIndicatorMenu() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) => Container(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              icon.svg(barChart),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                languagesKey.keyPeformance,
                                style: normaltextStyleBlack,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            height: 160,
                            child: Row(
                              children: [
                                card.menu(
                                    color: secondColor,
                                    svg: totalLead,
                                    persentase: '+35%',
                                    subtitle: 'Last Month',
                                    value: '57'),
                                SizedBox(
                                  width: 15,
                                ),
                                card.menu(
                                    color: redColor,
                                    svg: hot_lead,
                                    persentase: '-1.2%',
                                    subtitle: 'Last Month',
                                    value: '57'),
                                SizedBox(
                                  width: 15,
                                ),
                                card.menu(
                                    color: secondColor,
                                    svg: totalLead,
                                    persentase: '+35%',
                                    subtitle: 'Last Month',
                                    value: '57'),
                              ],
                            ),
                          ),
                        ),
                        _slidebarmenu(),
                        _recentLead(),
                        _leaderboard()
                      ],
                    ),
                  ),
                )));
  }

  _slidebarmenu() {
    return Obx(() => Padding(
          padding: EdgeInsets.only(top: 20, left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: dashboardController.slidemenu
                .map((element) => Container(
                      width: 26,
                      height: 4,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          color: element ==
                                  dashboardController.slideSelectedmenu.value
                              ? secondColor
                              : greyColor,
                          borderRadius: BorderRadius.circular(20)),
                    ))
                .toList(),
          ),
        ));
  }

  _recentLead() {
    return Container(
      padding: const EdgeInsets.only(top: 28, left: 30, right: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Lead',
                style: normaltextStyleBlack,
              ),
              icon.svg(next, height: 30, width: 30),
            ],
          ),
          card.listTile(
              color: secondColor,
              avatar: shinta,
              iconStatus: star,
              iconSubTitle: calenderImage,
              price: 'Rp 13.000.000',
              status: 'New Lead',
              subTitle: '31 January 2023',
              title: 'Shinta Alexandra',
              context: context),
          card.listTile(
              color: secondColor,
              avatar: vita,
              iconStatus: star,
              iconSubTitle: calenderImage,
              price: 'Rp 13.000.000',
              status: 'New Lead',
              subTitle: '31 January 2023',
              title: 'Shinta Alexandra',
              context: context),
          card.listTile(
              color: secondColor,
              avatar: meriko,
              iconStatus: star,
              iconSubTitle: calenderImage,
              price: 'Rp 13.000.000',
              status: 'New Lead',
              subTitle: '31 January 2023',
              title: 'Shinta Alexandra',
              context: context),
        ],
      ),
    );
  }

  _leaderboard() {
    return Container(
      padding: const EdgeInsets.only(top: 28, left: 30, right: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Leaderboard',
                style: normaltextStyleBlack,
              ),
              icon.svg(next, height: 30, width: 30),
            ],
          ),
          Obx(
            () => ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(),
                physics: ScrollPhysics(),
                itemCount: dashboardController.leaderboard.length,
                itemBuilder: (context, index) {
                  return card.leaderBoardCard(
                      rank: dashboardController.leaderboard[index]['rank'],
                      color: secondColor,
                      avatar: dashboardController.leaderboard[index]['image'],
                      iconSubTitle: calenderImage,
                      status: 'Deal',
                      subTitle: '31 January 2023',
                      title: dashboardController.leaderboard[index]['name'],
                      member: dashboardController.leaderboard[index]['member'],
                      context: context);
                }),
          )
        ],
      ),
    );
  }
}
