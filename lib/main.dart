import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_http_get/products/bloc/product_bloc.dart';
import 'package:flutter_bloc_http_get/products/presentation/products_screen.dart';
import 'package:flutter_bloc_http_get/products/repository/product_repository.dart';
import 'package:flutter_bloc_http_get/user/bloc/user_bloc.dart';
import 'package:flutter_bloc_http_get/user/presentation/users_screen.dart';
import 'package:flutter_bloc_http_get/user/repository/user_repositories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context))
              ..add(LoadUserEvent()),
          ),
          BlocProvider(
              create: (context) => ProductBloc(
                  productsRepository:
                  RepositoryProvider.of<ProductRepository>(context))
                ..add(LoadProductEvent())),
        ],
        child: MaterialApp(
          title: 'The BLoC App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Home(),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The BLoC App'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      UsersScreen()));
            }, child: Text('Users')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ProductsScreen()));
            }, child: Text('Products')),
          ],
        ),
      ),
    );
  }
}
