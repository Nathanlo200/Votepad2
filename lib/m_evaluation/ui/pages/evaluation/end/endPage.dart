import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../navigation/routers.dart';
import '../EvaluationCtrl.dart';

class EndPage extends ConsumerStatefulWidget {
  const EndPage({super.key});

  @override
  ConsumerState<EndPage> createState() => _EndPageState();
}

class _EndPageState extends ConsumerState<EndPage> {
  @override
  Widget build(BuildContext context) {
    var ctrl = ref.read(evaluationCtrlProvider.notifier);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 170,),
          Center(child: Text("Merci pour votre participation",
            style: TextStyle(
                fontSize: 17,
              fontWeight: FontWeight.w500
            ),)),
          Center(child: Text("à bientot",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500
            ),)),
          SizedBox(height: 18.0,),
          Expanded(
            flex: 1,
              child: Image.asset('images/mn.png')),
          Expanded(
            flex: 1,
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
                    ctrl.resetIntervenantAndResponses();
                    context.pushReplacementNamed(Urls.Intro.name);
                  },
                  child: Text("Retour"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
