import 'package:dio/dio.dart';

class ApiClient{
  Dio _dio = Dio();
  Future<dynamic> getVideos() async{ //It will give me future 
    const URL = 'https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=100&regionCode=IN&key=AIzaSyBoZufiQXXfWLGgd9OFg72ghKGjg-e46cs';

  final Response response = await _dio.get(URL);  //Making Network Call  (It Support Asynchronis Way)
  //print(response.data);
  //print(response.data.runtimeType);
  return response.data['items'];

  }
}
