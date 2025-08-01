import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartdocxtract/bloc/doc_bloc.dart';
import 'package:smartdocxtract/bloc/doc_event.dart';
import 'package:smartdocxtract/bloc/doc_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final docBloc = BlocProvider.of<DocBloc>(context);
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              '/Users/quanganh/flutterproject/smartdocxtract/lib/assets/bg1.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'SmartDocXtract',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SearchBar(
                      controller: _searchController,
                      hintText: "Search features...",
                      leading: const Icon(Icons.search),
                      onChanged: (query) {
                        docBloc.add(UpdateSearchQuery(query));
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: BlocBuilder<DocBloc, DocState>(
                    builder: (context, state) {
                      final filteredResult = state.features.where((feature) {
                        final query = state.searchQuery?.toLowerCase() ?? "";
                        return feature.title.toLowerCase().contains(query);
                      }).toList();

                      return GridView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: filteredResult.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.3,
                        ),
                        itemBuilder: (context, index) {
                          final feature = filteredResult[index];
                          return GestureDetector(
                            onTap: () {
                              if (feature.toNavigate != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => feature.toNavigate!(context),
                                  ),
                                );
                              }
                            },
                            child: Card(
                              color: Colors.white.withOpacity(0.8),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _itemCard(feature.colors, feature.icondata),
                                    const SizedBox(height: 12),
                                    Text(
                                      feature.title,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
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
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(child: Icon(icon, color: Colors.white)),
    );
  }
}
