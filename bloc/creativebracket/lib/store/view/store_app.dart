import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:creativebracket/store/store.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => StoreBloc(),
        child: const _StoreAppView(title: 'My Store'),
      ),
    );
  }
}

class _StoreAppView extends StatefulWidget {
  const _StoreAppView({required this.title});
  final String title;

  @override
  State<_StoreAppView> createState() => __StoreAppViewState();
}

class __StoreAppViewState extends State<_StoreAppView> {
  void _viewCart() {
    Navigator.push(
      context,
      PageRouteBuilder(
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
                opacity: animation,
                child: BlocProvider.value(
                  value: context.read<StoreBloc>(),
                  child: child,
                ));
          },
          pageBuilder: (_, __, ___) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<StoreBloc, StoreState>(
          builder: (context, state) {
            if (state.productsStatus == StoreRequest.requestInProgress) {
              return const CircularProgressIndicator();
            }
            if (state.productsStatus == StoreRequest.requestFailure) {
              return const Text('Something went wrong!');
            }
            if (state.productsStatus == StoreRequest.unknown) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Press the button to load products'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<StoreBloc>().add(StoreProductsRequested());
                    },
                    child: const Text('Load Products'),
                  ),
                ],
              );
            }
            if (state.productsStatus == StoreRequest.requestSuccess) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  final inCart = state.cartIds.contains(product.id);
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
                            foregroundColor:
                                inCart ? Colors.black45 : Colors.green,
                          ),
                        

                          onPressed: () {
                            inCart
                                ? context.read<StoreBloc>().add(
                                      StoreProductsRemovedFromCart(product.id),
                                    )
                                : context.read<StoreBloc>().add(
                                      StoreProductsAddedToCart(product.id),
                                    );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: inCart
                                  ? [
                                      const Icon(Icons.remove_shopping_cart),
                                      const Text('Remove'),
                                    ]
                                  : [
                                      const Icon(Icons.add_shopping_cart),
                                      const Text('Add'),
                                    ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Text('Something went wrong!');
          },
        ),
      ),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: () {
              _viewCart();
            },
            child: const Icon(Icons.shopping_cart),
          ),
          BlocBuilder<StoreBloc, StoreState>(
            builder: (context, state) {
              return Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    state.cartIds.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
