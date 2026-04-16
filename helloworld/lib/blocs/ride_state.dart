import 'package:helloworld/ride.dart';

abstract class RideState {
  List<Ride> rides;

  RideState({required this.rides});
}

class RideInitialState extends RideState {
  RideInitialState() : super(rides: []);
}

class RideLoadingState extends RideState {
  RideLoadingState() : super(rides: []);
}

class RideSuccessState extends RideState {
  RideSuccessState({required super.rides});
}

class RideErrorState extends RideState {
  RideErrorState({required super.rides});
}