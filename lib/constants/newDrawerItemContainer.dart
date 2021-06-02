
import 'package:flutter/material.dart';

itemContainer(String title,int count) {
 return Container(

    child: ListTile(
      title: Text(title),
      trailing: Material(

        borderRadius: BorderRadius.circular(50.0),
        elevation: 6.0,
        child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(count.toString(), style: TextStyle(fontSize: 20.0),)),
      ),

    ),
  );
}