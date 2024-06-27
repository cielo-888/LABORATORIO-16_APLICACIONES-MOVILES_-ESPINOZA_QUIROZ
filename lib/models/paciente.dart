class Paciente {
  final int id;
  final String nombre;
  final int edad;
  final String especie;
  final DateTime fechaNacimiento;
  final bool vacunado;

  Paciente({
    required this.id,
    required this.nombre,
    required this.edad,
    required this.especie,
    required this.fechaNacimiento,
    required this.vacunado,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'],
      nombre: json['nombre'],
      edad: json['edad'],
      especie: json['especie'],
      fechaNacimiento: DateTime.parse(json['fechaNacimiento']),
      vacunado: json['vacunado'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'edad': edad,
    'especie': especie,
    'fechaNacimiento': fechaNacimiento.toIso8601String(),
    'vacunado': vacunado,
  };
}
