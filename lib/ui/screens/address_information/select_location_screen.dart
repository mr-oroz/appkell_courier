import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/user_providers.dart';
import 'widgets/google_map_widget.dart';
import 'widgets/map_pointer.dart';
import 'widgets/use_this_location.dart';

class SelectLocationScreen extends HookConsumerWidget {
  const SelectLocationScreen({
    super.key,
    this.latitude,
    this.longitude,
  });

  final double? latitude;
  final double? longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMoving = useState(true);
    final isFirst = useState(true);
    final positionValue = useState(
      const CameraPosition(
        target: LatLng(42.8746, 74.5698),
        zoom: 12,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбрать местоположение'),
      ),
      body: Stack(
        children: [
          Center(
            child: MapWidget(
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude ?? 42.8746, longitude ?? 74.5698),
                zoom: 12,
              ),
              onCameraMove: (position) {
                positionValue.value = position;
              },
              onCameraMoveStarted: () {
                isFirst.value = false;
                isMoving.value = true;
              },
              onCameraIdle: () {
                isMoving.value = false;
              },
            ),
          ),
          if (!isMoving.value && !isFirst.value)
            UseThisLocation(
              onPressed: () async {
                await ref.read(userProvider.notifier).updateProfile({
                  'latitude': positionValue.value.target.latitude,
                  'longitude': positionValue.value.target.longitude,
                });
                if (!context.mounted) return;
                Navigator.pop(context);
              },
            ),
          const Center(child: MapPointer()),
        ],
      ),
    );
  }
}
