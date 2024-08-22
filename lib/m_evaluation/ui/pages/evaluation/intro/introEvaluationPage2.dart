import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_mobile_project/m_evaluation/ui/composants/afficherMessageErreur.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(introEvaluationCtrlProvider);
    var ctrl = ref.read(introEvaluationCtrlProvider.notifier);

    return Scaffold(
        appBar: AppBar(
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
                borderRadius: BorderRadius.circular(15),
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
                                if(state.duree != null){
                                  context.pushNamed(Urls.evaluation.name,);
                                  ctrl.getDuration();
                                }
                                else{
                                  afficherMessageErreur(context, "votre participation à cette évaluation a expiré");

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
      // Customscaffold(
      //   icon: IconButton(icon: Icon(Icons.arrow_back_ios_new),
      //     onPressed: (){
      //       context.goNamed(Urls.Intro.name);
      //     },),
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: [
      //       Positioned(
      //         left: 5,
      //         right: 5,
      //         child: Card(
      //           color: Colors.black.withOpacity(0.5),
      //           child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 SizedBox(height: 20,),
      //                 Text("Votre évènement : ${state.eventNom}",
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 14
      //
      //                   ),),
      //                 Text("Phase en cours : ${state.phaseNom}",
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 14
      //
      //                   ),),
      //                 SizedBox(height: 25,),
      //                 Icon(Icons.event_available,
      //                   color: Colors.orange,
      //                   size: 28,),
      //                 SizedBox(height: 20.0,),
      //                 Center(child: Text("Cliquez sur le bouton ci-dessus pour",
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 14
      //
      //                   ),)),
      //                 Center(child: Text("commencer votre évaluation:",
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 14
      //
      //                   ),)),
      //                 SizedBox(height: 4.0,),
      //
      //                 SizedBox(height: 18.0,),
      //                 Container(
      //                   padding: EdgeInsets.symmetric(horizontal: 30),
      //                   width: double.infinity,
      //                   child: SizedBox(
      //                     width: double.infinity,
      //                     child: ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                           backgroundColor: Colors.white,
      //                           foregroundColor: Colors.black,
      //                           shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.all(Radius.circular(5.0))),
      //                         ),
      //                         onPressed: () {
      //                           context.pushNamed(Urls.evaluation.name,);
      //                         },
      //                         child: Text("Démarrer",
      //                           style: TextStyle(
      //                               color: Colors.black,
      //                               fontSize: 16
      //                           ),)),
      //                   ),
      //                 ),
      //                 SizedBox(height: 20.0,),
      //                 Center(
      //                   child: Text("Orange est là",
      //                     style: TextStyle(
      //                       color: Colors.grey,
      //                       fontSize: 8,
      //                     ),),),
      //                 SizedBox(height: 25.0,),
      //               ]),
      //
      //         ),
      //       ),
      //     ],
      //   ),
      //
      //   lead: true);
  }
}