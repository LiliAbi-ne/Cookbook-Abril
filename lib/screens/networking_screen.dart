import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class QRGeneratorScreen extends StatefulWidget {
  const QRGeneratorScreen({super.key});

  @override
  State<QRGeneratorScreen> createState() => _QRGeneratorScreenState();
}

class _QRGeneratorScreenState extends State<QRGeneratorScreen> {
  String? qrImageUrl;
  bool isLoading = false;

  // Genera el QR para "Boleto para evento"
  Future<void> generateQRCode() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Construye la URL para la API
      final apiUrl = 'https://api.qrserver.com/v1/create-qr-code/';
      const data = "Boleto para evento"; // Texto fijo para el QR
      final response = await Dio().get(
        apiUrl,
        queryParameters: {
          'size': '150x150', // Tamaño del QR
          'data': data, // Texto o datos para convertir
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          qrImageUrl =
              '$apiUrl?size=150x150&data=$data'; // Guarda la URL del QR
        });
      } else {
        throw Exception('Failed to generate QR');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error generating QR: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: generateQRCode, // Genera el QR al presionar
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'Obtenga su boleto',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const CircularProgressIndicator()
            else if (qrImageUrl != null)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Su código QR:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Image.network(qrImageUrl!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
