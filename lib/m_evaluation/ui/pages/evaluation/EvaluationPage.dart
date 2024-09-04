import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_countdown_timer/countdown_text_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/evaluation/EvaluationCtrl.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/evaluation/questionNotFound.dart';
import '../../../../navigation/routers.dart';
import '../../composants/afficherMessageInfo.dart';

class EvaluationPage extends ConsumerStatefulWidget {
  const EvaluationPage({super.key});

  @override
  ConsumerState createState() => _EvaluationPage();
}

class _EvaluationPage extends ConsumerState<EvaluationPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // action initiale de la page et appel d'un controleur
      var ctrl = ref.read(evaluationCtrlProvider.notifier);
      ctrl.getReponses();

      ctrl.getQuestions2();
      //ctrl.getQuestions(authCtrl.phaseId);

    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(evaluationCtrlProvider);
    var ctrl = ref.read(evaluationCtrlProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: (){
              context.goNamed(Urls.Intro.name);
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
            ),
            iconSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: PopScope(
              canPop: false,
              onPopInvoked: ((didPop){
                if(didPop){
                  return;
                }
                _showAlert(context);
              }),
              child: TextButton(
                  onPressed: ()=>_showAlert(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Text("Quitter",
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                      Icon(Icons.arrow_forward,
                        color: Colors.white,
                        size: 16.0,),
                    ],
                  ),
              ),
            ),
          ),
        ],
        toolbarHeight: 70.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title: Text(
          'Evaluation',
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if(state.questions.length == 1)
            _timeExpired(context),
      if(state.questions.isNotEmpty && !state.isQuestionLoading)
          _mainContent(context, ref)
      else
        QuestionNotFound(context, (){
          var ctrl = ref.read(evaluationCtrlProvider.notifier);
          ctrl.getQuestions2();
        }),
    _chargement(context, ref),

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
      minHeight: 8,
    );
  }

  _mainContent(BuildContext context, WidgetRef ref) {
    final CountDownController _controller = CountDownController();
    var state = ref.watch(evaluationCtrlProvider);
    var duration = state.duree;
    var ctrl = ref.read(evaluationCtrlProvider.notifier);
    var question = state.maQuestion;
    var selectedValue = state.reponsesChoices?[state.maQuestion?.id] ?? -1;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _chargementPostReponses(context, ref),
          _myProgressBar(),
          SizedBox(height: 18,),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: [
                CircularCountDownTimer(
                          duration: duration!,
                          initialDuration: 0,
                          controller: _controller,
                          width: 80,
                          height: 80,
                          ringColor: Colors.grey[300]!,
                          ringGradient: null,
                          fillColor: Colors.green,
                          fillGradient: null,
                          backgroundColor: Colors.white,
                          strokeWidth: 10.0,
                          strokeCap: StrokeCap.round,
                          textStyle: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textFormat: CountdownTextFormat.HH_MM_SS,
                          isReverse: true,
                          isReverseAnimation: true,
                          isTimerTextShown: true,
                          autoStart: true,
                          onComplete: (){
                            ctrl.postAnswers();
                            ctrl.resetIntervenantAndResponses();
                            context.pushReplacementNamed(Urls.evaluationEndStep.name);
                          },

                          timeFormatterFunction: (defaultFormatterFunction, duration) {
                            if (duration.inSeconds == 0) {
                              return "Fin";
                            } else {
                              //others durations by it's default format
                              return Function.apply(defaultFormatterFunction, [duration]);
                            }
                          },

                    ),
                    SizedBox(width: 40.0,),
                    Text(
                        "${state.currentIndex}/${state.questions.length}"),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 40.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0),),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    question?.libelle ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //_separateurOu(),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  itemCount: state.assertions.length,
                  itemBuilder: (ctx, index) {
                    var myAssertion = state.assertions[index].id;
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(5.0))),
                      child: RadioListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: Colors.orange,
                          title: Text("${index + 1}." +
                              " ${state.assertions[index].libelle}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),),
                          value: myAssertion,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            ctrl.selectAnswer(value!);
                            print("valeur selectionnée $value");
                          }),
                    );
                  }),
            ),
          ),
          _myButton(),
        ]);

  } // end main content

  _myButton() {
    //var state=ref.watch(evaluationCtrlProvider);
    var state = ref.watch(evaluationCtrlProvider);
    var ctrl = ref.read(evaluationCtrlProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6.0, bottom: 8.0),
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
              label: Text('retour',
                style: TextStyle(
                    fontSize: 16
                ),),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0, bottom: 8.0),
          child: Visibility(
            visible: state.submitVisible,
            child: FloatingActionButton.extended(
              heroTag: "btn1",
              icon: Icon(
                Icons.check_circle_outlined,
            color: Colors.white,
              ),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),

              onPressed: ()=>showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    title: Center(child: Text("Fin de l'évaluation")),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Si vous êtes d'accord avec vos réponses"),
                        Text("cliquez sur le bouton soumettre"),
                        Text("pour envoyer vos résultats"),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                              ),
                              onPressed: () async{
                                Future.delayed(Duration(seconds: 3));
                                var post = await ctrl.postAnswers();
                                if(post == 200 || post == 201){
                                  await Duration(seconds: 3);
                                  ctrl.resetIntervenantAndResponses();
                                  context.pushReplacementNamed(Urls.EvaluationFinalStep.name);
                                  afficherMessageInfo(context, "Vos resultats ont été bien envoyé", Colors.green, true);
                                }
                                else{
                                  _chargementPost(context, ref);
                                }
                              },
                              child: Text("soumettre",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),),
                            ),
                            SizedBox(width: 14.0,),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                ),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text("retour",
                                style: TextStyle(
                                    fontSize: 16
                                ),))
                          ],
                        ),
                      ],
                    )
                ); },barrierDismissible: false,),
              label: Text('valider les résultats',
                style: TextStyle(
                  fontSize: 16,
                ),),

            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0, bottom: 8.0),
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
              label: Text('suivant',
    style: TextStyle(
    fontSize: 16,
    ),),),
          ),
        ),
      ],
    );
  }


  _chargementPost(BuildContext context, WidgetRef ref) {
    var state = ref.watch(evaluationCtrlProvider);
    return Visibility(
        visible: state.isQuestionLoading,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black26,
          child: Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.orange, size: 50),
          ),
        ));
  }




_chargement(BuildContext context, WidgetRef ref) {
  var state = ref.watch(evaluationCtrlProvider);
  return Visibility(
      visible: state.isQuestionLoading,
      child: Center(child: CircularProgressIndicator()));
}

_timeExpired(BuildContext context){
 return Container(
   width: 200,
   height: 200,
   color: Colors.redAccent,
   child: Text("Temps écoulé"),
 );
}

_chargementPostReponses(BuildContext context, WidgetRef ref) {
  var state = ref.watch(evaluationCtrlProvider);
  return Visibility(
      visible: state.isLoading,
      child: Center(child: CircularProgressIndicator()));
}

_showAlert(BuildContext context){
  var state = ref.watch(evaluationCtrlProvider);
  var ctrl = ref.read(evaluationCtrlProvider.notifier);
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        title: Center(child: Text("Quitter")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Voulez-vous quitter et"),
            Text("mettre fin à l'évaluation ?"),
            SizedBox(height: 15,),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  ),
                  onPressed: (){
                    while(context.canPop()){
                      context.pop();
                    }
                    ctrl.resetIntervenantAndResponses();
                    context.goNamed(Urls.Intro.name);
                  },
                  child: Text("Quitter",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),),
                ),
                SizedBox(width: 14.0,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("annuler"))
              ],
            ),
          ],
        )
    ); },barrierDismissible: false,);
}
}