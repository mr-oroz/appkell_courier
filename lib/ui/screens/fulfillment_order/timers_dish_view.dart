import 'dart:async';

import 'package:appkel_for_courier_flutter/data/models/duration_timers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/order_model.dart';
import 'widgets/absolute_timer_widget.dart';
import 'widgets/relative_timer_widget.dart';

class TimersDishView extends HookConsumerWidget {
  const TimersDishView({
    super.key,
    required this.status,
    required this.durationTimersModel,
    this.timeStampDelivery,
  });

  final OrderDishStatus status;
  final DurationDishTimersModel durationTimersModel;
  final String? timeStampDelivery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStoppedTimer = useState(false);

    final remainingTimes = useState<List<ValueNotifier<Duration>>>([
      ValueNotifier(durationTimersModel.preparing!),
      ValueNotifier(durationTimersModel.courierSendingTimer!),
      ValueNotifier(Duration.zero),
      ValueNotifier(durationTimersModel.sendingSettings!),
    ]);

    final currentTimerIndex = useState(0);

    Timer? timer;

    void handleTimeUpdate(int index, Duration remainingTime) {
      if (remainingTime >= Duration.zero) {
        remainingTimes.value[index].value = remainingTime;
      } else {
        timer?.cancel();
      }
    }

    useEffect(() {
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        if (isStoppedTimer.value) {
          t.cancel();
          return;
        }
        handleTimeUpdate(
          currentTimerIndex.value,
          remainingTimes.value[currentTimerIndex.value].value +
              const Duration(seconds: 1),
        );
      });

      return () {
        timer?.cancel();
      };
    }, [status]);

    useEffect(() {
      switch (status) {
        case OrderDishStatus.preparing:
          currentTimerIndex.value = 0;
          break;
        case OrderDishStatus.searchCourier:
          currentTimerIndex.value = 1;
          break;
        //case OrderDishStatus.paymentCheck:
        //  currentTimerIndex.value = 2;
        //  break;
        case OrderDishStatus.planned:
          final difference = getDeliveryTimeDifference(timeStampDelivery);
          if (difference == null) return;
          remainingTimes.value[2].value = difference;
          currentTimerIndex.value = 2;
          break;
        case OrderDishStatus.sending:
          remainingTimes.value[3].value = Duration.zero;
          currentTimerIndex.value = 3;
          break;
        case OrderDishStatus.canceledByClient ||
              OrderDishStatus.canceledByShop ||
              OrderDishStatus.canceled:
          isStoppedTimer.value = true;
          break;

        default:
          break;
      }
      return null;
    }, [status]);

    return Column(
      children: [
        const Gap(25),
        Row(
          children: [
            const Gap(10),
            Expanded(
              child: AbsoluteTimerWidget(
                key: const ValueKey('preparing'),
                duration: remainingTimes.value[0].value,
                onTimerEnd: () {},
                isRunning: currentTimerIndex.value == 0,
                isCompleted: currentTimerIndex.value > 0,
              ),
            ),
            const Gap(10),
            //Expanded(
            //  child: AbsoluteTimerWidget(
            //    key: const ValueKey('courierSendingTimer'),
            //    duration: remainingTimes.value[1].value,
            //    onTimerEnd: () {
            //      if (currentTimerIndex.value != 1) return;
            //      WidgetsBinding.instance.addPostFrameCallback((_) {
            //        ScaffoldMessenger.of(context).showSnackBar(
            //          const SnackBar(
            //            content: Text(
            //                'Заказ был отменен, так как клиент не оплатил.'),
            //          ),
            //        );

            //        Navigator.of(context).pop();
            //      });
            //    },
            //    isRunning: currentTimerIndex.value == 1,
            //    isCompleted: currentTimerIndex.value > 1,
            //  ),
            //),
            Expanded(
              child: AbsoluteTimerWidget(
                key: const ValueKey('searchCourier'),
                duration: remainingTimes.value[1].value,
                onTimerEnd: () {},
                isRunning: currentTimerIndex.value == 1,
                isCompleted: currentTimerIndex.value > 1,
              ),
            ),
            const Gap(10),
            //Expanded(
            //  child: AbsoluteTimerWidget(
            //    key: const ValueKey('paymentCheck'),
            //    duration: remainingTimes.value[2].value,
            //    onTimerEnd: () {
            //      if (currentTimerIndex.value != 2) return;
            //      WidgetsBinding.instance.addPostFrameCallback((_) {
            //        // ScaffoldMessenger.of(context).showSnackBar(
            //        //   SnackBar(
            //        //     content: Text(Strings.of(context).orderWasCanceled),
            //        //   ),
            //        // );
            //        // Navigator.of(context).pop();
            //      });
            //    },
            //    isRunning: currentTimerIndex.value == 2,
            //    isCompleted: currentTimerIndex.value > 2,
            //  ),
            //),
            if (timeStampDelivery != null) ...[
              const Gap(10),
              Expanded(
                child: AbsoluteTimerWidget(
                  color: Colors.green,
                  backgroundColor: Colors.green.withOpacity(0.2),
                  key: const ValueKey('planned'),
                  duration: remainingTimes.value[2].value,
                  onTimerEnd: () {},
                  isRunning: currentTimerIndex.value == 3,
                  isCompleted: currentTimerIndex.value > 3,
                ),
              ),
            ],
            const Gap(10),
            Expanded(
              child: RelativeTimerWidget(
                currentTime: remainingTimes.value[3].value,
                duration: durationTimersModel.sendingSettings ??
                    const Duration(minutes: 25),
                key: const ValueKey('sending'),
                onTimerEnd: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Вы не успеваете доставить заказ, не забудьте нажать "Завершить отправку заказа".'),
                      ),
                    );
                  });
                },
                isRunning: currentTimerIndex.value == 4,
                isCompleted: currentTimerIndex.value > 4,
              ),
            ),
          ],
        ),
        const Gap(10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            getTimerName(status),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ValueListenableBuilder(
            valueListenable: remainingTimes.value[currentTimerIndex.value],
            builder: (context, value, child) => Text(
              'Осталось ${value.inMinutes.toString().padLeft(2, '0')}:'
              '${(value.inSeconds % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Color(0xFFFF6C29),
                fontSize: 12,
                height: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getTimerName(OrderDishStatus status) {
    switch (status) {
      case OrderDishStatus.preparing:
        return 'Готовка 📦';
      case OrderDishStatus.searchCourier:
        return 'Поиск курьера 🛵';
      case OrderDishStatus.sending:
        return 'Отправка 🛵';
      default:
        return '';
    }
  }
}

Duration? getDeliveryTimeDifference(String? timeStampDelivery) {
  if (timeStampDelivery == null) return null;
  List<String> timeParts = timeStampDelivery.split(':');
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);
  DateTime deliveryDateTime = DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, hour, minute);
  DateTime now = DateTime.now();
  return deliveryDateTime.difference(now);
}
