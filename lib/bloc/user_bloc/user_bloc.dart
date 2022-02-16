import 'package:bloc/bloc.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_event.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_state.dart';
import 'package:test_bloc_class_14_feb/services/users_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserEmptyState()) {
    on<UserRequestEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          emit(UserLoadedState(
              listOfUsers: await UsersRepository().getAllUsers));
        } catch (e) {
          emit(UserErorState());
        }
      },
    );
    on<UserClearEvent>((event, emit) => emit(UserEmptyState()));
  }
}
