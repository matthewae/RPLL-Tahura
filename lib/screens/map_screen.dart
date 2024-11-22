import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  // Fungsi untuk menghasilkan daftar marker
  List<Marker> _addMarkers() {
    // Daftar spot di Tahura
    final spots = [
      {"title": "Pintu Masuk Utama Tahura", "position": LatLng(-6.8585, 107.6191)},
      {"title": "Curug Omas", "position": LatLng(-6.8354, 107.6285)},
      {"title": "Goa Jepang", "position": LatLng(-6.8593, 107.6185)},
      {"title": "Goa Belanda", "position": LatLng(-6.8600, 107.6170)},
      {"title": "Jembatan Gantung", "position": LatLng(-6.8390, 107.6225)},
      {"title": "Monumen Ir. H. Djuanda", "position": LatLng(-6.8576, 107.6201)},
      {"title": "Curug Lalay", "position": LatLng(-6.8375, 107.6275)},
      {"title": "Bukit Pakar", "position": LatLng(-6.8540, 107.6150)},
    ];

    // Menghasilkan list marker berdasarkan data spots
    return spots.map((spot) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: spot["position"] as LatLng, // Konversi eksplisit ke LatLng
        builder: (ctx) => Icon(
          Icons.location_pin,
          color: Colors.red, // Warna merah untuk marker
          size: 40.0,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map - Tahura'),
        automaticallyImplyLeading: false,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-6.8540, 107.6150),
          zoom: 17.0,
          maxZoom: 18.0,
          minZoom: 16.0,
          interactiveFlags: InteractiveFlag.drag | InteractiveFlag.pinchZoom, // Hanya memungkinkan drag & zoom
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: _addMarkers(), // Menambahkan marker yang dihasilkan
          ),
        ],
      ),
    );
  }
}
