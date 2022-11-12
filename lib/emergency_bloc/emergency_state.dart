part of 'emergency_bloc.dart';

class EmergencyState extends Equatable {
  final List<ActiveEmergencyList> patientEmergencyList;
  final List<ActiveDriverEmergencyList> driverEmergencyList;

  const EmergencyState({
    this.driverEmergencyList = const <ActiveDriverEmergencyList>[],
    this.patientEmergencyList = const <ActiveEmergencyList>[],
  });

  @override
  List<Object?> get props => [patientEmergencyList, driverEmergencyList];
}
