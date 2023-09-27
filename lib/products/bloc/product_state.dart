part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends ProductState{
  final List<ProductModel> products;
  ProductLoadedState({required this.products});
  @override
  List<Object> get props=>[products];
}

class ErrorProductState extends ProductState{
  final String error;
  ErrorProductState({required this.error});
  @override
  List<Object> get props=>[error];
}
