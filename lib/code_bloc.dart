import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xorauth/code_model.dart';

abstract class CodeEvent {}

class CodeInitialized extends CodeEvent {}
class CodeListingRequested extends CodeEvent {}
class CodeAdditionRequested extends CodeEvent {}
class CodeRetrievalRequested extends CodeEvent {}
class CodeDeletionRequested extends CodeEvent {}

class CodeError extends CodeEvent {
  String get message => 'there was an unknown error';
  int get code => 500;
}

class CodeState {
  CodeError? error;
  CodeEvent event;
  Code? code;
  List<Code>? codes;
  CodeState(this.event);
  CodeState.withCode(this.event, this.code);
  CodeState.withCodes(this.event, this.codes);
  CodeState.withError(this.event, this.error, CodeState? state) {
    if (state != null) {
      code = state.code;
      codes = state.codes;
    }
  }
}

class CodeBloc extends Bloc<CodeEvent, CodeState> {
  CodeBloc() : super(CodeState(CodeInitialized())) {
    on<CodeListingRequested>((event, emit) =>
        emit(CodeState.withCodes(CodeListingRequested(), [])));
    on<CodeAdditionRequested>((event, emit) =>
      emit(CodeState.withCode(CodeAdditionRequested(), Code.generate())));
  }
}
