import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_http_get/bloc/user_bloc.dart';
import 'package:flutter_bloc_http_get/detail_screen.dart';
import 'package:flutter_bloc_http_get/model/user_model.dart';
import 'package:flutter_bloc_http_get/repository/repositories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: Home(),
      ),
        );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context))
        ..add(LoadUserEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text('The BLoC App'),
            centerTitle: true,
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is UserLoadedState) {
                final UserModel users = state.users;
                return ListView.builder(
                    itemCount: users.data!.length, itemBuilder: (_, index) {
                      return ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailScreen(userData: users.data![index])));
                        },
                        title: Text(users.data![index].firstName!),
                        subtitle: Text(users.data![index].lastName!),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(users.data![index].avatar!),
                        ),
                      );
                });
              }
              return Container();
            },
          )),
    );
  }
}
