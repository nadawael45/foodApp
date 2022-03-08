import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/cubit/location/location_cubit.dart';
import '../../domain/cubit/location/location_states.dart';
class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<LocationCubit, LocationStates>(
        builder: (BuildContext context, state) =>

            FlutterMap(
              options: MapOptions(
                center:
                LatLng(LocationCubit
                    .get(context)
                    .latitude, LocationCubit
                    .get(context)
                    .longitude),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  attributionBuilder: (_) {
                    return Text("© OpenStreetMap contributors");
                  },
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(LocationCubit
                          .get(context)
                          .latitude, LocationCubit
                          .get(context)
                          .longitude),
                      builder: (ctx) =>
                          Container(
                            child: FlutterLogo(),
                          ),
                    ),
                  ],
                ),
              ],
            ),
      );
  }
}
