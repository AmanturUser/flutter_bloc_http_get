import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../model/user_model.dart';
import 'detail_screen.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is UserLoadedState) {
            final UserModel users = state.users;
            return ListView.builder(
                itemCount: users.data!.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(userData: users.data![index])));
                    },
                    title: Text(users.data![index].firstName!),
                    subtitle: Text(users.data![index].lastName!),
                    trailing: CircleAvatar(
                      backgroundImage:
                      NetworkImage(users.data![index].avatar!),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
