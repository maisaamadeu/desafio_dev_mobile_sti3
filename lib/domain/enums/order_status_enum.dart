enum OrderStatusEnum {
  pending,
  approved,
  canceled,
}

extension OrderStatusEnumExtension on OrderStatusEnum {
  static OrderStatusEnum fromString(String status) {
    switch (status.toLowerCase()) {
      case 'pending' || 'pendente':
        return OrderStatusEnum.pending;
      case 'approved' || 'aprovado':
        return OrderStatusEnum.approved;
      case 'canceled' || 'cancelado':
        return OrderStatusEnum.canceled;
      default:
        throw Exception('Invalid Order Status: $status');
    }
  }

  String get getName {
    switch (this) {
      case OrderStatusEnum.pending:
        return 'Pendente';
      case OrderStatusEnum.approved:
        return 'Aprovado';
      case OrderStatusEnum.canceled:
        return 'Cancelado';
      default:
        throw Exception('Invalid Order Status: $this');
    }
  }
}
