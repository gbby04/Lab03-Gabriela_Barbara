import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  late CruiseDestination _destination;
  DateTime _selectedDate = DateTime(2026, 11, 15);
  late String _selectedPackage;
  bool _isDarkMode = false;
  int _starCount = 43;
  bool _isStarred = false;

  CruiseBookingViewModel() {
    _destination = CruiseDestination(
      title: 'Rajang River Express Cruise',
      location: 'Sibu Waterfront, Sarawak',
      description:
      'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and traditional waterfront settlements while experiencing authentic Sarawakian hospitality.',
      imageAsset: 'assets/rajangrivercruise.png',
      rating: 4.8,
      reviewCount: 43,
      availablePackages: [
        'Express Boat',
        'Private River Cruise',
        'Sunset Cruise',
        'Sunrise Cruise',
        'Rural Cruise',
        'SMI Park Cruise',
      ],
    );
    _selectedPackage = _destination.availablePackages.first;
    _starCount = _destination.reviewCount;
  }

  // Getters
  CruiseDestination get destination => _destination;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  int get starCount => _starCount;
  bool get isStarred => _isStarred;

  // State Management Actions
  void updateSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void updateSelectedPackage(String newPackage) {
    _selectedPackage = newPackage;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void toggleStarRating() {
    if (_isStarred) {
      _starCount--;
      _isStarred = false;
    } else {
      _starCount++;
      _isStarred = true;
    }
    notifyListeners();
  }
}