import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part '../hive_adapters/client_entity.g.dart';

@HiveType(typeId: 0)
class ClientEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String cnpj;
  @HiveField(2)
  final String cpf;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String corporateName;
  @HiveField(5)
  final String email;
  @HiveField(6)
  final DateTime birthDate;

  const ClientEntity({
    required this.id,
    required this.cnpj,
    required this.cpf,
    required this.name,
    required this.corporateName,
    required this.email,
    required this.birthDate,
  });

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

  @override
  String toString() {
    return ''''
    ClientEntity {
      id: $id,
      cnpj: $cnpj,
      cpf: $cpf,
      name: $name,
      corporateName: $corporateName,
      email: $email,
      birthDate: $birthDate,
    }
  ''';
  }
}
