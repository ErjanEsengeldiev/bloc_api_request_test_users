abstract class UserEvent {}

class UserRequestEvent extends UserEvent {
  final String name;

  UserRequestEvent(this.name);
}

class UserCreateEvent extends UserEvent {}

class UserClearEvent extends UserEvent {}
