import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartdocxtract/bloc/doc_bloc.dart';
import 'package:smartdocxtract/bloc/doc_state.dart';
import 'package:smartdocxtract/bloc/doc_event.dart';

class UploaddocPage extends StatelessWidget {
  const UploaddocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload Document",
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/bg1.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SizedBox(
              width: screenWidth * 0.95,
              height: screenHeight * 0.3,
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.14,
                      child: BlocBuilder<DocBloc, DocState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              context.read<DocBloc>().add(PickFile());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                  color: Colors.blue.shade200,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Drag or drop your file\nhere",
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 50),
                                  Icon(
                                    Icons.download_outlined,
                                    size: 35,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.44,
            left: screenWidth * 0.08,
            child: BlocBuilder<DocBloc, DocState>(
              builder: (context, state) {
                if (state.file == null) {
                  return const SizedBox.shrink();
                }
                return Row(
                  children: [
                    Card(
                      elevation: 4,
                      color: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox(
                        width: screenWidth * 0.55,
                        height: 100,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.file_present,
                                size: 32,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 1),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.file?.name ?? "No file selected",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    state.file != null
                                        ? "${(state.file!.size / (1024 * 1024)).toStringAsFixed(2)} MB"
                                        : "",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 215, 45, 45),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              context.read<DocBloc>().add(DeleteFile());
                            },
                            child: Text(
                              "Delete",
                              style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 2,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 58, 159, 62),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                            context.read<DocBloc>().add(LoadFile());
                          },
                          child: Text(
                            "Upload",
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
