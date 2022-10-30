import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void main() async {
  var handler = const Pipeline()
      .addMiddleware(
        logRequests(),
      )
      .addHandler(_echo);

  final port = String.fromEnvironment('PORT', defaultValue: '8080');
  print('will listen on the port $port');
  var server = await serve(handler, '0.0.0.0', int.parse(port));
  server.autoCompress = true;
  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echo(Request request) => Response.ok('Request for "${request.url}"');
