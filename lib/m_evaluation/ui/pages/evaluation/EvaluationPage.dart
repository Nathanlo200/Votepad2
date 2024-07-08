import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/evaluation/EvaluationCtrl.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../../../navigation/routers.dart';

class EvaluationPage extends ConsumerStatefulWidget {
  const EvaluationPage({super.key});

  @override
  ConsumerState createState() => _EvaluationPage();
}

class _EvaluationPage extends ConsumerState<EvaluationPage> {
  var key = "RESPONSES";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // action initiale de la page et appel d'un controleur
      var ctrl = ref.read(evaluationCtrlProvider.notifier);
      ctrl.getReponses();
      ctrl.getQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
          ),
        ],
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title: Text(
          'Evaluation',
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _mainContent(),
          SizedBox(
            height: 20,
          ),
          //,
        ],
      ),
    );
  }

  _myProgressBar() {
    var state = ref.watch(evaluationCtrlProvider);
    //var ctrl = ref.read(evaluationCtrlProvider.notifier);
    return LinearProgressBar(
      maxSteps: state.questions.length,
      //questions.length,
      progressType: LinearProgressBar.progressTypeLinear,
      currentStep: state.currentIndex,
      progressColor: Colors.green,
      backgroundColor: Colors.grey.shade300,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      semanticsLabel: "Label",
      semanticsValue: "Value",
      minHeight: 6,
    );
  }

  _mainContent() {
    var state = ref.watch(evaluationCtrlProvider);
    var ctrl = ref.read(evaluationCtrlProvider.notifier);
    var question = state.maQuestion;
    var selectedValue = state.reponsesChoices?[state.maQuestion?.id] ?? -1;

    return Card(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                      "QUESTIONS : ${state.currentIndex}/${state.questions.length}"),
                  SizedBox(
                    height: 15.0,
                  ),
                  _myProgressBar(),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    question?.libelle ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        shrinkWrap: true,
                        itemCount: state.assertions.length,
                        itemBuilder: (ctx, index) {
                          var assertions = state.assertions[index].id;
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: RadioListTile(
                                activeColor: Colors.orange,
                                title: Text("${index + 1}." +
                                    " ${state.assertions[index].libelle}"),
                                value: assertions,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  ctrl.selectAnswer(value!);
                                  print("valeur selectionnée $value");
                                }),
                          );
                        }),
                  ),
                  _myButton(),
                ])));
  } // end main content

  _myButton() {
    //var state=ref.watch(evaluationCtrlProvider);
    var state = ref.watch(evaluationCtrlProvider);
    var ctrl = ref.read(evaluationCtrlProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(
            visible: state.backButtonVsible,
            child: FloatingActionButton.extended(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              onPressed: () => ctrl.nextPreviousQuestion(-1),
              label: Text('retour'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(
            visible: state.submitVisible,
            child: FloatingActionButton.extended(
              heroTag: "btn1",
              icon: Icon(
                Icons.check_circle_outlined,
            color: Colors.white,
              ),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              onPressed: () {
                // Fin du quiz
                ctrl.postAnswers();
                context.pushNamed(Urls.EvaluationFinalStep.name);
                // showDialog(
                //   context: context,
                //   builder: (context) => AlertDialog(
                //     title: Text("Fin de l'évaluation"),
                //     content:
                //         Text("Merci pour votre participation\n à la prochaine"),
                //     actions: [
                //       ElevatedButton(
                //         onPressed: () {
                //
                //           //ctrl.postAnswers();
                //         },
                //         child: Text('Quitter'),
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.green,
                //           foregroundColor: Colors.white,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(4.0)),
                //         ),
                //       ),
                //     ],
                //   ),
                // );

              },
              label: Text('soumettre les résultats'),

            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(
            visible: state.nextButtonVisible,
            child: FloatingActionButton.extended(
              heroTag: "btn2",
              icon: Icon(Icons.arrow_forward,
                color: Colors.white,),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              onPressed: (){
                ctrl.nextPreviousQuestion(1);
              },
              label: Text('suivant'),),
          ),
        ),
      ],
    );
  }

  _chargement(BuildContext context) {
    var state = ref.watch(evaluationCtrlProvider);
    return Visibility(
        visible: state.isLoading, child: CircularProgressIndicator());
  }
}
