import '../entity.dart';

abstract class VehicleEntity implements Entity {
  final int id;
  final int timestampCadastro;
  final int modeloId;
  final int ano;
  final String combustivel;
  final int numPortas;
  final String cor;
  final String nomeModelo;
  final num valor;

  DateTime get timestampCadastroDate => DateTime.fromMillisecondsSinceEpoch(timestampCadastro * 1000);

  const VehicleEntity({
    required this.id,
    required this.timestampCadastro,
    required this.modeloId,
    required this.ano,
    required this.combustivel,
    required this.numPortas,
    required this.cor,
    required this.nomeModelo,
    required this.valor,
  });

}