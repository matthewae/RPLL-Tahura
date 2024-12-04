import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LatLng _defaultLocation =
      LatLng(-6.8955201570034115, 107.61324386829472); // Lokasi STMIK LIKMI
  LatLng? _markerLocation; // Lokasi marker yang akan ditampilkan saat klik tombol
  late final MapController _mapController;

  double _currentZoom = 17.0; // Zoom awal
  bool _permissionGranted = false; // Dummy untuk izin GPS

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _showPermissionDialog(); // Tampilkan dialog izin GPS saat layar dibuka
  }

  /// Menampilkan dialog izin GPS
  void _showPermissionDialog() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text("Izin GPS"),
            content: const Text(
                "Aplikasi membutuhkan izin untuk mengakses lokasi perangkat Anda. Izinkan?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _permissionGranted = false; // Izin ditolak
                },
                child: const Text("Tolak"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _permissionGranted = true; // Izin diterima
                  });
                },
                child: const Text("Izinkan"),
              ),
            ],
          );
        },
      );
    });
  }

  /// Tambahkan marker untuk lokasi tertentu
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
      {
        "title": "Monumen Ir. H. Djuanda",
        "position": LatLng(-6.857481, 107.629433),
      },
      {"title": "Batu Hoe", "position": LatLng(-6.839175, 107.647933)},
      {"title": "Batu Batik", "position": LatLng(-6.8422229, 107.6482683)},
      {
        "title": "Pintu Masuk Maribaya",
        "position": LatLng(-6.8311627, 107.6509174),
      },
    ];

    // Tambahkan marker lokasi saat ini (jika sudah diatur)
    if (_markerLocation != null) {
      spots.add({"title": "Lokasi Awal", "position": _markerLocation!});
    }

    return spots.map((spot) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: spot["position"] as LatLng,
        builder: (ctx) => Icon(
          Icons.location_pin,
          color: spot["title"] == "Lokasi Awal" ? Colors.blue : Colors.red,
          size: 40.0,
        ),
      );
    }).toList();
  }

  /// Pindahkan peta ke lokasi default dan tambahkan marker
  void _moveToDefaultLocation() {
    setState(() {
      _markerLocation = _defaultLocation; // Atur lokasi marker
    });
    _mapController.move(
        _defaultLocation, _currentZoom); // Pindahkan peta ke lokasi default
  }

  /// Zoom in pada peta
  void _zoomIn() {
    setState(() {
      if (_currentZoom < 18.0) {
        _currentZoom += 1.0; // Tambah level zoom
        _mapController.move(_mapController.center, _currentZoom);
      }
    });
  }

  /// Zoom out pada peta
  void _zoomOut() {
    setState(() {
      if (_currentZoom > 16.0) {
        _currentZoom -= 1.0; // Kurangi level zoom
        _mapController.move(_mapController.center, _currentZoom);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map - Tahura'),
        automaticallyImplyLeading: false, // Menghilangkan tombol kembali
      ),
      body: Stack(
        children: [
          if (_permissionGranted)
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: _defaultLocation, // Titik pusat awal peta
                zoom: _currentZoom,
                maxZoom: 18.0,
                minZoom: 16.0,
                interactiveFlags:
                    InteractiveFlag.drag | InteractiveFlag.pinchZoom,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: _addMarkers()), // Tambahkan marker layer
              ],
            )
          else
            const Center(
              child: Text(
                "Izin GPS tidak diberikan. Peta tidak dapat ditampilkan.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          if (_permissionGranted)
            Positioned(
              bottom: 20,
              right: 20,
              child: Column(
                children: [
                  FloatingActionButton(
                    heroTag: 'zoom_in_button', // Hero tag unik
                    onPressed: _zoomIn,
                    tooltip: 'Zoom In',
                    child: const Icon(Icons.zoom_in),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    heroTag: 'zoom_out_button', // Hero tag unik
                    onPressed: _zoomOut,
                    tooltip: 'Zoom Out',
                    child: const Icon(Icons.zoom_out),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: _permissionGranted
          ? FloatingActionButton(
              heroTag: 'move_to_default', // Hero tag unik
              onPressed: _moveToDefaultLocation,
              tooltip: 'Ke Lokasi Awal',
              child: const Icon(Icons.my_location),
            )
          : null,
    );
  }
}
