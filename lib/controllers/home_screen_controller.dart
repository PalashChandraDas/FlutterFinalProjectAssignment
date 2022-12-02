import 'package:dio/dio.dart';
import 'package:final_project/models/my_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/json_holder_data.dart';

class HomeScreenController extends GetxController {
  var myValue = 0.obs;
  var appBarName = ''.obs;
  var cgpa = 0.0.obs;
  var myUserList = <String>[].obs;
  var myMap = {}.obs;
  var isActive = false.obs;
  var userModel = <MyUserModel>[].obs;

  var postList = <JsonHolderData>[].obs;



  @override
  void onInit() {
    debugPrint('OnInit Method Called');
    cgpa.value = 3.5;

    _fetchPostData();
    // _fetchPostDataPara();

    super.onInit();
  }

  @override
  void onClose() {
    cgpa.close();
    debugPrint('OnClose Method Called');
    super.onClose();
  }


  //CUSTOM_METHOD_HERE...
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



  Future<void> _fetchPostData() async {
    var myUrl = 'https://jsonplaceholder.typicode.com';

    Dio dio = Dio(BaseOptions(
      baseUrl: myUrl,
    ));

     var response = await dio.get('/posts');

     if(response.statusCode == 200){
       debugPrint('HTTP Method: ${response.requestOptions.method}');
       debugPrint('HTTP URL: ${response.requestOptions.baseUrl}');
       debugPrint('HTTP Path: ${response.requestOptions.path}');//endPoint
       debugPrint('HTTP Status code: ${response.statusCode}');
       debugPrint('HTTP Status Message: ${response.statusMessage}');
       debugPrint(response.data.toString());


       var myPostData = response.data as List;
       var newList = myPostData.map((e) => JsonHolderData.fromJson(e)).toList();

       postList.addAll(newList);
       debugPrint('POST LIST LENGTH---> ${postList.length}');

     } else {
       debugPrint('Failed to load data');
     }
  }


  /*
  Future<void> _fetchPostDataPara() async {
    var myUrl = 'https://randomuser.me';

    Dio dio = Dio(BaseOptions(
      baseUrl: myUrl,
    ));

     var response = await dio.get('/api/', queryParameters: {
       'result' : '1',
       // 'result' : '2',
       // 'result' : '3',
     });


     if(response.statusCode == 200){
       debugPrint('HTTP Method: ${response.requestOptions.method}');
       debugPrint('HTTP URL: ${response.requestOptions.baseUrl}');
       debugPrint('HTTP QueryParameter: ${response.requestOptions.queryParameters}');//parameter
       debugPrint('HTTP Path: ${response.requestOptions.path}');//endPoint
       debugPrint('HTTP Status code: ${response.statusCode}');
       debugPrint('HTTP Status Message: ${response.statusMessage}');
       debugPrint(response.data.toString());

     } else {
       debugPrint('Failed to load data');
     }
  }

   */
}
