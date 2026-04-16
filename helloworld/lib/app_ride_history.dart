import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/blocs/ride_bloc.dart';
import 'package:helloworld/blocs/ride_event.dart';
import 'package:helloworld/blocs/ride_state.dart';
import 'package:helloworld/ride.dart';

class AppRideHistory extends StatefulWidget {
  const AppRideHistory({super.key});

  @override
  State<AppRideHistory> createState() => _AppRideHistoryState();
}

class _AppRideHistoryState extends State<AppRideHistory> {
  late final RideBloc _rideBloc;

  @override
  void initState() {
    super.initState();
    _rideBloc = context.read<RideBloc>();
    _rideBloc.add(FetchRides(error: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Corridas'),
        backgroundColor: const Color.fromARGB(255, 212, 192, 13),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<RideBloc, RideState>(
          bloc: _rideBloc,
          listener: (context, state) {
            if (state is RideErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Erro ao carregar corridas')),
              );
            }
          },
          buildWhen: (previous, current) {
            return current is! RideErrorState;
          },
          builder: (context, state) {
            if (state is RideLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            // if (state is RideErrorState) {
            //   return const Center(child: Text('Erro ao carregar corridas'));
            // }
            if (state is RideSuccessState) {
              return ListView(
                children: state.rides.map((ride) => _RideCard(ride: ride)).toList(),
              );
            }
            return const Center(child: Text('Nenhuma corrida encontrada'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _rideBloc.add(FetchRides(error: true));
        },
        child: const Icon(Icons.error),
      ),
    );
  }
}

class _RideCard extends StatelessWidget {
  const _RideCard({super.key, required this.ride});

  final Ride ride;

  @override
  Widget build(BuildContext context) {
    return Card(child: Column(children: [Text('Corrida ${ride.id}')]));
  }
}
