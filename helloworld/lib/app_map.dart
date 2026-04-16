import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helloworld/app_ride_history.dart';
import 'package:helloworld/blocs/ride_bloc.dart';
import 'package:helloworld/l10n/generated/app_localizations.dart';

class AppMap extends StatefulWidget {
  const AppMap({super.key});

  @override
  State<AppMap> createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
  static const LatLng _initialPosition = LatLng(-6.4594, -37.0974);
  int _pinCounter = 0;
  GoogleMapController? _mapController;
  final List<Marker> _markers = [];
  LatLng _lastMapPosition = _initialPosition;
  double _zoom = 12;

  int _currentIndex = 0;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
    _zoom = position.zoom;
  }

  void _addPin() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: const InfoWindow(title: 'Pin', snippet: 'Snippet'),
        ),
      );
    });
  }

  void _removeAllPins() {
    setState(() {
      _markers.clear();
      _pinCounter = 0;
    });
  }

  void _goToPin(int index) {
    if (_markers.isEmpty) return;

    index = (index + _markers.length) % _markers.length;
    _pinCounter = index;

    var marker = _markers[_pinCounter];
    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(marker.position, _zoom),
    );
  }

  void _moveRight() => _goToPin(_pinCounter + 1);
  void _moveLeft() => _goToPin(_pinCounter - 1);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.onboardingMapAppBarTitle),
        backgroundColor: const Color.fromARGB(255, 212, 192, 13),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => RideBloc(),
                  child: const AppRideHistory(),
                ),
              ),
            );
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.map), label: 'Mapa'),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Histórico de Corridas',
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12,
        ),
        onCameraMove: _onCameraMove,
        markers: _markers.toSet(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 48, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MapPinsNavigatorButtons(
              icon: Icons.arrow_left,
              onPressed: _moveLeft,
              heroTag: 'leftBtn',
            ),
            const SizedBox(width: 16),
            MapPinsNavigatorButtons(
              icon: Icons.add,
              onPressed: _addPin,
              heroTag: 'addBtn',
            ),
            const SizedBox(width: 16),
            MapPinsNavigatorButtons(
              icon: Icons.arrow_right,
              onPressed: _moveRight,
              heroTag: 'rightBtn',
            ),
            const SizedBox(width: 16),
            MapPinsNavigatorButtons(
              icon: Icons.refresh,
              onPressed: _removeAllPins,
              heroTag: 'refreshBtn',
            ),
          ],
        ),
      ),
    );
  }
}

class MapPinsNavigatorButtons extends StatelessWidget {
  const MapPinsNavigatorButtons({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.heroTag,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      tooltip: 'Action',
      backgroundColor: Colors.amber,
      child: Icon(icon),
    );
  }
}
