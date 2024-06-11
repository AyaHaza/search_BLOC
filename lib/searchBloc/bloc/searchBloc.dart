import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/ProductsModel.dart';
import '../service/ProductsService.dart';
import 'searchEvents.dart';
import 'searchStates.dart';

class SearchBloc extends Bloc<SearchEvents,SearchStates>{
  SearchBloc():super(intitalStateSearch()){

    on<GetProductsEvent>((event, emit)async {
      emit(LoadingProductState());
      List<Product> getProducts=await ProductsImp().getProducts();
      emit(AllProductState(products: getProducts));
    });

    on<SearchProductEvent>((event, emit) async{
      emit(LoadingProductState());
      List<Product> getProducts=await ProductsImp().getProducts();
      List<Product> searchProductsList=[];
      // print(event.productName);
      getProducts.forEach(
            (element) {
          if (element.title.contains(event.productName)) {
            searchProductsList.add(element);
          }
        },
      );
      // print(searchProductsList);
      if(searchProductsList.isNotEmpty){
        emit(SearchProductState(products:searchProductsList ));
      }else{
        emit(ErrorProductState());
      }
    });
  }
}