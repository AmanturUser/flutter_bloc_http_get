import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/product_model.dart';
import '../repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productsRepository;
  ProductBloc({required this.productsRepository}) : super(ProductLoadingState()) {
    on<LoadProductEvent>((event, emit) async{
      emit(ProductLoadingState());
      try{
        final List<ProductModel>? products=await productsRepository.getProduct();
        emit(ProductLoadedState(products: products!));
      }catch (e){
        emit(ErrorProductState(error: e.toString()));
      }
    });
  }
}
