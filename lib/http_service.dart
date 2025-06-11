import 'package:dio/dio.dart';

class HttpService {
  final Dio _dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8075',
        headers: {
          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiIxNzI2NyIsImF1ZCI6InNlY3VyZS1hcHAiLCJzdWIiOiJzLm8uZGlkZW5rby5mdGJycDI0IiwiZXhwIjoxNzUzMzY3MDk0LCJyb2wiOlsiUk9MRV9TVFVERU5UIl19.4sAFr0OihWaJkn3uz1mpFcF_wduie8dM12rKdVQrK3L7sHrdbgCPf0-bYIHRN7kzOWsPq4ZhTEYlGPB5A0M8Fw",
          "Content-Type": "application/json",
          "X-App-Version": "1.1",
        },
      ),
  );

  Future<List<dynamic>> fetchQuestions() async {
    try {
      final response = await _dio.get('/teachers/assessments/questions');
      return response.data; // Return JSON data
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}