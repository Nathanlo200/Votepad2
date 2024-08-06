import 'package:flutter/material.dart';

QuestionNotFound(BuildContext context,Function onClick) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Image.asset("images/jpng.png",
            width: 200, height: 200,fit: BoxFit.contain),
      ),
      TextButton(onPressed: (){
        onClick();
      }, child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Aucune question chargée"),
          Text("veuillez actualiser la page"),
          Icon(Icons.refresh)
        ],
      )),
    ],
  );
}