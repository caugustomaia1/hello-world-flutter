abstract class RideEvent {}

class FetchRides extends RideEvent {
  final bool error;

  FetchRides({this.error = false});
}
