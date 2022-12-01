import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var myValue = 0.obs;
  var appBarName = ''.obs;
  var cgpa = 0.0.obs;
  var myUserList = <String>[].obs;
  var myMap = {}.obs;
  var isActive = false.obs;

  void increment() {
    myValue.value++;
    myUserList.add('item-> ${myValue.value}');
  }

  void removeItem(int i) {
    myUserList.removeAt(i);
  }

  void updateItem(int i) {
    myUserList[i] = 'Palash';
  }
}
