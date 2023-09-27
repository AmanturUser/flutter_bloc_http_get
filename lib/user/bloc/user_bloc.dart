import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/user_model.dart';
import '../repository/user_repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async{

      emit(UserLoadingState());
      try{
        final users= await userRepository.getUsers();
        emit(UserLoadedState(users: users));
      }catch(e){
        print('error');
        emit(UserErrorState(errorMessage: e.toString()));
      }
      // TODO: implement event handler
    });


  }
}
