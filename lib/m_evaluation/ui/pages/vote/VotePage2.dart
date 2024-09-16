import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odc_mobile_project/m_evaluation/ui/composants/AppSize.dart';
import '../../composants/CustomSlider.dart';
import '../intervenantPage/intervenantCtrl.dart';
import 'VoteCtrl.dart';

class VotePage2 extends ConsumerStatefulWidget {
  final phaseId;
  final phaseIntervenantId;

  const VotePage2(
      {super.key, required this.phaseId, required this.phaseIntervenantId});

  @override
  ConsumerState createState() => _VotePageState();
}

class _VotePageState extends ConsumerState<VotePage2> {
  var valeurSlider = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // action initiale de la page et appel d'un controleur
      var intervenantId = widget.phaseIntervenantId;
      print("intervenantId $intervenantId");
      var ctrl = ref.read(voteCtrlProvider.notifier);
      print("CRITERS AFFICHER ${widget.phaseId}");
      await ctrl.recupererCriteres(widget.phaseId);

      var intervenantCrt = ref.read(intervenantCtrlProvider);
      var candidat = intervenantCrt.intervenants
          .where((element) => element.intervenantId == intervenantId)
          .toList();
      print("candidat $candidat");
      if (candidat.length > 0) {
        var user = candidat[0];
        ctrl.setCandidat(user);
      }
      ctrl.checkVote(widget.phaseIntervenantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(voteCtrlProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          margin: EdgeInsets.only(left: 7, right: 0, top: 3, bottom: 2),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Color(0xffFF7900).withOpacity(0.8),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          children: [
            _contenuPrincipale(context, ref),
            _chargement(context, ref),
            _SubmitButton2(context, ref),
          ],
        )),
      ),
    );
  }

  _contenuPrincipale(BuildContext context, WidgetRef ref) {
    var state = ref.watch(voteCtrlProvider);
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(135, 0, 0, 0),
                    width: 300,
                    height: 400,
                    child: Center(
                      child: Image.asset(
                        "images/x.png",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 300, 0, 0),
                    width: 300,
                    height: 300,
                    child: Center(
                      child: Image.asset(
                        "images/x.png",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(135, 600, 0, 0),
                    width: 300,
                    height: 200,
                    child: Center(
                      child: Image.asset(
                        "images/x.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 100,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${state.criteres.length.toString()}+criteres',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10), // Space between the icon and the email text
                        Text(
                          "${state.phaseVoteIntervenants?.email}",
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    height: 650,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 170),
                    child: ListView.builder(
                        itemCount: state.criteres.length,
                        itemBuilder: (BuildContext context, int index) {
                          var critere = state.criteres[index].critere;
                          print(critere.toJson());
                          var savedValue =
                              state.valeurs["${critere.id}"] ?? 0.0;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Card(
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        title: Text(
                                          state.criteres[index].critere.libelle,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        trailing: Text(
                                          "Ponderation : " +
                                              state.criteres[index].critere
                                                  .ponderation
                                                  .toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.all(4),
                                      color: Colors.white70,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 20, 10, 10),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: 40,
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 20, 10, 10),
                                                child: CustomSlider(
                                                  title: '',
                                                  onSliderChanged: (value) {
                                                    var ctrl = ref.read(
                                                        voteCtrlProvider
                                                            .notifier);
                                                    ctrl.onSliderChanged(
                                                        critere.id,
                                                        value,
                                                        widget
                                                            .phaseIntervenantId);
                                                    setState(() {
                                                      if (value > 0) {
                                                        var ctrl = ref.read(
                                                            voteCtrlProvider
                                                                .notifier);
                                                        ctrl.checkVote(widget
                                                            .phaseIntervenantId);
                                                      }
                                                      savedValue = value;
                                                    });
                                                  },
                                                  value: savedValue,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 30, 0, 10),
                                                child: Text(
                                                  "Score : $savedValue",
                                                  textAlign: TextAlign.left,
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _SubmitButton2(BuildContext context, WidgetRef ref) {
    var state = ref.watch(voteCtrlProvider);
    return Container(
      alignment: Alignment.bottomRight,
      width: AppSize.screenWidth * 0.95,
      height: AppSize.screenHeight * 0.86,
      child: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.send),
        onPressed: () async {
          var res = await showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      "Submit Vote !",
                      style: TextStyle(color: Colors.orange, fontSize: 35),
                    ),
                    content: const Text(
                      "You're to the point of submitting Vote",
                      style: TextStyle(fontSize: 15),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, "Cancel"),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop('Yes');
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ));

          if (res == "Yes") {
            setState(() {
              state.isLoading = true;
            });
            await Future.delayed(Duration(seconds: 3));
            print(
                "WiDGETINTERN ${widget.phaseIntervenantId}, phaseId ${widget.phaseId}");
            var ctrl = ref.read(voteCtrlProvider.notifier);
            await ctrl.sendVoteResulats(
                widget.phaseIntervenantId, widget.phaseId);
            if (mounted) {
              setState(() {
                state.isLoading = false;
              });
              await _chargement(context, ref);
              context.pop(true);
            }
          }
        },
      ),
    );
  }

  _chargement(BuildContext context, WidgetRef ref) {
    var state = ref.watch(voteCtrlProvider);
    return Visibility(
        visible: state.isLoading,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black26,
          child: Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.black, size: 50),
          ),
        ));
  }
}
