
abstract class SearchEvents{}

class GetProductsEvent extends SearchEvents{}

class SearchProductEvent extends SearchEvents{
  String productName;
  SearchProductEvent({required this.productName});
}