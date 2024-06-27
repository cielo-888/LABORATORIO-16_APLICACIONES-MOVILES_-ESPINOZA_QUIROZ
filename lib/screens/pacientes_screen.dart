import 'package:flutter/material.dart';
import 'package:veterinaria_app/models/paciente.dart';
import 'package:veterinaria_app/services/api_service.dart';

class PacientesScreen extends StatefulWidget {
  @override
  _PacientesScreenState createState() => _PacientesScreenState();
}

class _PacientesScreenState extends State<PacientesScreen> {
  late List<Paciente> pacientes;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final List<Paciente> fetchedPacientes = await apiService.getPacientes();
      setState(() {
        pacientes = fetchedPacientes;
      });
    } catch (e) {
      print('Error: $e');
      // Manejo de errores
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pacientes'),
      ),
      body: pacientes != null
          ? ListView.builder(
              itemCount: pacientes.length,
              itemBuilder: (context, index) {
                final paciente = pacientes[index];
                return ListTile(
                  title: Text(paciente.nombre),
                  subtitle: Text('Edad: ${paciente.edad}, Especie: ${paciente.especie}'),
                  onTap: () {
                    // Implementar navegación para editar o eliminar paciente
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Implementar navegación para pantalla de agregar paciente
        },
      ),
    );
  }
}
