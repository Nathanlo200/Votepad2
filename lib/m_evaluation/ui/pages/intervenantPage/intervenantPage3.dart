import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../navigation/routers.dart';
import '../../composants/AppSize.dart';
import '../phasePage/PhaseCtrl.dart';
import 'intervenantCtrl.dart';

class IntervenantPage3 extends ConsumerStatefulWidget {
  final int phaseId;

  const IntervenantPage3({super.key, required this.phaseId});

  @override
  ConsumerState<IntervenantPage3> createState() => _IntervenantState3();
}

class _IntervenantState3 extends ConsumerState<IntervenantPage3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var ctrl = ref.read(intervenantCtrlProvider.notifier);
      ctrl.recupererListIntervenant(widget.phaseId);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    Color loadingColor = isDarkTheme ? Colors.white : Colors.black;
    TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Progression"),
        leading: Container(
          margin: EdgeInsets.only(left: 6, right: 0, top: 3, bottom: 2),
          child: IconButton(
            onPressed: () {
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Enter Email',
                ),
                onChanged: (value) {
                  var ctrl = ref.read(intervenantCtrlProvider.notifier);
                  ctrl.rechercherIntervenant(value);
                  print(value);
                },
              );
            },
            icon: IconButton(
                onPressed: () {
                  context.goNamed(Urls.phases.name);
                },
                icon: Icon(Icons.arrow_back_ios_new,
                    color: loadingColor, size: 20)),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Color(0xffFF7900).withOpacity(0.8),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 7),
            child: AnimSearchBar(
              width: MediaQuery.of(context).size.width * 0.970,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  TextEditingController().clear();
                });
              },
              helpText: "Entrez le mail",
              onSubmitted: (String value) {
                var ctrl = ref.read(intervenantCtrlProvider.notifier);
                ctrl.rechercherIntervenant(value);
                print(value);
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          _chargement(context, ref),
          _contenuPrincipale(context, ref),
          _listeIntervenant(context, ref),
        ],
      )),
    );
  }

  _chargement(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    Color loadingColor = isDarkTheme ? Colors.white : Colors.orange;
    var state = ref.watch(intervenantCtrlProvider);
    return Visibility(
        visible: state.isLoading = false,
        child: Center(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
                size: 50, color: loadingColor),
          ),
        )));
  }

  _contenuPrincipale(BuildContext contect, WidgetRef ref) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    Color loadingColor = isDarkTheme
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.1);
    var state = ref.watch(phaseCtrlProvider);
    var phase = state.phasename;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        onError: (exception, stackTrace) => Image.asset("images/jm.png"),
        image: AssetImage("images/idea.png"),
        fit: BoxFit.cover,
      )),
    );
  }

  _listeIntervenant(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    Color loadingColor = isDarkTheme
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.1);
    var state = ref.watch(intervenantCtrlProvider);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      width: AppSize.screenWidth,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: loadingColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: Center(
          child: ListView.separated(
        separatorBuilder: (ctx, index) {
          return Divider(
            thickness: 1,
          );
        },
        itemCount: state.intervenants.length,
        itemBuilder: (context, index) {
          var intervenant = state.intervenants[index];

          return SingleChildScrollView(
            child: SizedBox(
              height: 115,
              child: Card(
                child: SizedBox(
                  height: 20,
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                    ),
                    trailing: intervenant.isDone
                        ? Icon(Icons.check, color: Colors.green)
                        : Icon(Icons.arrow_forward),
                    onTap: () async {

                        var res = await context
                            .pushNamed<bool>(Urls.vote.name, pathParameters: {
                          "phaseId": widget.phaseId.toString(),
                          "intervenantId": intervenant.intervenantId.toString()
                        });

                        if (res != null) {
                          var ctrl = ref.read(intervenantCtrlProvider.notifier);
                          ctrl.updateIntervenantStatus(
                              intervenant.intervenantId, res);
                        }

                      },
                    title: Text(
                      intervenant.email,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
