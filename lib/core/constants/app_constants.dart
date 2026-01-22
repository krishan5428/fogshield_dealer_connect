class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'fogshield Dealer Connect';
  static const String appVersion = '1.0.0';
  static const String companyName = 'fogshield';

  // Padding & Margins
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingExtraLarge = 32.0;

  // Border Radius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;
  static const double borderRadiusExtraLarge = 16.0;

  // Animation Durations
  static const Duration animationShort = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationLong = Duration(milliseconds: 500);

  // Screen Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Grid Columns
  static const int gridColumnsMobile = 2;
  static const int gridColumnsTablet = 3;
  static const int gridColumnsDesktop = 4;

  // Quotation
  static const int quotationValidityDays = 30;
  static const String quotationPrefix = 'QT';
  static const double defaultTaxPercentage = 18.0;

  // Pagination
  static const int itemsPerPage = 20;

  // Image
  static const double productImageAspectRatio = 1.0;
  static const double maxImageSizeMB = 5.0;
}