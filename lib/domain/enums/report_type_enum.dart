enum ReportTypeEnum {
  mostSoldProducts,
  paymentMethodsPerDay,
  salesByCity,
  salesByAgeGroup,
}

extension ReportTypeExtension on ReportTypeEnum {
  String get displayName {
    switch (this) {
      case ReportTypeEnum.mostSoldProducts:
        return 'Listagem de Produtos mais vendidos';
      case ReportTypeEnum.paymentMethodsPerDay:
        return 'Totalização de Formas de Pagamento por Dia';
      case ReportTypeEnum.salesByCity:
        return 'Totalização de Vendas por Cidade';
      case ReportTypeEnum.salesByAgeGroup:
        return 'Totalização de Vendas por Faixa Etária';
      default:
        return '';
    }
  }
}
