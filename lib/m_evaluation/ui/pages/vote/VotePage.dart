import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/intervenantPage/intervenantCtrl.dart';
import '../../composants/CustomSlider.dart';
import '../intervenantPage/intervenantPage.dart';
import 'VoteCtrl.dart';

class VotePage extends ConsumerStatefulWidget {
  final int phaseId;
  final int intervenantId;

  const VotePage(
      {super.key,
      required this.phaseId,
      required this.intervenantId,
      });

  @override
  ConsumerState createState() => _VotePageState();
}

class _VotePageState extends ConsumerState<VotePage> {
  var valeurSlider = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      // action initiale de la page et appel d'un controleur
      var intervenantId = widget.intervenantId;
      print("intervenantId $intervenantId");
      var ctrl = ref.read(voteCtrlProvider.notifier);
      print("CRITERS AFFICHER ${widget.phaseId}");
      await ctrl.recupererCriteres(widget.phaseId);

      var intervenantCrt = ref.read(intervenantCtrlProvider);
      var candidat = intervenantCrt.intervenants
          .where((i) => i.id == intervenantId)
          .toList();
      print("candidat $candidat");
      if (candidat.length > 0) {
        var user = candidat[0];
        ctrl.setCandidat(user);
      }
      ctrl.checkVote(widget.intervenantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(voteCtrlProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.white70, width: 1.0),
        ),
        title: Text(
          "Vote",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all(CircleBorder()),
            iconSize: WidgetStateProperty.all(25.0),
            padding: WidgetStateProperty.all(EdgeInsets.all(10.0)),
            visualDensity: VisualDensity.standard,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        actions: [
          Text(
            " ${state.criteres.length} Critères ",
            style: TextStyle(
                color: Colors.black,
                backgroundColor: Colors.white,
                fontSize: 15,
                height: 2.5,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
            child: Text(
              "Vote pour le candidat :${state.phaseVoteIntervenants?.email}",
              style: TextStyle(fontSize: 17),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: state.criteres.length,
                itemBuilder: (context, index) {
                  var critere = state.criteres[index].critere;
                  print(critere.toJson());
                  var savedValue = state.valeurs["${critere.id}"] ?? 0.0;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.93,
                          // height:  335,
                          color: Colors.white70,
                          child: Column(
                            children: [
                              Card(
                                child: ListTile(
                                  leading: Text((index + 1).toString()),
                                  title: Text(
                                      state.criteres[index].critere.libelle),
                                  trailing: Text("Ponderation : " +
                                      state.criteres[index].critere.ponderation
                                          .toString()),
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.all(4),
                                color: Colors.white70,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          child: Text(
                                            "Description :${critere.description}",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
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
                                                  voteCtrlProvider.notifier);
                                              ctrl.onSliderChanged(critere.id,
                                                  value, widget.intervenantId);
                                              setState(() {
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
                                              10, 30, 300, 0),
                                          child: Text(
                                            "Mention :",
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
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(100, 0, 0, 0),
                                      child: Text(
                                        "Score : $savedValue",
                                        textAlign: TextAlign.right,
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
                              ),
                            ],
                          )),
                    ],
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            title: Text("Voulez-vous soumettre  votre vote ?"),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Non",
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("Oui"),
                onPressed: () {
                  var ctrl = ref.read(voteCtrlProvider.notifier);
                  ctrl.sendVoteResulats(widget.intervenantId, widget.phaseId);
                   Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return IntervenantPage(phaseId: widget.phaseId);
                  }));

          },
              ),
            ],
          );
          showDialog(context: context, builder: (_) => alertDialog);
        },
        backgroundColor: Color(0xffff8604),
        foregroundColor: Colors.white,
        child: const Icon(Icons.check, size: 30),
      ),
    );
  }
}
