import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() {
  runApp( DarkAndLightTheming(appRouter: AppRouter(),));
}

class DarkAndLightTheming extends StatelessWidget {
  const DarkAndLightTheming({super.key, required this.appRouter});
 final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
