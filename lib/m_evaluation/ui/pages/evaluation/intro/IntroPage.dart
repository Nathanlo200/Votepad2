import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../navigation/routers.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Cliquez sur le bouton ci-dessus pour")),
              Center(child: Text("demarrer l'évalluation")),
              SizedBox(height: 18.0,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  ),
                  onPressed: () {
                    context.pushNamed(Urls.evaluation.name,);
                  },
                  child: Text("Démarrer"))
            ]));
  }
}