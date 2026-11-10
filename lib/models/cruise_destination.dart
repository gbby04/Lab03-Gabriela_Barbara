class CruiseDestination {
  final String title;
  final String location;
  final String description;
  final String imageAsset;
  final double rating;
  final int reviewCount;
  final List<String> availablePackages;

  CruiseDestination({
    required this.title,
    required this.location,
    required this.description,
    required this.imageAsset,
    required this.rating,
    required this.reviewCount,
    required this.availablePackages,
  });
}