part of 'internet1_cubit.dart';

@immutable
sealed class Internet1State {}

final class Internet1Initial extends Internet1State {}

class Internet1LostState extends Internet1State{}
class Internet1GainedState extends Internet1State{}