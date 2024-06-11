import '../Model/ProductsModel.dart';

abstract class SearchStates{}

class intitalStateSearch extends SearchStates{}

class AllProductState extends SearchStates{
  List<Product> products;
  AllProductState({required this.products});
}

class SearchProductState extends SearchStates{
  List<Product> products;
  SearchProductState({required this.products});
}

class ErrorProductState extends SearchStates{}
class LoadingProductState extends SearchStates{}