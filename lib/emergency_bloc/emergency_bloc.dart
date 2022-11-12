import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reva_doc/widgets/active_driver_emergency_list.dart';
import '../widgets/active_emergency_widget.dart';

part 'emergency_event.dart';
part 'emergency_state.dart';

class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> {
  EmergencyBloc() : super(const EmergencyState()) {
    on<AddPatientEmergencyList>(_onAddPatientEmergencyList);
    on<RemovePatientEmergencyList>(_onRemovepatientEmergencyList);
    on<AddDriverEmergencyList>(_onAddDriverEmergencyList);
  }

  void _onAddPatientEmergencyList(
      EmergencyEvent event, Emitter<EmergencyState> emit) {
    emit(EmergencyState(
        patientEmergencyList: List.from(state.patientEmergencyList)
          ..add(ActiveEmergencyList()),
        driverEmergencyList: state.driverEmergencyList));
  }

  void _onRemovepatientEmergencyList(
      EmergencyEvent event, Emitter<EmergencyState> emit) {
    emit(
      EmergencyState(
          patientEmergencyList: List.from(state.patientEmergencyList)..clear(),
          driverEmergencyList: List.from(state.driverEmergencyList)..clear()),
    );
  }

  void _onAddDriverEmergencyList(
      EmergencyEvent event, Emitter<EmergencyState> emit) {
    emit(EmergencyState(
        driverEmergencyList: List.from(state.driverEmergencyList)
          ..add(ActiveDriverEmergencyList()),
        patientEmergencyList: state.patientEmergencyList));
  }
}
