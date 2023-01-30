import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vrouter/vrouter.dart';
import 'index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // moveTask;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.red),
      ),
      home: VRouter(
        routes: [
          VNester(
            path: PageTabRouting.homeRoute,
            widgetBuilder: (child) => ApplicationScreen(child: child),
            nestedRoutes: [
              VPopHandler(
                onSystemPop: (vRedirector) async {
                  if (vRedirector.historyCanBack()) {
                    vRedirector.historyBack();
                  }
                },
                stackedRoutes: generateRoute(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<VRouteElement> generateRoute() {
    return [
      VWidget(
        path: PageTabRouting.homeRoute,
        widget: const HomeScreen(),
      ),
      VWidget(
          path: PageTabRouting.favoritesRoute, widget: const FavoritesScreen()),
      VWidget(path: PageTabRouting.profileRoute, widget: const ProfileScreen()),
      VWidget(
        path: PageTabRouting.packageRoute,
        widget: const PackageScreen(),
        stackedRoutes: [
          VWidget(
            path: PageTabRouting.packageSummaryRoute,
            widget: const SummaryScreen(),
          ),
        ],
      ),
      VWidget(
        path: PageTabRouting.splashRoute,
        widget: const SplashScreen(),
        stackedRoutes: [
          VWidget(
            path: PageTabRouting.loginRoute,
            widget: const LoginScreen(),
          ),
        ],
      ),
      // VRouteRedirector(
      //   redirectTo: '/splash/login',
      //   path: r'*',
      // ),
    ];
  }
}
