import 'package:dio/dio.dart';
import 'package:tela_mobile/constant/api_keys.dart';

import '../features/models/channel.dart';
import '../features/models/video.dart';

class YoutubeLiveApi {
  YoutubeLiveApi.instantiate();

  static final YoutubeLiveApi youtubeLiveApi = YoutubeLiveApi.instantiate();

  final String youtubeApiBaseUrl = 'https://youtube.googleapis.com';
  String nextPageToken = '';

  Future<Channel> fetchChannel({required String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': ApiKeys.googleApiKey
    };

    final Dio dio = Dio();

    Response response = await dio.get("$youtubeApiBaseUrl/youtube/v3/channels",
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
        queryParameters: parameters);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data['items'][0];
      Channel channel = Channel.fromMap(data);

      channel.videos = await fetchVideosFromPlaylist(
          playlistId: channel.uploadPlaylistId.toString());

      return channel;
    } else {
      throw response.data['error']['message'];
    }
  }

  Future<List<Video>> fetchVideosFromPlaylist(
      {required String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '8',
      'pageToken': nextPageToken,
      'key': ApiKeys.googleApiKey,
    };

    final Dio dio = Dio();

    final Response response =
        await dio.get("$youtubeApiBaseUrl/youtube/v3/playlistItems",
            options: Options(headers: {
              "Content-Type": "application/json",
            }),
            queryParameters: parameters);

    if (response.statusCode == 200) {
      var data = response.data;

      nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];

      // Fetch first eight videos from uploads playlist
      List<Video> videos = [];
      for (var json in videosJson) {
        videos.add(
          Video.fromMap(json['snippet']),
        );
      }
      return videos;
    } else {
      throw response.data['error']['message'];
    }
  }
}
