import 'cubit/internet_check__cubit.dart';

class ConnectivityService {
  final ConnectivityCubit connectivityCubit;

  ConnectivityService(this.connectivityCubit);

  Stream<ConnectivityState> get connectivityStream => connectivityCubit.stream;
}
