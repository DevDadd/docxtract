import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartdocxtract/bloc/doc_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DocBloc docBloc = BlocProvider.of<DocBloc>(context);
    final features = docBloc.state.features;

    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('SmartDocXtract'))),
      body: Column(
        children: [
          const SizedBox(height: 20),

          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: SearchBar(
                hintText: "Search features...",
                leading: const Icon(Icons.search),
              ),
            ),
          ),

          const SizedBox(height: 23),

          Expanded(
            child: GridView.builder(
              itemCount: features.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                final feature = features[index];

                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _itemCard(feature.colors, feature.icondata),
                      const SizedBox(height: 8),
                      Text(
                        feature.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemCard(Color color, IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Icon(icon),
    );
  }
}
