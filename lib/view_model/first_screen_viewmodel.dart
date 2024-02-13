import 'package:flutter/cupertino.dart';

import '../data/response/api_response.dart';
import 'package:pj_demoflutterapp/models/IPOList.dart';
import '../repository/IPOListRepository.dart';

class FirstScreenViewModel with ChangeNotifier {
  final _ipoListRepo = IPOListRepository();

  ApiResponse<IpoList> ipoList = ApiResponse.loading();

  setIPOList(ApiResponse<IpoList> response){
    ipoList = response;
    notifyListeners();
  }

  Future<void> fetchIPOListApi() async{
    await _ipoListRepo.getIPOList().then((value){
      setIPOList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setIPOList(ApiResponse.error(error.toString())));
  }
}
