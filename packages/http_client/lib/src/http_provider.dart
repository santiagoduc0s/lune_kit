import 'package:http_client/http_client.dart';

/// An abstract class that defines the contract for an HTTP provider.
///
/// Classes that extend [HttpProvider] must implement the [fetch] method,
/// which is responsible for executing an HTTP request using the provided
/// [RequestHttp] and returning a [ResponseHttp] containing the response data.
// ignore: one_member_abstracts
abstract class HttpProvider {
  /// Executes an HTTP request.
  ///
  /// The [req] parameter is a [RequestHttp] object that encapsulates the
  /// details of the request such as the URL path, HTTP method, and request 
  /// payload.
  ///
  /// Returns a [Future] that resolves to a [ResponseHttp] object containing
  /// the HTTP response data, including the status code, response body, and 
  /// headers.
  // ignore: strict_raw_type
  Future<ResponseHttp> fetch(RequestHttp req);
}
