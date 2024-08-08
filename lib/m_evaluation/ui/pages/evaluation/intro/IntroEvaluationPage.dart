import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/IntroPage/IntroCtrl.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/evaluation/intro/IntroEvaluationCtrl.dart';
import '../../../../../navigation/routers.dart';


class IntroEvaluationPage extends ConsumerStatefulWidget {
  IntroEvaluationPage({super.key});

  @override
  ConsumerState createState() => _IntroEvaluationPageState();
}


class _IntroEvaluationPageState extends ConsumerState<IntroEvaluationPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // action initiale de la page et appel d'un controleur
      var ctrl = ref.read(introEvaluationCtrlProvider.notifier);
      ctrl.getPhasename();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(introEvaluationCtrlProvider);
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Cliquez sur le bouton ci-dessus pour")),
              Center(child: Text("demarrer votre évaluation")),
              SizedBox(height: 8.0,),
              Center(child: Text("${state.phaseNom}",
              style: TextStyle(
                fontWeight: FontWeight.w800
              ),)),
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