import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          orientation == Orientation.portrait
              ? 'Sibu River Cruise & Heritage'
              : 'Sibu River Cruise & Heritage (Landscape Split View)',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Chip(
              avatar: const Icon(Icons.screen_rotation, size: 16),
              label: Text(
                orientation == Orientation.portrait ? 'Portrait' : 'Landscape',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context);
        },
      ),
    );
  }

  // Single Column ListView for Portrait Mode
  Widget _buildPortraitLayout(BuildContext context) {
    return ListView(
      children: [
        HeaderImageWidget(
          imageAsset: viewModel.destination.imageAsset,
          tagLabel: 'Sibu Esplanade Landmark',
        ),
        TitleSectionWidget(
          title: viewModel.destination.title,
          location: viewModel.destination.location,
          starCount: viewModel.starCount,
          isStarred: viewModel.isStarred,
          onStarPressed: viewModel.toggleStarRating,
        ),
        const ActionBarWidget(),
        DescriptionWidget(description: viewModel.destination.description),
        BookingControlsWidget(viewModel: viewModel),
      ],
    );
  }

  // Side-by-Side Split Pane (Row + Expanded) for Landscape Mode
  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      children: [
        // Left Pane: Hero Image
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                child: HeaderImageWidget(
                  imageAsset: viewModel.destination.imageAsset,
                  tagLabel: 'Rajang River Horizon',
                ),
              ),
            ],
          ),
        ),
        // Right Pane: Details and Controls
        Expanded(
          flex: 1,
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              TitleSectionWidget(
                title: viewModel.destination.title,
                location: viewModel.destination.location,
                starCount: viewModel.starCount,
                isStarred: viewModel.isStarred,
                onStarPressed: viewModel.toggleStarRating,
              ),
              const ActionBarWidget(),
              BookingControlsWidget(viewModel: viewModel),
              DescriptionWidget(description: viewModel.destination.description),
            ],
          ),
        ),
      ],
    );
  }
}