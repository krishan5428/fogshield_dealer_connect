import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/core/animations/page_transitions.dart';
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
import 'package:fogshield_dealer_connect/features/offers/presentation/state/offer_state.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';
import 'package:fogshield_dealer_connect/core/widgets/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
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
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const QuotationDetailPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.quotationPdfViewer,
        name: 'quotation-pdf-viewer',
        pageBuilder: (context, state) => PageTransitions.slideTransition(
          context: context,
          state: state,
          child: const QuotationPdfViewerPage(),
        ),
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
      // Fixed: Passing the product object from state.extra to ProductDetailPage
      GoRoute(
        path: RouteNames.productDetail,
        name: 'product-detail',
        pageBuilder: (context, state) {
          Product product;
          bool showQuotationActions = false;

          // Handle if extra is passed as a Map or just a Product
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
  );
}