import 'dart:io';

// ============================================
// VALIDACIONES GENERALES (Persona 3)
// Reutilizable por todo el equipo
// ============================================

class Validaciones {
  /// Valida que un índice sea válido para una lista dada
  static bool indiceValido(int? indice, int longitudLista) {
    if (indice == null) {
      print("\n❌ Error: Debes ingresar un número válido.\n");
      return false;
    }
    if (longitudLista == 0) {
      print("\n❌ Error: No hay libros en el catálogo.\n");
      return false;
    }
    if (indice < 0 || indice >= longitudLista) {
      print("\n❌ Error: Índice fuera de rango. Debe estar entre 0 y ${longitudLista - 1}.\n");
      return false;
    }
    return true;
  }

  /// Valida que una cadena no esté vacía
  static String? validarNoVacio(String? valor, String campo) {
    if (valor == null || valor.trim().isEmpty) {
      print("\n❌ Error: El campo '$campo' no puede estar vacío.\n");
      return null;
    }
    return valor.trim();
  }

  /// Valida y parsea un año válido
  static int? validarAnio(String? entrada) {
    if (entrada == null || entrada.trim().isEmpty) {
      print("\n❌ Error: El año no puede estar vacío.\n");
      return null;
    }
    final anio = int.tryParse(entrada.trim());
    if (anio == null) {
      print("\n❌ Error: El año debe ser un número entero.\n");
      return null;
    }
    if (anio < 1450 || anio > DateTime.now().year + 1) {
      print("\n❌ Error: Año inválido. Debe estar entre 1450 y ${DateTime.now().year + 1}.\n");
      return null;
    }
    return anio;
  }

  /// Solicita confirmación al usuario (S/N)
  static bool confirmar(String mensaje) {
    while (true) {
      stdout.write("\n$mensaje (S/N): ");
      final respuesta = stdin.readLineSync()?.trim().toUpperCase();
      if (respuesta == 'S') return true;
      if (respuesta == 'N') return false;
      print("❌ Por favor ingresa 'S' para sí o 'N' para no.");
    }
  }

  /// Valida y parsea un entero desde entrada de usuario
  static int? leerEntero(String mensaje) {
    stdout.write(mensaje);
    final entrada = stdin.readLineSync();
    final valor = int.tryParse(entrada ?? '');
    if (valor == null) {
      print("\n❌ Error: Debes ingresar un número válido.\n");
      return null;
    }
    return valor;
  }

  /// Valida y lee un texto no vacío
  static String? leerTexto(String mensaje) {
    stdout.write(mensaje);
    final entrada = stdin.readLineSync();
    return validarNoVacio(entrada, "entrada");
  }
}