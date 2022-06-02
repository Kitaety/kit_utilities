import 'package:flutter/cupertino.dart';

@immutable
abstract class ExchangeRatesEvent {}

class ExchangeRatesLoadEvent extends ExchangeRatesEvent {}
