import 'package:flutter/material.dart';

class UploaddocPage extends StatelessWidget {
  const UploaddocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Upload Document"),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                '/Users/quanganh/flutterproject/smartdocxtract/lib/assets/bg1.png', // Tip: use relative asset path in production
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
                    mainAxisAlignment: MainAxisAlignment.start, // ⬅ Align top
                    children: [
                      SizedBox(
                        width: screenWidth * 0.85,
                        height: screenHeight * 0.14,
                        child: Container(
                          margin: const EdgeInsets.only(top: 12), // ⬅ Slight top offset
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(
                              color: Colors.blue.shade200,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            children: const [
                              Text(
                                "Drag or drop your file\nhere",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 50,),
                              Icon(
                                Icons.download_outlined,
                                size: 35,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
