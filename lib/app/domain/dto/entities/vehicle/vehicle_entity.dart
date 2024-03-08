import '../entity.dart';

class VehicleEntity implements Entity {
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

  factory VehicleEntity.fromJson(dynamic json) {
    return VehicleEntity(
      id: json['id'],
      timestampCadastro: json['timestamp_cadastro'],
      modeloId: json['modelo_id'],
      ano: json['ano'],
      combustivel: json['combustivel'],
      numPortas: json['num_portas'],
      cor: json['cor'],
      nomeModelo: json['nome_modelo'],
      valor: json['valor'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp_cadastro': timestampCadastro,
      'modelo_id': modeloId,
      'ano': ano,
      'combustivel': combustivel,
      'num_portas': numPortas,
      'cor': cor,
      'nome_modelo': nomeModelo,
      'valor': valor,
    };
  }
}
