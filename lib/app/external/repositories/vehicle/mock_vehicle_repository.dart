import '../../../domain/dto/entities/vehicle/vehicle_entity.dart';
import '../../../domain/repositories/vehicle_repository.dart';

class MockVehicleRepository extends VehicleRepository {
  MockVehicleRepository();

  @override
  Future<List<VehicleEntity>> index() async {
    return [
      const VehicleEntity(
        id: 1,
        timestampCadastro: 1696539488,
        modeloId: 12,
        ano: 2015,
        combustivel: "FLEX",
        numPortas: 4,
        cor: "BEGE",
        nomeModelo: "ONIX PLUS",
        valor: 50.000,
      ),
      const VehicleEntity(
        id: 2,
        timestampCadastro: 1696531234,
        modeloId: 14,
        ano: 2014,
        combustivel: "FLEX",
        numPortas: 4,
        cor: "AZUL",
        nomeModelo: "JETTA",
        valor: 49.000,
      ),
      const VehicleEntity(
        id: 3,
        timestampCadastro: 16965354321,
        modeloId: 79,
        ano: 1993,
        combustivel: "DIESEL",
        numPortas: 4,
        cor: "AZUL",
        nomeModelo: "HILLUX SW4",
        valor: 47.500,
      ),
    ];
  }
}
