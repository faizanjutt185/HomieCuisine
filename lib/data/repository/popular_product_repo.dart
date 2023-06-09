//import 'package:Homie_Cuisine/data/api/api_client.dart';
import 'package:get/get.dart';
import '../api/api_client.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData("end point url");

  }
}