import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:final_project/models/my_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../models/json_holder_data.dart';

import '../utils/apis.dart';

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

    // _fetchPostData();
    // _postDataToJsonHolder();
    // _putDataToJsonHolder();
    // _patchDataToJsonHolder();
    _deletedDataToJsonHolder();

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

  /*
  Future<void> _fetchPostData() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

     try{

       if (connectivityResult == ConnectivityResult.none) {
         debugPrint('No Internet!!');
         // EasyLoading.showError('No Internet Connection');
       } else {
         debugPrint('Internet Connected');
         EasyLoading.show(status: 'loading...');
       }

       var response = await dio.get(Apis.getJsonHolderPostData);
       if(response.statusCode == 200){
         EasyLoading.showSuccess('Great Success!');
         debugPrint('HTTP Method: ${response.requestOptions.method}');
         debugPrint('HTTP URL: ${response.requestOptions.baseUrl}');
         debugPrint('HTTP Path: ${response.requestOptions.path}');//endPoint
         debugPrint('HTTP Status code: ${response.statusCode}');
         debugPrint('HTTP Status Message: ${response.statusMessage}');
         // debugPrint(response.data.toString());


         var myPostData = response.data as List;
         var newList = myPostData.map((e) => JsonHolderData.fromJson(e)).toList();

         postList.addAll(newList);
         debugPrint('POST LIST LENGTH---> ${postList.length}');

       } else {
         debugPrint('Failed to load data');
         EasyLoading.showToast('No Connection!', duration: const Duration(seconds: 2), toastPosition: EasyLoadingToastPosition.bottom);
       }

     } catch(e) {
       debugPrint('Error occurred: $e');
       EasyLoading.showError('Failed  to load data');

     } finally {
       EasyLoading.dismiss();
     }
  }



  Future<void> _postDataToJsonHolder() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

     try{

       if (connectivityResult == ConnectivityResult.none) {
         debugPrint('No Internet!!');
         // EasyLoading.showError('No Internet Connection');
       } else {
         debugPrint('Internet Connected');
         EasyLoading.show(status: 'loading...');
       }

       var response = await dio.post(Apis.getJsonHolderPostData, data: {
         'userId' : '10',
         'title' : 'my title',
         'body' : 'my body',
       });
       if(response.statusCode == 201){
         EasyLoading.showSuccess('Great Success!');
         debugPrint('HTTP Method: ${response.requestOptions.method}');
         debugPrint('HTTP URL: ${response.requestOptions.baseUrl}');
         debugPrint('HTTP Path: ${response.requestOptions.path}');//endPoint
         debugPrint('HTTP Status code: ${response.statusCode}');
         debugPrint('HTTP Status Message: ${response.statusMessage}');
         // debugPrint(response.data.toString());


         var myPostData = response.data;
         EasyLoading.showToast('Data loaded successfully at:\n${myPostData['id']}', duration: const Duration(seconds: 2), toastPosition: EasyLoadingToastPosition.bottom);


       } else {
         debugPrint('Failed to load data');
       }

     } catch(e) {
       debugPrint('Error occurred: $e');
       EasyLoading.showError('Failed  to load data');

     } finally {
       EasyLoading.dismiss();
     }
  }


  Future<void> _putDataToJsonHolder() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

     try{
       if (connectivityResult == ConnectivityResult.none) {
         debugPrint('No Internet!!');
         EasyLoading.showError('No Internet Connection');
       } else {
         debugPrint('Internet Connected');
         EasyLoading.show(status: 'loading...');
       }

       var response = await dio.put('${Apis.getJsonHolderPostDataByPostId}50', data: {
         'userId' : '10',
         'title' : 'my title',
         'body' : 'my body',
       });
       if(response.statusCode == 200){
         EasyLoading.showSuccess('Great Success!');
         debugPrint('HTTP Method: ${response.requestOptions.method}');
         debugPrint('HTTP URL: ${response.requestOptions.baseUrl}');
         debugPrint('HTTP Path: ${response.requestOptions.path}');//endPoint
         debugPrint('HTTP Status code: ${response.statusCode}');
         debugPrint('HTTP Status Message: ${response.statusMessage}');
         // debugPrint(response.data.toString());


         var myPostData = response.data;
         EasyLoading.showToast('Updated successfully at:\n${myPostData['id']}', duration: const Duration(seconds: 2), toastPosition: EasyLoadingToastPosition.bottom);


       } else {
         debugPrint('Failed to load data');
       }

     } catch(e) {
       debugPrint('Error occurred: $e');
       EasyLoading.showError('Failed to load data');

     } finally {
       EasyLoading.dismiss();
     }
  }


  void _patchDataToJsonHolder() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

     try{
       if (connectivityResult == ConnectivityResult.none) {
         debugPrint('No Internet!!');
         EasyLoading.showError('No Internet Connection');
       } else {
         debugPrint('Internet Connected');
         EasyLoading.show(status: 'loading...');
       }

       var response = await dio.patch('${Apis.getJsonHolderPostDataByPostId}25', data: {
         'userId' : '10',
         'title' : 'my title',
         'body' : 'my body',
       });
       if(response.statusCode == 200){
         EasyLoading.showSuccess('Great Success!');
         debugPrint('HTTP Method: ${response.requestOptions.method}');
         debugPrint('HTTP URL: ${response.requestOptions.baseUrl}');
         debugPrint('HTTP Path: ${response.requestOptions.path}');//endPoint
         debugPrint('HTTP Status code: ${response.statusCode}');
         debugPrint('HTTP Status Message: ${response.statusMessage}');
         // debugPrint(response.data.toString());


         var myPostData = response.data;
         EasyLoading.showToast('Updated successfully at:\n${myPostData['id']}', duration: const Duration(seconds: 2), toastPosition: EasyLoadingToastPosition.bottom);


       } else {
         debugPrint('Failed to load data');
       }

     } catch(e) {
       debugPrint('Error occurred: $e');
       EasyLoading.showError('Failed to load data');

     } finally {
       EasyLoading.dismiss();
     }
  }

   */


  Future<void> _deletedDataToJsonHolder() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

     try{
       if (connectivityResult == ConnectivityResult.none) {
         debugPrint('No Internet!!');
         EasyLoading.showError('No Internet Connection');
       } else {
         debugPrint('Internet Connected');
         EasyLoading.show(status: 'loading...');
       }

       var response = await dio.delete('${Apis.getJsonHolderPostDataByPostId}19',);
       if(response.statusCode == 200){
         EasyLoading.showSuccess('Great Success!');
         debugPrint('HTTP Method: ${response.requestOptions.method}');
         debugPrint('HTTP URL: ${response.requestOptions.baseUrl}');
         debugPrint('HTTP Path: ${response.requestOptions.path}');//endPoint
         debugPrint('HTTP Status code: ${response.statusCode}');
         debugPrint('HTTP Status Message: ${response.statusMessage}');
         // debugPrint(response.data.toString());


         var myPostData = response.data;
         EasyLoading.showToast('Record deleted successfully', duration: const Duration(seconds: 2), toastPosition: EasyLoadingToastPosition.bottom);


       } else {
         debugPrint('Failed to load data');
       }

     } catch(e) {
       debugPrint('Error occurred: $e');
       EasyLoading.showError('Failed to load data');

     } finally {
       EasyLoading.dismiss();
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
