enum AgeGroupEnum {
  infant,
  toddler,
  child,
  teen,
  youngAdult,
  adult,
  middleAged,
  senior,
  elderly,
}

extension AgeGroupEnumExtension on AgeGroupEnum {
  String get getName {
    switch (this) {
      case AgeGroupEnum.infant:
        return 'Bebê (0-2 anos)';
      case AgeGroupEnum.toddler:
        return 'Criança pequena (3-5 anos)';
      case AgeGroupEnum.child:
        return 'Criança (6-12 anos)';
      case AgeGroupEnum.teen:
        return 'Adolescente (13-17 anos)';
      case AgeGroupEnum.youngAdult:
        return 'Jovem adulto (18-25 anos)';
      case AgeGroupEnum.adult:
        return 'Adulto (26-39 anos)';
      case AgeGroupEnum.middleAged:
        return 'Meia idade (40-59 anos)';
      case AgeGroupEnum.senior:
        return 'Idoso (60-79 anos)';
      case AgeGroupEnum.elderly:
        return 'Idoso avançado (80+ anos)';
      default:
        throw Exception('Invalid Age Group: $this');
    }
  }
}
