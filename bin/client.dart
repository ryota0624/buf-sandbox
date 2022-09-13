import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:buf_sandbox/buf_sandbox.dart' as sandbox;

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
      CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  final stub = sandbox.TodoServiceClient(channel);

  final id = args.isNotEmpty ? args[0] : Random().nextDouble().toString();

  try {
    final response = await stub.create(
      sandbox.Todo()..id = id,
      options: CallOptions(compression: const GzipCodec()),
    );
    print('receive response: ${response}');
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}
