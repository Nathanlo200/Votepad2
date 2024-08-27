import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_mobile_project/m_evaluation/ui/composants/afficherMessageInfo.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/evaluation/EvaluationCtrl.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/evaluation/intro/IntroEvaluationCtrl.dart';
import '../../../../../navigation/routers.dart';


class IntroEvaluationPage2 extends ConsumerStatefulWidget {
  IntroEvaluationPage2({super.key});

  @override
  ConsumerState createState() => _IntroEvaluationPageState();
}


class _IntroEvaluationPageState extends ConsumerState<IntroEvaluationPage2> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // action initiale de la page et appel d'un controleur
      var ctrl = ref.read(introEvaluationCtrlProvider.notifier);
      ctrl.getPhaseAndEventName();
      ctrl.getDuration();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(introEvaluationCtrlProvider);
    var ctrl = ref.read(introEvaluationCtrlProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextButton(
                    onPressed: (){
                      ctrl.resetIntervenant();
                      context.goNamed(Urls.Intro.name);
                      afficherMessageInfo(context, "Vous etes deconnecté", Colors.red, true);
                    },
                    child: Text("se deconnecter",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFF7900).withOpacity(0.5),
                ),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: IconButton(
                onPressed: (){
                  context.goNamed(Urls.Intro.name);
                },
                icon: Icon(Icons.arrow_back_ios_rounded,
                ),
                iconSize: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFF7900).withOpacity(0.5),
              ),
            ),
          ),
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Image.asset(
                          width: 240,
                          height: 250,
                          fit: BoxFit.contain,
                          "images/egt.png",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text("Nom de l'évènement : ${state.eventNom}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold


                        ),),
                      Text("Phase en cours : ${state.phaseNom}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          fontWeight: FontWeight.bold

                        ),),
                      SizedBox(height: 20,),
                      Center(child: Text("Cliquez sur le bouton ci-dessus pour",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14

                        ),)),
                      Center(child: Text("commencer votre évaluation",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14

                        ),)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        width: double.infinity,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                              ),
                              onPressed: () {
                                if(state.duree != null || state.duree != 0){
                                  context.pushNamed(Urls.evaluation.name,);
                                }
                                else{
                                  afficherMessageInfo(context, "votre participation à cette évaluation a expiré", Colors.orange, true);
                                  context.pushNamed(Urls.introEvaluation.name,);
                                }
                              },
                              child: Text("Démarrer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );;

  }
}