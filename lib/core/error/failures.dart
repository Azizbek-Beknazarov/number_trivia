import 'package:equatable/equatable.dart';

abstract class XatoBilan extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerXato extends XatoBilan {}

class CacheXato extends XatoBilan {}
