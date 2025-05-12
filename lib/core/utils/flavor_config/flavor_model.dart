
enum AppFlavor {dev, staging , prod}

class FlavorModel {
  String name;
  String baseUrl;
  String showBanner;
  AppFlavor appFlavor;
  FlavorModel({
    required this.name,
    required this.baseUrl,
    required this.showBanner,
    this.appFlavor = AppFlavor.dev,
  });
}

FlavorModel? currentFlavor;