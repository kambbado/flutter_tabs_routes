enum PageRouteTabIndex {
  home,
  favorites,
  package,
  profile,
}

class PageTabRouting {
  static String homeRoute = '/home';
  static String favoritesRoute = '/favorites';
  static String profileRoute = '/profile';
  static String packageRoute = '/package';
  static String packageSummaryRoute = '$packageRoute/summary';
  static String loginRoute = 'login';
  static String splashRoute = '/';

  static Map pageRoutes = <int, String>{
    PageRouteTabIndex.home.index: homeRoute,
    PageRouteTabIndex.favorites.index: favoritesRoute,
    PageRouteTabIndex.profile.index: profileRoute,
    PageRouteTabIndex.package.index: packageRoute,
  };
}
