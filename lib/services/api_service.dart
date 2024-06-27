import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:veterinaria_app/models/paciente.dart';

class ApiService {
  static const apiUrl = 'http://tu_api.com/pacientes'; // Reemplazar con la URL de tu API

  // Obtener todos los pacientes
  Future<List<Paciente>> getPacientes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Paciente> pacientes = data.map((json) => Paciente.fromJson(json)).toList();
      return pacientes;
    } else {
      throw Exception('Error al obtener pacientes');
    }
  }

  // Crear un paciente
  Future<Paciente> createPaciente(Paciente paciente) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(paciente.toJson()),
    );

    if (response.statusCode == 201) {
      return Paciente.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al crear paciente');
    }
  }

  // Actualizar un paciente
  Future<Paciente> updatePaciente(Paciente paciente) async {
    final response = await http.patch(
      Uri.parse('$apiUrl/${paciente.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(paciente.toJson()),
    );

    if (response.statusCode == 200) {
      return Paciente.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al actualizar paciente');
    }
  }

  // Eliminar un paciente
  Future<void> deletePaciente(int id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Error al eliminar paciente');
    }
  }
}