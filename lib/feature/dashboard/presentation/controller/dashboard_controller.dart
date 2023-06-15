import 'package:get/get.dart';
import 'package:ordo_test/core/helper/images.dart';

class DashboardController extends GetxController {
  final weekly = [].obs;
  final slide = [].obs;
  final slidemenu = [].obs;
  final slideSelected = 2.obs;
  final slideSelectedmenu = 2.obs;
  final onStretchTrigger = false.obs;
  final totalLead = 0.obs;
  final leaderboard = [].obs;
  void build() {
    weekly.value = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    leaderboard.value = [
      {
        'name': 'Shinta Alexandra',
        'image': shinta,
        'rank': '1',
        'member': '45'
      },
      {'name': 'Shinta Alexandra', 'image': vita, 'rank': '2', 'member': '41'},
      {'name': 'Shinta Alexandra', 'image': vita, 'rank': '3', 'member': '34'},
      {
        'name': 'Shinta Alexandra',
        'image': meriko,
        'rank': '4',
        'member': '30'
      },
      {
        'name': 'Shinta Alexandra',
        'image': meriko,
        'rank': '5',
        'member': '25'
      },
    ];
    slide.value = [1, 2, 3];
    slidemenu.value = [1, 2, 3];
    totalLead.value = 57;
  }

  void onStretchTriggerBuild() {
    onStretchTrigger.value = true;
  }
}
