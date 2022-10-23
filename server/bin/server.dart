import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void main() async {
  var handler = const Pipeline()
      .addMiddleware(
        logRequests(),
      )
      .addHandler(_echo);

  var port = Platform.environment['FUNCTIONS_CUSTOMHANDLER_PORT'] ?? '80';
  var server = await serve(handler, 'localhost', int.parse(port));
  server.autoCompress = true;
  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echo(Request request) => Response.ok('Request for "${request.url}"');
