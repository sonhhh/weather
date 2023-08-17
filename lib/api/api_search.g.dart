// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_search.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://geocoding-api.open-meteo.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
<<<<<<< HEAD
  Future<DataResponse> getSearch(String name) async {
=======
  Future<Result> getSearch(String cityName) async {
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'name': name};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
<<<<<<< HEAD
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DataResponse>(Options(
=======
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Result>(Options(
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
<<<<<<< HEAD
    final value = DataResponse.fromJson(_result.data!);
=======
    final value = Result.fromJson(_result.data!);
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
