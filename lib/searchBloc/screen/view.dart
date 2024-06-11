
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/searchBloc.dart';
import '../bloc/searchEvents.dart';
import '../bloc/searchStates.dart';
import '../config/constant.dart';
import '../widgets/listTileCustom.dart';
import '../widgets/srachCustom.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc()..add(GetProductsEvent()),
      child: Builder(
          builder: (context) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Constant.primaryColor,image:DecorationImage(opacity: 80,fit:BoxFit.fill,image: AssetImage('images/back.png'))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140,
                      width: 800,
                      // color: Colors.cyan,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Constant.primaryColor),
                              child: Icon(Icons.arrow_back_ios_new,color: Constant.white,),
                            ),
                            Text("Prouducts",style: TextStyle(color: Constant.white,fontSize: 30),),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Constant.primaryColor),
                              child: Icon(Icons.delete,color: Constant.white,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                      child: TextFiledSrarchCustom("Search here..", Icons.search, Icons.mic,(value){context.read<SearchBloc>().add(SearchProductEvent(productName: value));}),
                    ),

                    Expanded(
                      child: BlocBuilder<SearchBloc,SearchStates>(
                        builder: (context, state) {
                          if(state is AllProductState){
                            return ListView.builder(
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return ListTileCustom(index,state);
                              },
                            );
                          }else if(state is SearchProductState){
                            return ListView.builder(
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return ListTileCustom(index,state);
                              },
                            );
                          }else if(state is ErrorProductState){
                            return Center(child: Text("There isn't any products with this name ..",style: TextStyle(color: Constant.secondColor,fontSize: 14),),);
                          }else if(state is LoadingProductState){
                            return Center(child: CircularProgressIndicator(color: Constant.secondColor,));
                          }else{
                            return Container();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
