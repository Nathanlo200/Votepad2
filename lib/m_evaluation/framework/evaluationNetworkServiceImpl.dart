import 'dart:async';

import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/createVoteRequest.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/groupes.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/intervenants.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/jurys.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/phaseCriteres.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/phaseIntervenant.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/votes.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/assertions.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questions.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/reponse.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/phases.dart';

import '../business/services/evaluationNetworkService.dart';

class EvaluationNetworkServiceImplTest implements EvaluationNetworkService {
  @override
  Future<List<Assertions>> getAssertionList(int questionId) {
    var resultat = [
      Assertions.fromJson({
        "id": 1,
        "questions_id": 1,
        "name": "test",
        "created_at": null,
        "updated_at": null,
      })
    ];
    return Future.value(resultat);
  }

  @override
  Future<List<PhaseCriteres>> getCritereListByPhase(int phaseId) {
    var resultat = [
      PhaseCriteres.fromJson({
        "id": 1,
        "phases_id": 1,
        "name": "test",
        "created_at": null,
        "updated_at": null,
      })
    ];
    return Future.value(resultat);
  }

  @override
  Future<Evenement> getEvenementById(int id) {
    var resultat = Evenement.fromJson({
      "id": 1,
      "name": "test",
      "description": "test",
      "created_at": null,
      "updated_at": null,
    });
    return Future.value(resultat);
  }

  @override
  Future<PhaseIntervenant> getGroupById(int id) {
    var resultat = PhaseIntervenant.fromJson({
      "id": 1,
      "intervenants_id": 1,
      "phases_id": 1,
      "created_at": null,
      "updated_at": null,
    });
    return Future.value(resultat);
  }

  @override
  Future<List<Groupes>> getGroupeList(int phaseId) {
    var resultat = [
      Groupes.fromJson({
        "id": 1,
        "phases_id": 1,
        "name": "test",
        "created_at": null,
        "updated_at": null,
      })
    ];
    return Future.value(resultat);
  }

  @override
  Future<Intervenants?> getIntervenant(String email, String coupon) {
    var resultat = Intervenants.fromJson({
      "id": 1,
      "phases_intervenants_id": 1,
      "name": "test",
      "email": "test",
      "created_at": null,
      "updated_at": null,
    });
    return Future.value(resultat);
  }

  @override
  Future<PhaseIntervenant> getIntervenantById(int id) {
    var resultat = PhaseIntervenant.fromJson({
      "id": 1,
      "intervenants_id": 1,
      "phases_id": 1,
      "created_at": null,
      "updated_at": null,
    });
    return Future.value(resultat);
  }

  @override
  Future<List<Intervenants>> getIntervenantList(int phaseId) {
    var resultat = [
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "Exauce",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "joseph",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "esther",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "elie",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "david",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "grace",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "dorcas",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "candide",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "françoise",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "mael",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "levis",
        "email": "test",
        "created_at": null,
        "updated_at": null,
        "isDone": true,
      }),
      Intervenants.fromJson({
        "id": 1,
        "phases_intervenants_id": 1,
        "name": "lyly",
        "email": "test",
        "created_at": null,
        "updated_at": null,
      })
    ];

    return Future.value(resultat);
  }

  @override
  Future<Jury?> getJury(String coupon) {
    var resultat = Jury.fromJson({
      "id": 1,
      "name": "test",
      "email": "test",
      "created_at": null,
      "updated_at": null,
    });
    return Future.value(resultat);
  }

  @override
  Future<bool> getPhasesByIntervenant(int intervenantId, int competitionId) {
    var resultat = true;
    return Future.value(resultat);
  }
  @override
  Future<List<Question>> getQuestionListByPhase(int phaseId) {
    var resultat = [
      Question.fromJson({
        "id": 1,
        "phases_id": 1,
        "name": "test",
        "created_at": null,
        "updated_at": null,
      })
    ];
    return Future.value(resultat);
  }

  @override
  Future<Votes> getVoteByGroupe(int groupeId) {
    var resultat = Votes.fromJson({
      "id": 1,
      "intervenants_id": 1,
      "phases_id": 1,
      "created_at": null,
      "updated_at": null,
    });
    return Future.value(resultat);
  }

  @override
  Future<Votes> getVoteByIntervenant(int intervenantId) {
    var resultat = Votes.fromJson({
      "id": 1,
      "intervenants_id": 1,
      "phases_id": 1,
      "created_at": null,
      "updated_at": null,
    });
    return Future.value(resultat);
  }

  @override
  Future<bool> postReponses(Reponse data) {
    var resultat = true;
    return Future.value(resultat);
  }

  @override
  Future sendVoteByCandidat(CreateVoteRequest data) {
    var resultat = true;
    return Future.value(resultat);
  }

  @override
  Future<List<PhasesVote>?> getPhasesList() {
    var res = [
      Phases.fromJson({
        "id": 1,
        "evenement_id": 1,
        "nom": "test",
        "description": "test",
        "type": "test",
        "dateDebut": null,
        "dateFin": null,
        "statut": false,
        "created_at": null,
        "updated_at": null,
        "nbreCandidats": 10
      }),
      Phases.fromJson({
        "id": 1,
        "evenement_id": 1,
        "nom": "test",
        "description": "test",
        "type": "test",
        "dateDebut": null,
        "dateFin": null,
        "statut": false,
        "created_at": null,
        "updated_at": null,
        "nbreCandidats": 8
      }),
      Phases.fromJson({
        "id": 1,
        "evenement_id": 1,
        "nom": "test",
        "description": "test",
        "type": "test",
        "dateDebut": null,
        "dateFin": null,
        "statut": false,
        "created_at": null,
        "updated_at": null,
        "nbreCandidats": 5
      }),
    ];
    return Future.value(res as FutureOr<List<PhasesVote>?>);
  }

  @override
  Future<PhasesVote> getPhaseListById(int id) {
    var resultat = Phases.fromJson({
      "id": 1,
      "evenement_id": 1,
      "nom": "test",
      "description": "test",
      "type": "test",
      "dateDebut": null,
      "dateFin": null,
      "statut": false,
      "created_at": null,
      "updated_at": null,
    });
    return Future.value(resultat as FutureOr<PhasesVote>?);
  }
}