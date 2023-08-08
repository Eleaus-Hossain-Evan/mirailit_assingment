
import 'package:flutter_easylogger/flutter_logger.dart';

import '../domain/cart/order_body.dart';
import '../domain/cart/order_response.dart';
import '../domain/simple_response.dart';
import '../utils/utils.dart';

class CartRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, OrderResponse>> placeOrder(OrderBody body) async {
    final data = await api.post(
      endPoint: APIRoute.ORDER_CREATE,
      body: body.toMap(),
      fromData: (json) => OrderResponse.fromMap(json),
      withToken: true,
    );

    Logger.v("data: $data");

    return data;
  }

  Future<Either<CleanFailure, SimpleResponse>> bidPart(
      String id, double price) async {
    final data = await api.post(
      endPoint: '',
      body: {"id": id, "bidingAmount": price},
      fromData: (json) => SimpleResponse.fromMap(json),
      withToken: true,
    );

    Logger.v("data: $data");

    return data;
  }
}
