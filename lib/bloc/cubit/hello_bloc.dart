import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hello_event.dart';

part 'hello_state.dart';

class HelloBloc extends Bloc<HelloEvent, int> {
  HelloBloc() : super(0) {
    on<HelloEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddCounterEvent>((event, emit) {
      emit(state + 1);
    });
  }
}
