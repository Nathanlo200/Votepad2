import 'package:odc_mobile_project/m_evaluation/business/services/evaluationLocalService.dart';

class ResetJuryLocalUseCase {
  EvaluationLocalService local;
  ResetJuryLocalUseCase(this.local);
  Future<bool> run() async {
    return await local.disconnect();
  }
}