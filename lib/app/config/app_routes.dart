import 'package:flutter/material.dart';

import '../../MVVM/View/Onboarding/onboarding_screen1.dart';
import '../../MVVM/View/splash/splash_screen.dart';
import 'app_pages.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    final uri = Uri.parse(settings.name ?? '');

    // if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'post_view_screen') {
    //   final contentId = uri.pathSegments.length > 1 ? uri.pathSegments[1] : null;
    //   if (contentId != null) {
    //     return MaterialPageRoute(
    //       builder: (_) => PostViewScreen(contentsId: contentId),
    //     );
    //   }
    // }

    // if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'user_profile_view') {
    //   final profileId = uri.pathSegments.length > 1 ? uri.pathSegments[1] : null;
    //   if (profileId != null) {
    //     return MaterialPageRoute(
    //       builder: (_) => OtherUserProfileScreen(userId: profileId),
    //     );
    //   }
    // }

    // Handle other routes
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.onboardScreen:
        return MaterialPageRoute(builder: (_) =>  OnboardScreen1());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}