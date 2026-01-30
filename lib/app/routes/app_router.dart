import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/core/animations/page_transitions.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/providers/auth_providers.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/state/auth_state.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';

// Pages
import 'package:fogshield_dealer_connect/features/auth/presentation/pages/login_page.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/pages/signup_page.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/pages/profile_page.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/pages/help_support_page.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/pages/about_us_page.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_form_page.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/product_selection_page.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/pages/product_detail_page.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/pages/cart_page.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_review_page.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_pdf_viewer_page.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_history_page.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_detail_page.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/pages/datasheets_page.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/pages/datasheet_viewer_page.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/pages/product_photos_page.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/pages/brochures_page.dart';
import 'package:fogshield_dealer_connect/features/offers/presentation/pages/offers_page.dart';
import 'package:fogshield_dealer_connect/features/offers/presentation/pages/offer_detail_page.dart';
import 'package:fogshield_dealer_connect/features/notifications/presentation/pages/notifications_page.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/pages/product_catalog_page.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/pages/video_player_page.dart';

// Models
import 'package:fogshield_dealer_connect/features/offers/presentation/state/offer_state.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final profileState = ref.watch(profileProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: AuthRefreshListenable(ref),
    debugLogDiagnostics: true,

    redirect: (context, state) {
      final status = authState.status;
      final isAtSplash = state.matchedLocation == '/';
      final isLoggingIn = state.matchedLocation == RouteNames.login;
      final isSigningUp = state.matchedLocation == RouteNames.signup;

      if (isAtSplash) return null;

      if (status == AuthStatus.initial || status == AuthStatus.loading) {
        return null;
      }

      if (status == AuthStatus.unauthenticated) {
        if (isLoggingIn || isSigningUp) return null;
        return RouteNames.login;
      }

      if (status == AuthStatus.authenticated) {
        if (profileState.name == 'Loading...') {
          return null;
        }

        if (isLoggingIn || isSigningUp) {
          return RouteNames.dashboard;
        }
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.signup,
        name: 'signup',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const SignupPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.dashboard,
        name: 'dashboard',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const DashboardPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.profile,
        name: 'profile',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const ProfilePage(),
        ),
      ),
      GoRoute(
        path: RouteNames.editProfile,
        name: 'edit-profile',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const EditProfilePage(),
        ),
      ),
      GoRoute(
        path: RouteNames.helpSupport,
        name: 'help-support',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const HelpSupportPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.aboutUs,
        name: 'about-us',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const AboutUsPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.quotationForm,
        name: 'quotation-form',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const QuotationFormPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.productSelection,
        name: 'product-selection',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const ProductSelectionPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.cart,
        name: 'cart',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const CartPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.quotationReview,
        name: 'quotation-review',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const QuotationReviewPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.quotationHistory,
        name: 'quotation-history',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const QuotationHistoryPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.quotationDetail,
        name: 'quotation-detail',
        pageBuilder: (context, state) {
          final quotationId = state.extra as String? ?? '';
          return PageTransitions.slideTransition(
            context: context,
            state: state,
            child: QuotationDetailPage(quotationId: quotationId),
          );
        },
      ),
      // THE FIX: Correctly extracts extra string for the PDF viewer
      GoRoute(
        path: RouteNames.quotationPdfViewer,
        name: 'quotation-pdf-viewer',
        pageBuilder: (context, state) {
          final quotationId = state.extra as String? ?? '';
          return PageTransitions.slideTransition(
            context: context,
            state: state,
            child: QuotationPdfViewerPage(quotationId: quotationId),
          );
        },
      ),
      GoRoute(
        path: RouteNames.productCatalog,
        name: 'product-catalog',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const ProductCatalogPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.productDetail,
        name: 'product-detail',
        pageBuilder: (context, state) {
          Product product;
          bool showQuotationActions = false;

          if (state.extra is Map<String, dynamic>) {
            final map = state.extra as Map<String, dynamic>;
            product = map['product'] as Product;
            showQuotationActions = map['showQuotationActions'] as bool? ?? false;
          } else {
            product = state.extra as Product;
          }

          return PageTransitions.slideTransition(
            context: context,
            state: state,
            child: ProductDetailPage(
              product: product,
              showQuotationActions: showQuotationActions,
            ),
          );
        },
      ),
      GoRoute(
        path: RouteNames.datasheets,
        name: 'datasheets',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const DatasheetsPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.datasheetViewer,
        name: 'datasheet-viewer',
        pageBuilder: (context, state) {
          final pdfUrl = state.extra as String?;
          return PageTransitions.slideTransition(
            context: context,
            state: state,
            child: DatasheetViewerPage(pdfUrl: pdfUrl),
          );
        },
      ),
      GoRoute(
        path: RouteNames.videoPlayer,
        name: 'video-player',
        pageBuilder: (context, state) {
          final videoUrl = state.extra as String?;
          return PageTransitions.slideTransition(
            context: context,
            state: state,
            child: VideoPlayerPage(videoUrl: videoUrl),
          );
        },
      ),
      GoRoute(
        path: RouteNames.productPhotos,
        name: 'product-photos',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const ProductPhotosPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.brochures,
        name: 'brochures',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const BrochuresPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.offers,
        name: 'offers',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const OffersPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.offerDetail,
        name: 'offer-detail',
        pageBuilder: (context, state) {
          final offer = state.extra as Offer?;
          return PageTransitions.slideTransition(
            context: context,
            state: state,
            child: OfferDetailPage(offer: offer),
          );
        },
      ),
      GoRoute(
        path: RouteNames.notifications,
        name: 'notifications',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const NotificationsPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Navigation Error: ${state.error}')),
    ),
  );
});

class AuthRefreshListenable extends ChangeNotifier {
  AuthRefreshListenable(Ref ref) {
    ref.listen(authProvider, (_, __) => notifyListeners());
    ref.listen(profileProvider, (_, __) => notifyListeners());
  }
}