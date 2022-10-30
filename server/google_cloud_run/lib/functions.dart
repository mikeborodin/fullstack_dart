import 'dart:convert';
import 'dart:io';

import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';

@CloudFunction()
Future<Response> httpFunction(Request request) async {
  print('http function triggered');
  var readAsString = await request.readAsString();
  print(readAsString);
  return Response.ok("hey");
}

const _encoder = JsonEncoder.withIndent(' ');

@CloudFunction()
void function(CloudEvent event, RequestContext context) {
  context.logger.info('[CloudEvent] source: ${event.source}, subject: ${event.subject}');
  stderr.writeln(_encoder.convert(event));
}
