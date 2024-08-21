import 'package:flutter/material.dart';

import 'package:location/location.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    this.markers = const {},
    this.onCameraMove,
    this.onCameraIdle,
    this.onCameraMoveStarted,
    required this.initialCameraPosition,
  });

  final Set<Marker> markers;
  final void Function(CameraPosition)? onCameraMove;
  final Function()? onCameraIdle;
  final Function()? onCameraMoveStarted;
  final CameraPosition initialCameraPosition;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  String mapTheme = '';
  late bool isMapDark = Theme.of(context).brightness != Brightness.light;
  late final GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isMapDark) {
        DefaultAssetBundle.of(context)
            .loadString('assets/map_theme/google_dark_them.json')
            .then((value) => mapTheme = value);
      } else {
        DefaultAssetBundle.of(context)
            .loadString('assets/map_theme/google_light_them.json')
            .then((value) => mapTheme = value);
      }
      checkLocationPermissionAndService();
    });
  }

  void changeMapTheme() async {
    String asset = isMapDark
        ? 'assets/map_theme/google_light_them.json'
        : 'assets/map_theme/google_dark_them.json';
    final contents = await DefaultAssetBundle.of(context).loadString(asset);
    _controller.setMapStyle(contents);
    isMapDark = !isMapDark;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: widget.initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            controller.setMapStyle(mapTheme);
          },
          onCameraMoveStarted: widget.onCameraMoveStarted,
          onCameraIdle: widget.onCameraIdle,
          onCameraMove: widget.onCameraMove,
          markers: widget.markers,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          trafficEnabled: true,
          buildingsEnabled: true,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, right: 10),
            child: IconButton(
              icon: isMapDark
                  ? const Icon(
                      Icons.dark_mode_sharp,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.light_mode_sharp,
                      color: Color.fromARGB(255, 56, 78, 90),
                    ),
              onPressed: changeMapTheme,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: GestureDetector(
              onTap: () {
                checkLocationPermissionAndService();
              },
              child: Container(
                width: double.infinity,
                height: 46,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Row(
                  children: [
                    Icon(
                      Icons.gps_fixed,
                      color: Color.fromARGB(255, 56, 78, 90),
                    ),
                    Expanded(
                      child: Text(
                        'Нажмите здесь, чтобы показать ваше текущее местоположение',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 73, 73, 73),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void checkLocationPermissionAndService() async {
    try {
      Location location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              locationData.latitude ?? 42.8746,
              locationData.longitude ?? 74.5698,
            ),
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
