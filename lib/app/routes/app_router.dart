import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/app/routes/auth_guard.dart';

// This file will be generated in red until you run the build command
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final Ref ref;

  AppRouter(this.ref);

  @override
  List<AutoRoute> get routes => [
    // 1. Initial Route (Splash)
    CustomRoute(
      page: SplashRoute.page,
      initial: true,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),

    // 2. Auth Routes
    CustomRoute(
      page: LoginRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: SignupRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),

    // 3. Protected Routes (Wrapped in AuthGuard)
    CustomRoute(
      page: DashboardRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),

    // Product & Catalog Flow
    CustomRoute(
      page: ProductCatalogRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: ProductDetailRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),

    // Quotation Flow
    CustomRoute(
      page: QuotationFormRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: ProductSelectionRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: CartRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: QuotationReviewRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),

    // History & Resources
    CustomRoute(
      page: QuotationHistoryRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: QuotationDetailRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: QuotationPdfViewerRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: DatasheetsRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),

    // Profile & Misc
    CustomRoute(
      page: ProfileRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: EditProfileRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: HelpSupportRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: AboutUsRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: NotificationsRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: OffersRoute.page,
      guards: [AuthGuard(ref)],
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
  ];
}

// Provider for the router
final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref));