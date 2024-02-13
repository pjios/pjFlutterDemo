import '../data/network/network_api_services.dart';
import '../models/IPOList.dart';
import '../res/app_url.dart';

class IPOListRepository{
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<IpoList> getIPOList() async{
    try{
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.ipoList);
      return response = IpoList.fromJson(response);
    }catch (e){
      rethrow;
    }
  }
}