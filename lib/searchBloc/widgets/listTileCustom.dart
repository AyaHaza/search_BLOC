import 'package:flutter/material.dart';
import '../config/constant.dart';

Widget ListTileCustom( index, state){
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: ListTile(
      leading:  Image.network(state.products[index].images[0]),
      title: Text(state.products[index].title,style: TextStyle(color: Constant.white,fontSize: 18),),
      subtitle: Text(state.products![index].description,style: TextStyle(color: Colors.grey,fontSize: 18),),
      trailing: Text(state.products![index].price.toString()+" \$",style: TextStyle(color: Constant.secondColor,fontSize: 18),),

    ),
  );
}