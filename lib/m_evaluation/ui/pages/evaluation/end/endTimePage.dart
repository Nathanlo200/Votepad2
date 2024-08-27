import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../navigation/routers.dart';
import '../EvaluationCtrl.dart';

class EndTimePage extends ConsumerStatefulWidget {
  const EndTimePage({super.key});

  @override
  ConsumerState<EndTimePage> createState() => _EndTimePageState();
}

class _EndTimePageState extends ConsumerState<EndTimePage> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(evaluationCtrlProvider);
    var ctrl = ref.read(evaluationCtrlProvider.notifier);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 130,),
          Center(child: Text("Merci pour votre participation",
            style: TextStyle(
                fontSize: 15,
              fontWeight: FontWeight.w400,
            ),)),
          // SizedBox(height: 5,),
          Center(child: Text("Votre temps est écoulé",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),)),
          SizedBox(height: 15.0,),
          Center(child: Text("Vous avez repondu à ${state.reponsesChoices?.length} question sur ${state.questions.length}",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),)),
          SizedBox(height: 28.0,),
          Expanded(
            flex: 2,
              child: Image.asset('images/ms.png',
              fit: BoxFit.contain,
              width: 270,
              height: 260,)),
          SizedBox(height: 18,),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  ),
                  onPressed: (){
                    context.pushReplacementNamed(Urls.Intro.name);
                  },
                  child: Text("Retour",
                    style: TextStyle(
                        fontSize: 16
                    ), ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // _boutonRetour() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 30),
  //     width: double.infinity,
  //     child:
  //     SizedBox(
  //       width: double.infinity,
  //       child: ElevatedButton(
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.white,
  //           foregroundColor: Colors.black,
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(5.0))),
  //         ),
  //         onPressed: () async {
  //             context.pushNamed(Urls.evaluationAuth.name);
  //             return;
  //           }
  //
  //         child: Text("Passer une évaluation",
  //           style: TextStyle(
  //               fontSize: 16
  //           ),),
  //       ),
  //     ),
  //
  //   );
  // }
}
