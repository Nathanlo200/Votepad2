import 'package:flutter/material.dart';

ListeVide(BuildContext context,Function onClick) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Image.asset("images/participants-removebg-preview.png",
            width: 200, height: 200,fit: BoxFit.cover),
      ),
      TextButton(onPressed: (){
        onClick();
      }, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Aucune ligne"), Icon(Icons.refresh)
        ],
      )),
    ],
  );
}