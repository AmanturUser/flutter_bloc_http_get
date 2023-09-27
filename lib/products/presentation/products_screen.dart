import 'package:flutter/material.dart';

import '../bloc/product_bloc.dart';
import '../model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The BLoC App'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductLoadedState) {
            final List<ProductModel> products = state.products;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: products.length,
                itemBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Flexible(
                          child: Image.network(products[index].image!),
                        ),
                        Text(products[index].title!),
                      ],
                    ),

                  );
                });
          }
          if(state is ErrorProductState){
            print(state.error);
            return Center(child: Text(state.error),);
          }
          return Container();
        },
      ),
    );
  }
}
