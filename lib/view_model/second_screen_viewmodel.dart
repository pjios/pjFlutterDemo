import 'package:flutter/cupertino.dart';

import '../data/response/api_response.dart';
import 'package:pj_demoflutterapp/models/IPODetails.dart';
import '../repository/IPODetailsRepository.dart';

class SecondScreenViewModel with ChangeNotifier{
  final _ipoDetailsRepo = IPODetailsRepository();

  ApiResponse<IpoDetails> ipoDetailsList = ApiResponse.loading();

  setIPODetailsList(ApiResponse<IpoDetails> response){
    ipoDetailsList = response;
    notifyListeners();
  }

  Future<void> fetchIPODetailsListApi() async{
    await _ipoDetailsRepo.getIPODetails().then((value){
      setIPODetailsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
       setIPODetailsList(ApiResponse.error(error.toString())));
  }
}