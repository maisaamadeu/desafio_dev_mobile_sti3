import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/presentation/presentation.dart';
import 'package:get/get.dart';

class ReportsViewModel extends BaseOrdersViewModel {
  Rx<ReportTypeEnum?> reportType = Rx<ReportTypeEnum?>(null);

  ReportsViewModel({
    required super.fetchOrdersUseCase,
    required super.getLocalOrdersUsecase,
    required super.clearLocalOrdersUsecase,
    required super.saveLocalOrdersUsecase,
    required super.ordersStreamController,
  });

  void setReportType(ReportTypeEnum? reportType) {
    this.reportType.value = reportType;
  }

  List<ItemModel> mostSoldProducts() {
    final List<ItemModel> items = [];
    for (var order in orders.value) {
      for (var item in order.items) {
        final index =
            items.indexWhere((element) => element.productId == item.productId);
        if (index != -1) {
          items[index] = items[index].copyWith(
            quantity: items[index].quantity + item.quantity,
          );
        } else {
          items.add(itemModelMapper(item));
        }
      }
    }
    items.sort((a, b) => b.quantity.compareTo(a.quantity));
    return items;
  }

  List<SalesCityModel> salesByCity() {
    final List<SalesCityModel> cities = [];
    for (var order in orders.value) {
      final index = cities.indexWhere(
        (element) =>
            element.city == order.deliveryAddress.city &&
            element.state == order.deliveryAddress.state,
      );
      if (index != -1) {
        cities[index] = cities[index].copyWith(
          totalValue: cities[index].totalValue + order.totalAmount,
          quantity: cities[index].quantity + 1,
        );
      } else {
        cities.add(
          SalesCityModel(
            city: order.deliveryAddress.city,
            state: order.deliveryAddress.state,
            quantity: 1,
            totalValue: order.totalAmount,
          ),
        );
      }
    }
    cities.sort((a, b) => b.totalValue.compareTo(a.totalValue));
    return cities;
  }

  List<SalesAgeGroupModel> salesByAgeGroup() {
    final List<SalesAgeGroupModel> ageGroups = [];
    for (var order in orders.value) {
      final ageGroup = calculateAgeGroup(order.client.birthDate);

      final index = ageGroups.indexWhere(
        (element) => element.ageGroup == ageGroup,
      );
      if (index != -1) {
        ageGroups[index] = ageGroups[index].copyWith(
          totalValue: ageGroups[index].totalValue + order.totalAmount,
          quantity: ageGroups[index].quantity + 1,
        );
      } else {
        ageGroups.add(
          SalesAgeGroupModel(
            ageGroup: ageGroup,
            quantity: 1,
            totalValue: order.totalAmount,
          ),
        );
      }
    }
    ageGroups.sort((a, b) => b.totalValue.compareTo(a.totalValue));
    return ageGroups;
  }

  AgeGroupEnum calculateAgeGroup(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    if (age <= 2) return AgeGroupEnum.infant;
    if (age <= 5) return AgeGroupEnum.toddler;
    if (age <= 12) return AgeGroupEnum.child;
    if (age <= 17) return AgeGroupEnum.teen;
    if (age <= 25) return AgeGroupEnum.youngAdult;
    if (age <= 39) return AgeGroupEnum.adult;
    if (age <= 59) return AgeGroupEnum.middleAged;
    if (age <= 79) return AgeGroupEnum.senior;
    return AgeGroupEnum.elderly;
  }

  List<PaymentsOnDayModel> paymentsOnDay() {
    Map<DateTime, List<PaymentModel>> paymentsOnDay = {};

    for (var order in orders.value) {
      for (var payment in order.payments) {
        final paymentDate =
            calculatePaymentDate(order.creationDate, payment.installment);
        if (paymentsOnDay.containsKey(paymentDate)) {
          paymentsOnDay[paymentDate]!.add(paymentModelMapper(payment));
        } else {
          paymentsOnDay[paymentDate] = [paymentModelMapper(payment)];
        }
      }
    }

    return paymentsOnDay.entries.map((entry) {
      return PaymentsOnDayModel(
        date: entry.key,
        paymentsOnDay: entry.value,
      );
    }).toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  DateTime calculatePaymentDate(DateTime creationDate, int installment) {
    return DateTime(
      creationDate.year,
      creationDate.month + (installment - 1),
      creationDate.day,
    );
  }
}
