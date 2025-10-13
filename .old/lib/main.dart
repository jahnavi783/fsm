import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/presentation/pages/documents/document_bloc.dart';
import 'package:fsm_flutter/presentation/pages/login/cubit/login_cubit.dart';
import 'package:fsm_flutter/presentation/pages/parts_management/cubit/parts_management_cubit.dart';
import 'package:fsm_flutter/presentation/pages/profile/cubit/profile_screen_cubit.dart';

import 'injection.dart' as di;
import 'presentation/core/themes/cubit/theme_service_cubit.dart';
import 'presentation/main_app.dart';
import 'presentation/pages/fsm_dashboard/cubit/fsm_work_orders_cubit.dart';
import 'presentation/pages/job_details/cubit/work_order_job_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeServiceCubit()),
          BlocProvider(create: (_) => LoginCubit()),
          BlocProvider(create: (_) => FsmWorkOrdersCubit()),
          BlocProvider(create: (_) => WorkOrderJobCubit()),
          BlocProvider(create: (_) => PartsManagementCubit()),
          BlocProvider(create: (_) => ProfileCubit()),
          BlocProvider(create: (_) => DocumentBloc()),
        ],
        child: const MyApp(),
      ),
    );
  });
}
