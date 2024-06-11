import 'package:dio/dio.dart';
import '../Model/ProductsModel.dart';

abstract class Servic{
  Dio dio =Dio();
  late Response response;
}

abstract class ProductsService extends Servic{
  String basUrl='https://dummyjson.com/products';

  Future<List<Product>> getProducts();
}

class ProductsImp extends ProductsService{
  @override
  Future<List<Product>> getProducts()async{
    try{
      response=await dio.get(basUrl);
      List<Product>products=List.generate(response.data["products"].length, (index) => Product.fromJson(response.data["products"][index]));
      return products;
    }catch(e){
      print(e);
      return [];
    }
  }

}