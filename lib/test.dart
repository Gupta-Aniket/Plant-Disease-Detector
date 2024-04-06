import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http; // for image download (optional)

// Replace with your actual API key
const String apiKey = 'YOUR_ROBoflow_API_KEY';
const String baseUrl = 'https://detect.roboflow.com';

Future<Map<String, dynamic>> predictPlantDisease(String imageUrl) async {
  // Option 1: Download image and send as bytes (if image URL is remote)
  // You can use http package or other methods to download the image

  // Option 2: Use imageUrl directly if it's already accessible locally
  final imageData = imageUrl; // Replace with your image data (bytes or url)

  final dio = Dio();
  final modelId = 'plant_disease-db7ns/795'; // Replace with your model ID

  // Set base URL
  dio.options.baseUrl = baseUrl;

  // Set headers with Base64 encoded API key
  final encodedApiKey = base64Encode(utf8.encode(':$apiKey'));
  dio.options.headers = {'Authorization': 'Basic $encodedApiKey'};

  // Prepare data (replace with imageData based on your approach)
  final formData = FormData.fromMap({
    'image':
        imageUrl.isNotEmpty ? MultipartFile.fromUri(Uri.parse(imageUrl)) : null,
  });

  try {
    final response = await dio.post(
      '/v1/models/$modelId/infer',
      data: formData,
    );

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('API request failed with status: ${response.statusCode}');
    }
  } on DioError catch (error) {
    throw Exception('An error occurred: ${error.message}');
  }
}
