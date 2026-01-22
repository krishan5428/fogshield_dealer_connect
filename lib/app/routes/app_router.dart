import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
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

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.login,
    debugLogDiagnostics: true,
    routes: [
      // --- Authentication ---
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteNames.signup,
        name: 'signup',
        builder: (context, state) => const SignupPage(),
      ),

      // --- Dashboard ---
      GoRoute(
        path: RouteNames.dashboard,
        name: 'dashboard',
        builder: (context, state) => const DashboardPage(),
      ),

      // --- Profile & Settings ---
      GoRoute(
        path: RouteNames.profile,
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: RouteNames.editProfile,
        name: 'edit-profile',
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: RouteNames.helpSupport,
        name: 'help-support',
        builder: (context, state) => const HelpSupportPage(),
      ),
      GoRoute(
        path: RouteNames.aboutUs,
        name: 'about-us',
        builder: (context, state) => const AboutUsPage(),
      ),

      // --- Quotation Flow ---
      GoRoute(
        path: RouteNames.quotationForm,
        name: 'quotation-form',
        builder: (context, state) => const QuotationFormPage(),
      ),
      GoRoute(
        path: RouteNames.productSelection,
        name: 'product-selection',
        builder: (context, state) => const ProductSelectionPage(),
      ),
      GoRoute(
        path: RouteNames.cart,
        name: 'cart',
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        path: RouteNames.quotationReview,
        name: 'quotation-review',
        builder: (context, state) => const QuotationReviewPage(),
      ),
      GoRoute(
        path: RouteNames.quotationHistory,
        name: 'quotation-history',
        builder: (context, state) => const QuotationHistoryPage(),
      ),
      GoRoute(
        path: RouteNames.quotationDetail,
        name: 'quotation-detail',
        builder: (context, state) => const QuotationDetailPage(),
      ),
      GoRoute(
        path: RouteNames.quotationPdfViewer,
        name: 'quotation-pdf-viewer',
        builder: (context, state) => const QuotationPdfViewerPage(),
      ),

      // --- Products & Resources ---
      GoRoute(
        path: RouteNames.productCatalog,
        name: 'product-catalog',
        builder: (context, state) => const ProductSelectionPage(),
      ),
      GoRoute(
        path: RouteNames.productDetail,
        name: 'product-detail',
        builder: (context, state) => const ProductDetailPage(),
      ),
      GoRoute(
        path: RouteNames.datasheets,
        name: 'datasheets',
        builder: (context, state) => const DatasheetsPage(),
      ),
      GoRoute(
        path: RouteNames.datasheetViewer,
        name: 'datasheet-viewer',
        builder: (context, state) => const DatasheetViewerPage(),
      ),
      GoRoute(
        path: RouteNames.productPhotos,
        name: 'product-photos',
        builder: (context, state) => const ProductPhotosPage(),
      ),
      GoRoute(
        path: RouteNames.brochures,
        name: 'brochures',
        builder: (context, state) => const BrochuresPage(),
      ),

      // --- Offers ---
      GoRoute(
        path: RouteNames.offers,
        name: 'offers',
        builder: (context, state) => const OffersPage(),
      ),
      GoRoute(
        path: RouteNames.offerDetail,
        name: 'offer-detail',
        builder: (context, state) => const OfferDetailPage(),
      ),

      // --- Notifications ---
      GoRoute(
        path: RouteNames.notifications,
        name: 'notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
    ],
  );
}

// Temporary placeholder for screens built in future steps
class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.construction_rounded, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              '$title Screen\nUnder Development',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}