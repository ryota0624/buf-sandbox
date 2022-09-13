import 'package:buf_sandbox/generated/proto/dart/google/protobuf/empty.pb.dart';
import 'package:grpc/src/server/call.dart';

import './generated/proto/dart/todo/v1/todo.pbgrpc.dart';
export './generated/proto/dart/todo/v1/todo.pbgrpc.dart';

int calculate() {
  return 6 * 7;
}

class TodoService extends TodoServiceBase {
  @override
  Future<Empty> create(ServiceCall call, Todo request) {
    print(request);
    // TODO: implement create
    return Future(() => Empty.create());
  }

}
