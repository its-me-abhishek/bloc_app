// repositories.dart

import 'package:dio/dio.dart';
import 'package:bloc_asngment/model/app_model.dart';
import '../model/post_model.dart';

class ImageRepository {
  Dio _dio = Dio();
  String url = "https://random.dog/woof.json";

  Future<List<ImageModel>> getImage() async {
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          // Check if the response contains the expected keys
          if (responseData.containsKey("fileSizeBytes") &&
              responseData.containsKey("url")) {
            return [ImageModel.fromJson(responseData)];
          } else {
            throw Exception("Invalid response format. Missing expected keys.");
          }
        } else {
          throw Exception("Invalid response format. Expected a Map.");
        }
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching image: $e");
    }
  }
}

class PostRepository {
  Dio _dio = Dio();
  String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> getPost() async {
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        if (responseData is List) {
          // Check if each item in the list contains the expected keys
          List<PostModel> posts = [];
          for (var postJson in responseData) {
            if (postJson is Map<String, dynamic> &&
                postJson.containsKey("userId") &&
                postJson.containsKey("id") &&
                postJson.containsKey("title") &&
                postJson.containsKey("body")) {
              posts.add(PostModel.fromJson(postJson));
            } else {
              throw Exception("Invalid response format. Missing expected keys.");
            }
          }
          return posts;
        } else {
          throw Exception("Invalid response format. Expected a List.");
        }
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching posts: $e");
    }
  }
}