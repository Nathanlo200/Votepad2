import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import 'm_evaluation/business/interactor/EvaluationInteractor.dart';
import 'm_evaluation/ui/framework/evaluationLocalServiceImpl.dart';
import 'm_evaluation/ui/framework/evaluationNetworkServiceImpl.dart';

//don
// import 'package:odc_mobile_project/m_evaluation/business/interactor/EvaluationInteractor.dart';
// import 'package:odc_mobile_project/m_evaluation/framework/evaluationLocalServiceImpl.dart';
// import 'package:odc_mobile_project/m_evaluation/framework/evaluationNetworkServiceImplTest.dart';

import 'm_user/business/interactor/UserInteractor.dart';
import 'm_user/ui/framework/UserLocalServiceImpl.dart';
import 'm_user/ui/framework/UserNetworkServiceImpl.dart';
import 'navigation/routers.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  var stockage = GetStorage();

  var baseUrl = dotenv.env['BASE_URL'] ?? "";

// module user service implementations
  var userNetworkImpl = UserNetworkServiceImpl(baseUrl);
  var userLocalImpl = UserLocalServiceImpl(stockage);
  var userInteractor=UserInteractor.build(userNetworkImpl, userLocalImpl);


  //module evaluation service implementations
  //test
  //var evalutionNetTestImpl = EvalutionNetworkTestImpl(baseUrl);
  //var evaluationNetImpl = EvalutionNetworkTestImpl();
  //var evaluationLocalImpl = EvaluationLocalTestImpl(stockage);


  var evaluationNetImpl = EvaluationNetworkServiceImpl(baseUrl);
  var evaluationLocalImpl = EvaluationLocalServiceImpl(stockage);
  var evaluationInteractor = EvaluationInteractor.build(evaluationNetImpl, evaluationLocalImpl);


  // module evaluation service implementations don
  // var evaluationNetworkImpl = EvaluationNetworkServiceImplTest();
  // var evaluationLocalImpl = EvaluationLocalServiceImplTest(stockage);
  // var evaluationInteractor=EvaluationInteractor.build(evaluationNetworkImpl, evaluationLocalImpl);



  runApp(ProviderScope(
      overrides: [
        userInteractorProvider.overrideWithValue(userInteractor),
        evaluationInteractorProvider.overrideWithValue(evaluationInteractor),],
      child: MyApp()
  ));
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      title: 'Flutter ODC Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      //home: const CataloguePage(),
    );
  }
}
