import 'package:buf_sandbox/buf_sandbox.dart' as buf_sandbox;
import 'package:grpc/grpc.dart';

Future<void> main(List<String> args) async {
  final server = Server(
    [buf_sandbox.TodoService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
