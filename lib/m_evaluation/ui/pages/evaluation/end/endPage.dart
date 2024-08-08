import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../../navigation/routers.dart';

class EndPage extends StatelessWidget {
  const EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Merci pour votre participation")),
          Center(child: Text("à bientot")),
          SizedBox(height: 18.0,),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              ),
              onPressed: (){
                while(context.canPop()){
                  context.pop();
                }
                context.pushReplacement(Urls.evaluationAuth.name);
              },
              child: Text("Retour"),
            ),
          )
        ],
      ),
    );
  }
}
