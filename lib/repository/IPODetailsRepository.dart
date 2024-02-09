import '../data/network/network_api_services.dart';
import '../models/IPODetails.dart';
import '../res/app_url.dart';

class IPODetailsRepository{
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<IpoDetails> getIPODetails() async{
    try{
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.ipoDetails);
      return response = IpoDetails.fromJson(response);
    }catch (e){
      rethrow;
    }
  }
}