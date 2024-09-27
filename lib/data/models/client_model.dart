import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/domain/entities/entities.dart';

class ClientModel extends ClientEntity {
  const ClientModel({
    required super.id,
    required super.cnpj,
    required super.cpf,
    required super.name,
    required super.corporateName,
    required super.email,
    required super.birthDate,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      cnpj: json['cnpj'],
      cpf: json['cpf'],
      name: json['nome'],
      corporateName: json['razaoSocial'],
      email: json['email'],
      birthDate: DateTime.parse(json['dataNascimento']),
    );
  }

  ClientModel copyWith({
    String? id,
    String? cnpj,
    String? cpf,
    String? name,
    String? corporateName,
    String? email,
    DateTime? birthDate,
  }) {
    return ClientModel(
      id: id ?? this.id,
      cnpj: cnpj ?? this.cnpj,
      cpf: cpf ?? this.cpf,
      name: name ?? this.name,
      corporateName: corporateName ?? this.corporateName,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  @override
  List<Object?> get props => [
        id,
        cnpj,
        cpf,
        name,
        corporateName,
        email,
        birthDate,
      ];
}
