// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/material.dart' as _i28;
import 'package:fogshield_dealer_connect/core/widgets/splash_screen.dart'
    as _i25;
import 'package:fogshield_dealer_connect/features/admin/presentation/pages/admin_dashboard_page.dart'
    as _i2;
import 'package:fogshield_dealer_connect/features/auth/presentation/pages/login_page.dart'
    as _i10;
import 'package:fogshield_dealer_connect/features/auth/presentation/pages/signup_page.dart'
    as _i24;
import 'package:fogshield_dealer_connect/features/cart/presentation/pages/cart_page.dart'
    as _i4;
import 'package:fogshield_dealer_connect/features/dashboard/presentation/pages/dashboard_page.dart'
    as _i5;
import 'package:fogshield_dealer_connect/features/notifications/presentation/pages/notifications_page.dart'
    as _i11;
import 'package:fogshield_dealer_connect/features/offers/presentation/pages/offer_detail_page.dart'
    as _i12;
import 'package:fogshield_dealer_connect/features/offers/presentation/pages/offers_page.dart'
    as _i13;
import 'package:fogshield_dealer_connect/features/offers/presentation/state/offer_state.dart'
    as _i29;
import 'package:fogshield_dealer_connect/features/products/presentation/pages/brochures_page.dart'
    as _i3;
import 'package:fogshield_dealer_connect/features/products/presentation/pages/datasheet_viewer_page.dart'
    as _i6;
import 'package:fogshield_dealer_connect/features/products/presentation/pages/datasheets_page.dart'
    as _i7;
import 'package:fogshield_dealer_connect/features/products/presentation/pages/product_catalog_page.dart'
    as _i14;
import 'package:fogshield_dealer_connect/features/products/presentation/pages/product_detail_page.dart'
    as _i15;
import 'package:fogshield_dealer_connect/features/products/presentation/pages/product_photos_page.dart'
    as _i16;
import 'package:fogshield_dealer_connect/features/products/presentation/pages/video_player_page.dart'
    as _i26;
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart'
    as _i30;
import 'package:fogshield_dealer_connect/features/profile/presentation/pages/about_us_page.dart'
    as _i1;
import 'package:fogshield_dealer_connect/features/profile/presentation/pages/edit_profile_page.dart'
    as _i8;
import 'package:fogshield_dealer_connect/features/profile/presentation/pages/help_support_page.dart'
    as _i9;
import 'package:fogshield_dealer_connect/features/profile/presentation/pages/profile_page.dart'
    as _i18;
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/product_selection_page.dart'
    as _i17;
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_detail_page.dart'
    as _i19;
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_form_page.dart'
    as _i20;
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_history_page.dart'
    as _i21;
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_pdf_viewer_page.dart'
    as _i22;
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_review_page.dart'
    as _i23;

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsRoute extends _i27.PageRouteInfo<void> {
  const AboutUsRoute({List<_i27.PageRouteInfo>? children})
      : super(AboutUsRoute.name, initialChildren: children);

  static const String name = 'AboutUsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutUsPage();
    },
  );
}

/// generated route for
/// [_i2.AdminDashboardPage]
class AdminDashboardRoute extends _i27.PageRouteInfo<void> {
  const AdminDashboardRoute({List<_i27.PageRouteInfo>? children})
      : super(AdminDashboardRoute.name, initialChildren: children);

  static const String name = 'AdminDashboardRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i2.AdminDashboardPage();
    },
  );
}

/// generated route for
/// [_i3.BrochuresPage]
class BrochuresRoute extends _i27.PageRouteInfo<void> {
  const BrochuresRoute({List<_i27.PageRouteInfo>? children})
      : super(BrochuresRoute.name, initialChildren: children);

  static const String name = 'BrochuresRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i3.BrochuresPage();
    },
  );
}

/// generated route for
/// [_i4.CartPage]
class CartRoute extends _i27.PageRouteInfo<void> {
  const CartRoute({List<_i27.PageRouteInfo>? children})
      : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i4.CartPage();
    },
  );
}

/// generated route for
/// [_i5.DashboardPage]
class DashboardRoute extends _i27.PageRouteInfo<void> {
  const DashboardRoute({List<_i27.PageRouteInfo>? children})
      : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i5.DashboardPage();
    },
  );
}

/// generated route for
/// [_i6.DatasheetViewerPage]
class DatasheetViewerRoute
    extends _i27.PageRouteInfo<DatasheetViewerRouteArgs> {
  DatasheetViewerRoute({
    _i28.Key? key,
    String? pdfUrl,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          DatasheetViewerRoute.name,
          args: DatasheetViewerRouteArgs(key: key, pdfUrl: pdfUrl),
          initialChildren: children,
        );

  static const String name = 'DatasheetViewerRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DatasheetViewerRouteArgs>(
        orElse: () => const DatasheetViewerRouteArgs(),
      );
      return _i6.DatasheetViewerPage(key: args.key, pdfUrl: args.pdfUrl);
    },
  );
}

class DatasheetViewerRouteArgs {
  const DatasheetViewerRouteArgs({this.key, this.pdfUrl});

  final _i28.Key? key;

  final String? pdfUrl;

  @override
  String toString() {
    return 'DatasheetViewerRouteArgs{key: $key, pdfUrl: $pdfUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DatasheetViewerRouteArgs) return false;
    return key == other.key && pdfUrl == other.pdfUrl;
  }

  @override
  int get hashCode => key.hashCode ^ pdfUrl.hashCode;
}

/// generated route for
/// [_i7.DatasheetsPage]
class DatasheetsRoute extends _i27.PageRouteInfo<void> {
  const DatasheetsRoute({List<_i27.PageRouteInfo>? children})
      : super(DatasheetsRoute.name, initialChildren: children);

  static const String name = 'DatasheetsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i7.DatasheetsPage();
    },
  );
}

/// generated route for
/// [_i8.EditProfilePage]
class EditProfileRoute extends _i27.PageRouteInfo<void> {
  const EditProfileRoute({List<_i27.PageRouteInfo>? children})
      : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i8.EditProfilePage();
    },
  );
}

/// generated route for
/// [_i9.HelpSupportPage]
class HelpSupportRoute extends _i27.PageRouteInfo<void> {
  const HelpSupportRoute({List<_i27.PageRouteInfo>? children})
      : super(HelpSupportRoute.name, initialChildren: children);

  static const String name = 'HelpSupportRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i9.HelpSupportPage();
    },
  );
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i27.PageRouteInfo<void> {
  const LoginRoute({List<_i27.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i10.LoginPage();
    },
  );
}

/// generated route for
/// [_i11.NotificationsPage]
class NotificationsRoute extends _i27.PageRouteInfo<void> {
  const NotificationsRoute({List<_i27.PageRouteInfo>? children})
      : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i11.NotificationsPage();
    },
  );
}

/// generated route for
/// [_i12.OfferDetailPage]
class OfferDetailRoute extends _i27.PageRouteInfo<OfferDetailRouteArgs> {
  OfferDetailRoute({
    _i28.Key? key,
    _i29.Offer? offer,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          OfferDetailRoute.name,
          args: OfferDetailRouteArgs(key: key, offer: offer),
          initialChildren: children,
        );

  static const String name = 'OfferDetailRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OfferDetailRouteArgs>(
        orElse: () => const OfferDetailRouteArgs(),
      );
      return _i12.OfferDetailPage(key: args.key, offer: args.offer);
    },
  );
}

class OfferDetailRouteArgs {
  const OfferDetailRouteArgs({this.key, this.offer});

  final _i28.Key? key;

  final _i29.Offer? offer;

  @override
  String toString() {
    return 'OfferDetailRouteArgs{key: $key, offer: $offer}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OfferDetailRouteArgs) return false;
    return key == other.key && offer == other.offer;
  }

  @override
  int get hashCode => key.hashCode ^ offer.hashCode;
}

/// generated route for
/// [_i13.OffersPage]
class OffersRoute extends _i27.PageRouteInfo<void> {
  const OffersRoute({List<_i27.PageRouteInfo>? children})
      : super(OffersRoute.name, initialChildren: children);

  static const String name = 'OffersRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i13.OffersPage();
    },
  );
}

/// generated route for
/// [_i14.ProductCatalogPage]
class ProductCatalogRoute extends _i27.PageRouteInfo<void> {
  const ProductCatalogRoute({List<_i27.PageRouteInfo>? children})
      : super(ProductCatalogRoute.name, initialChildren: children);

  static const String name = 'ProductCatalogRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i14.ProductCatalogPage();
    },
  );
}

/// generated route for
/// [_i15.ProductDetailPage]
class ProductDetailRoute extends _i27.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i28.Key? key,
    required _i30.Product product,
    bool showQuotationActions = false,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            product: product,
            showQuotationActions: showQuotationActions,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return _i15.ProductDetailPage(
        key: args.key,
        product: args.product,
        showQuotationActions: args.showQuotationActions,
      );
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.product,
    this.showQuotationActions = false,
  });

  final _i28.Key? key;

  final _i30.Product product;

  final bool showQuotationActions;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product, showQuotationActions: $showQuotationActions}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailRouteArgs) return false;
    return key == other.key &&
        product == other.product &&
        showQuotationActions == other.showQuotationActions;
  }

  @override
  int get hashCode =>
      key.hashCode ^ product.hashCode ^ showQuotationActions.hashCode;
}

/// generated route for
/// [_i16.ProductPhotosPage]
class ProductPhotosRoute extends _i27.PageRouteInfo<void> {
  const ProductPhotosRoute({List<_i27.PageRouteInfo>? children})
      : super(ProductPhotosRoute.name, initialChildren: children);

  static const String name = 'ProductPhotosRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i16.ProductPhotosPage();
    },
  );
}

/// generated route for
/// [_i17.ProductSelectionPage]
class ProductSelectionRoute extends _i27.PageRouteInfo<void> {
  const ProductSelectionRoute({List<_i27.PageRouteInfo>? children})
      : super(ProductSelectionRoute.name, initialChildren: children);

  static const String name = 'ProductSelectionRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i17.ProductSelectionPage();
    },
  );
}

/// generated route for
/// [_i18.ProfilePage]
class ProfileRoute extends _i27.PageRouteInfo<void> {
  const ProfileRoute({List<_i27.PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i18.ProfilePage();
    },
  );
}

/// generated route for
/// [_i19.QuotationDetailPage]
class QuotationDetailRoute
    extends _i27.PageRouteInfo<QuotationDetailRouteArgs> {
  QuotationDetailRoute({
    _i28.Key? key,
    required String quotationId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          QuotationDetailRoute.name,
          args: QuotationDetailRouteArgs(key: key, quotationId: quotationId),
          initialChildren: children,
        );

  static const String name = 'QuotationDetailRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuotationDetailRouteArgs>();
      return _i19.QuotationDetailPage(
        key: args.key,
        quotationId: args.quotationId,
      );
    },
  );
}

class QuotationDetailRouteArgs {
  const QuotationDetailRouteArgs({this.key, required this.quotationId});

  final _i28.Key? key;

  final String quotationId;

  @override
  String toString() {
    return 'QuotationDetailRouteArgs{key: $key, quotationId: $quotationId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuotationDetailRouteArgs) return false;
    return key == other.key && quotationId == other.quotationId;
  }

  @override
  int get hashCode => key.hashCode ^ quotationId.hashCode;
}

/// generated route for
/// [_i20.QuotationFormPage]
class QuotationFormRoute extends _i27.PageRouteInfo<void> {
  const QuotationFormRoute({List<_i27.PageRouteInfo>? children})
      : super(QuotationFormRoute.name, initialChildren: children);

  static const String name = 'QuotationFormRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i20.QuotationFormPage();
    },
  );
}

/// generated route for
/// [_i21.QuotationHistoryPage]
class QuotationHistoryRoute extends _i27.PageRouteInfo<void> {
  const QuotationHistoryRoute({List<_i27.PageRouteInfo>? children})
      : super(QuotationHistoryRoute.name, initialChildren: children);

  static const String name = 'QuotationHistoryRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i21.QuotationHistoryPage();
    },
  );
}

/// generated route for
/// [_i22.QuotationPdfViewerPage]
class QuotationPdfViewerRoute
    extends _i27.PageRouteInfo<QuotationPdfViewerRouteArgs> {
  QuotationPdfViewerRoute({
    _i28.Key? key,
    required String quotationId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          QuotationPdfViewerRoute.name,
          args: QuotationPdfViewerRouteArgs(key: key, quotationId: quotationId),
          initialChildren: children,
        );

  static const String name = 'QuotationPdfViewerRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuotationPdfViewerRouteArgs>();
      return _i22.QuotationPdfViewerPage(
        key: args.key,
        quotationId: args.quotationId,
      );
    },
  );
}

class QuotationPdfViewerRouteArgs {
  const QuotationPdfViewerRouteArgs({this.key, required this.quotationId});

  final _i28.Key? key;

  final String quotationId;

  @override
  String toString() {
    return 'QuotationPdfViewerRouteArgs{key: $key, quotationId: $quotationId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuotationPdfViewerRouteArgs) return false;
    return key == other.key && quotationId == other.quotationId;
  }

  @override
  int get hashCode => key.hashCode ^ quotationId.hashCode;
}

/// generated route for
/// [_i23.QuotationReviewPage]
class QuotationReviewRoute extends _i27.PageRouteInfo<void> {
  const QuotationReviewRoute({List<_i27.PageRouteInfo>? children})
      : super(QuotationReviewRoute.name, initialChildren: children);

  static const String name = 'QuotationReviewRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i23.QuotationReviewPage();
    },
  );
}

/// generated route for
/// [_i24.SignupPage]
class SignupRoute extends _i27.PageRouteInfo<void> {
  const SignupRoute({List<_i27.PageRouteInfo>? children})
      : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i24.SignupPage();
    },
  );
}

/// generated route for
/// [_i25.SplashScreen]
class SplashRoute extends _i27.PageRouteInfo<void> {
  const SplashRoute({List<_i27.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i25.SplashScreen();
    },
  );
}

/// generated route for
/// [_i26.VideoPlayerPage]
class VideoPlayerRoute extends _i27.PageRouteInfo<VideoPlayerRouteArgs> {
  VideoPlayerRoute({
    _i28.Key? key,
    String? videoUrl,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          VideoPlayerRoute.name,
          args: VideoPlayerRouteArgs(key: key, videoUrl: videoUrl),
          initialChildren: children,
        );

  static const String name = 'VideoPlayerRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoPlayerRouteArgs>(
        orElse: () => const VideoPlayerRouteArgs(),
      );
      return _i26.VideoPlayerPage(key: args.key, videoUrl: args.videoUrl);
    },
  );
}

class VideoPlayerRouteArgs {
  const VideoPlayerRouteArgs({this.key, this.videoUrl});

  final _i28.Key? key;

  final String? videoUrl;

  @override
  String toString() {
    return 'VideoPlayerRouteArgs{key: $key, videoUrl: $videoUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VideoPlayerRouteArgs) return false;
    return key == other.key && videoUrl == other.videoUrl;
  }

  @override
  int get hashCode => key.hashCode ^ videoUrl.hashCode;
}
