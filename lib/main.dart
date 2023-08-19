import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'config/theme/theme.dart';
import 'injector.dart';
import 'login/presentation/bloc/authentication/auth_bloc.dart';
import 'login/presentation/screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  await inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => instance<AuthBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login Demo',
        builder: EasyLoading.init(),
        darkTheme: Themes.darkTheme,
        theme: ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: true,
        ),
        home: const RegisterAndLoginScreen(),
      ),
    );
  }
}
