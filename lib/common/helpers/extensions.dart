import 'package:flutter/material.dart';
import 'package:kavall/common/models/result.dart';

extension FutureToResultExtension<T> on Future<T> {
  Future<Result<T>> toResult() async {
    try {
      return Result<T>.success(data: await this);
    }
    //todo here we can catch, identify and create our custom exceptions.
    on Exception catch (e, st) {
      return Result<T>.failed(
        message: e.toString(),
        exception: e,
        stackTrace: st,
      );
    }
  }
}

///groups the list items by the property returned from the [keyFunction] method, returns a map with
///this property as a key and a list of objects in the initial list
extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
