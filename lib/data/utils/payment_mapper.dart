import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/data/models/payment_model.dart';

PaymentEntity paymentEntityMapper(PaymentModel payment) {
  return PaymentEntity(
    id: payment.id,
    installment: payment.installment,
    value: payment.value,
    code: payment.code,
    name: payment.name,
  );
}

PaymentModel paymentModelMapper(PaymentEntity payment) {
  return PaymentModel(
    id: payment.id,
    installment: payment.installment,
    value: payment.value,
    code: payment.code,
    name: payment.name,
  );
}
