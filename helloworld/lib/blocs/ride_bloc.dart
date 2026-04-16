import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/blocs/ride_event.dart';
import 'package:helloworld/blocs/ride_state.dart';
import 'package:helloworld/ride.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  RideBloc() : super(RideInitialState()) {
    on<FetchRides>(_onFetchRides);
  }

  void _onFetchRides(FetchRides event, Emitter<RideState> emit) async {
    if (event.error) {
      emit(RideErrorState(rides: []));
      return;
    }
    emit(RideLoadingState());
    try {
      final rides = await _fetchRides();
      emit(RideSuccessState(rides: rides));
    } catch (e) {
      emit(RideErrorState(rides: []));
    }
  }

  Future<List<Ride>> _fetchRides() async {
    // Mock de uma chamada de API
    await Future.delayed(const Duration(seconds: 2));
    return [Ride(id: '10'), Ride(id: '20'), Ride(id: '30'), Ride(id: '40')];
  }
}
