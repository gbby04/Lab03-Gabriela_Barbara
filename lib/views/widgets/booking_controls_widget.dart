import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final dateStr =
        '${viewModel.selectedDate.day.toString().padLeft(2, '0')}/${viewModel.selectedDate.month.toString().padLeft(2, '0')}/${viewModel.selectedDate.year}';

    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trip Preferences',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 24),
          // Visit Date Picker
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.calendar_month),
            title: const Text('Cruise Date'),
            trailing: TextButton(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: viewModel.selectedDate,
                  firstDate: DateTime(2025),
                  lastDate: DateTime(2030),
                );
                if (picked != null) {
                  viewModel.updateSelectedDate(picked);
                }
              },
              child: Text(
                dateStr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Package Dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.directions_boat),
                  SizedBox(width: 16),
                  Text('Transport Mode', style: TextStyle(fontSize: 16)),
                ],
              ),
              DropdownButton<String>(
                value: viewModel.selectedPackage,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    viewModel.updateSelectedPackage(newValue);
                  }
                },
                items: viewModel.destination.availablePackages
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Dark Mode Switch
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode Theme'),
            value: viewModel.isDarkMode,
            onChanged: (bool value) {
              viewModel.toggleDarkMode(value);
            },
          ),
        ],
      ),
    );
  }
}