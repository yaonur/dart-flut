import 'package:flutter/material.dart';
import 'package:creativebracket/store/store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isCardEmpty = context.select<StoreCubit, bool>(
        (storeBloc) => storeBloc.state.cartIds.isEmpty);
    final cartProducts = context.select<StoreCubit, List<Product>>(
        (storeBloc) => storeBloc.state.products
            .where((product) => storeBloc.state.cartIds.contains(product.id))
            .toList());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart'),
      ),
      body: isCardEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Cart is Empty',
                    style: TextStyle(fontSize: 20),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Add Products'),
                  )
                ],
              ),
            )
          : Center(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  final product = cartProducts[index];
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(product.id.toString()),
                        Text(product.title.toString()),
                        const SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black45,
                          ),
                          onPressed: () {
                            context.read<StoreCubit>().removeFromCart(
                                  product.id,
                                );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.remove_shopping_cart),
                                Text('Remove'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
