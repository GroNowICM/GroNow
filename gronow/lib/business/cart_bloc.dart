import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/grocery_item.dart';

class CartBloc extends Cubit<int> {
  CartBloc() : super(0);

  void addToCart(GroceryItem item) => emit(state + 1);
  void decrement() => emit(state - 1);
}
