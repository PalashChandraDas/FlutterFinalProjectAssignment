import 'package:final_project/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // final HomeScreenController _controller = HomeScreenController();
  final HomeScreenController _controller = Get.put(HomeScreenController());
  // final HomeScreenController _controller2 = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    // print('BuildMethod');

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Obx(() => Text('${_controller.myValue.value}')),
        ),
      ),
      body: Obx(() => ListView.builder(
            itemCount: _controller.postList.length,
            itemBuilder: (c, i) => ListTile(
              onTap: () {
                _controller.removeItem(i);
              },
              onLongPress: () {
                _controller.updateItem(i);
              },
              title: Text(_controller.postList[i].title.toString()),
            ),
          )),
      bottomSheet: Container(
        height: 60,
        color: Colors.grey,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (c, i) => InkWell(
                onTap: (){
                  debugPrint('${i+1}');
                },
                child: Chip(label: Text('${i+1}')),
            ),
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _controller.increment();
          Get.find<HomeScreenController>().increment();
        },

        child: const Text('Add'),
      ),

       */
    );
  }
}
