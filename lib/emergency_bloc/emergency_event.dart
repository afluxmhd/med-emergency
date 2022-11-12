// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'emergency_bloc.dart';

abstract class EmergencyEvent extends Equatable {}

class AddPatientEmergencyList extends EmergencyEvent {
  final ActiveEmergencyList activeDetail;
  AddPatientEmergencyList({
    required this.activeDetail,
  });

  @override
  List<Object?> get props => [activeDetail];
}

class RemovePatientEmergencyList extends EmergencyEvent {
  @override
  List<Object?> get props => [];
}

class AddDriverEmergencyList extends EmergencyEvent {
  final ActiveEmergencyList activeDetail;
  AddDriverEmergencyList({
    required this.activeDetail,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
