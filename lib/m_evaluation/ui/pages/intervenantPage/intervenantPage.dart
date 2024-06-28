import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/routers.dart';
import '../../composants/ListeVide.dart';
import 'intervenantCtrl.dart';

class IntervenantPage extends ConsumerStatefulWidget {
  const IntervenantPage({super.key, required int phaseId});

  @override
  ConsumerState<IntervenantPage> createState() => _IntervenantState();
}

class _IntervenantState extends ConsumerState<IntervenantPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var ctrl = ref.read(intervenantCtrlProvider.notifier);
      ctrl.recupererListIntervenant();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(intervenantCtrlProvider);
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              if (state.intervenants.isNotEmpty && !state.isLoading)
              _contenuPrincipale(context, ref)
              else ListeVide(context,(){
                var ctrl = ref.read(intervenantCtrlProvider.notifier);
                ctrl.recupererListIntervenant();
              }),
              _chargement(context, ref),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(
          child: IconButton(onPressed: () {
              context.goNamed(Urls.phases.name);
            },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          title: Text("Intervenants"),
          actions: [
            IconButton(
                onPressed: () {
                 // context.goNamed(Urls.Intro.name);
                },
                icon: Icon(Icons.menu_rounded)),
          ],
        ));
  }

  _contenuPrincipale(BuildContext context, WidgetRef ref) {
    var state = ref.watch(intervenantCtrlProvider);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: _zoneDeRecherche(context),
          ),
          Expanded(
              child: ListView.separated(
                  separatorBuilder: (ctx, index) {
                    return Divider(
                      thickness: 1,
                    );
                  },
                  itemCount: state.intervenants.length,
                  itemBuilder: (ctx, index) {
                    var intervenant = state.intervenants[index];
                    return Card(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child:
                        ListTile(
                            leading: Icon(Icons.person),
                            trailing: (intervenant.isDone)?
                    Icon(Icons.check_sharp,color: Colors.green,):
                    Icon(Icons.arrow_forward),
                        title: Text(intervenant.name),)
                    );
                  }))
        ],
      ),
    );
  }

  _zoneDeRecherche(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              suffixIcon: Icon(Icons.search),
              hintText: 'Recherche',
            ),
            onChanged: (value) {
              var ctrl = ref.read(intervenantCtrlProvider.notifier);
              ctrl.rechercherIntervenant(value);
              print(value);
            },
          ),
        ]);
  }


  _chargement(BuildContext context, WidgetRef ref) {
    var state = ref.watch(intervenantCtrlProvider);
    return Visibility(
        visible: state.isLoading,
        child: Center(child: CircularProgressIndicator()));
  }
}
