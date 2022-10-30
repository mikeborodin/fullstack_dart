import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void main() async {
  var handler = const Pipeline()
      .addMiddleware(
        logRequests(),
      )
      .addHandler(_echo);

  var server = await serve(handler, 'localhost', 80);
  server.autoCompress = true;
  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echo(Request request) => Response.ok('Request for "${request.url}"');
