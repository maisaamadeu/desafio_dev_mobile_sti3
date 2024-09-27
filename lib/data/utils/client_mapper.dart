import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

ClientEntity clientEntityMapper(ClientModel client) {
  return ClientEntity(
    id: client.id,
    cnpj: client.cnpj,
    cpf: client.cpf,
    name: client.name,
    corporateName: client.corporateName,
    email: client.email,
    birthDate: client.birthDate,
  );
}

ClientModel clientModelMapper(ClientEntity client) {
  return ClientModel(
    id: client.id,
    cnpj: client.cnpj,
    cpf: client.cpf,
    name: client.name,
    corporateName: client.corporateName,
    email: client.email,
    birthDate: client.birthDate,
  );
}
