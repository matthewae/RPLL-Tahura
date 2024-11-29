import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _currentLocation;
  late final MapController _mapController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showMessage('Layanan lokasi tidak aktif.');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showMessage('Izin lokasi ditolak.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _showMessage(
          'Izin lokasi ditolak permanen. Harap aktifkan di pengaturan.',
        );
        return;
      }

      // Ambil lokasi perangkat
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    } catch (e) {
      _showMessage('Gagal mendapatkan lokasi: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  List<Marker> _addMarkers() {
    final spots = [
      {
        "title": "Pintu Masuk Utama Tahura",
        "position": LatLng(-6.858293, 107.630616),
      },
      {"title": "Curug Omas", "position": LatLng(-6.8350332, 107.6581357)},
      {"title": "Goa Jepang", "position": LatLng(-6.856518, 107.632865)},
      {"title": "Goa Belanda", "position": LatLng(-6.854471, 107.637774)},
      {"title": "Jembatan Gantung", "position": LatLng(-6.8390, 107.6225)},
      {"title": "Monumen Ir. H. Djuanda", "position": LatLng(-6.857481, 107.629433)},
      {"title": "Batu Hoe", "position": LatLng(-6.839175, 107.647933)},
      {"title": "Batu Batik", "position": LatLng(-6.8422229, 107.6482683)},
      {"title": "Pintu Masuk Maribaya", "position": LatLng(-6.8311627, 107.6509174)},
    ];

    if (_currentLocation != null) {
      spots.add({"title": "Lokasi Saya", "position": _currentLocation!});
    }

    return spots.map((spot) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: spot["position"] as LatLng,
        builder: (ctx) => Icon(
          Icons.location_pin,
          color: spot["title"] == "Lokasi Saya" ? Colors.blue : Colors.red,
          size: 40.0,
        ),
      );
    }).toList();
  }

  void _moveToCurrentLocation() {
    if (_currentLocation != null) {
      _mapController.move(_currentLocation!, 17.0);
    } else {
      _showMessage('Lokasi belum tersedia.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map - Tahura'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: _currentLocation ?? LatLng(-6.8955314, 107.6106696),
              zoom: 17.0,
              maxZoom: 18.0,
              minZoom: 16.0,
              interactiveFlags: InteractiveFlag.drag | InteractiveFlag.pinchZoom,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(markers: _addMarkers()),
            ],
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _moveToCurrentLocation,
        child: const Icon(Icons.my_location),
        tooltip: 'Ke Lokasi Saya',
      ),
    );
  }
}
