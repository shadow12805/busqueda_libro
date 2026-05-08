import 'dart:io';
import '../models/books.dart';
import '../utils/valodation.dart';

// ============================================
// PERSONA 3: ACTUALIZAR LIBRO
// ============================================

class Persona3Actualizar {
  final List<Libro> books;

  Persona3Actualizar(this.books);

  void ejecutar() {
    print("\n--- ACTUALIZAR LIBRO ---");

    if (books.isEmpty) {
      print("\n⚠️  No hay libros para actualizar.\n");
      return;
    }

    // Mostrar libros disponibles
    print("\n📖 Libros disponibles:");
    print("-" * 45);
    for (int i = 0; i < books.length; i++) {
      print(" [$i] ${books[i]}");
    }

    // Solicitar índice
    final indice = Validaciones.leerEntero("\nIngrese el índice del libro a actualizar: ");
    if (indice == null) return;
    if (!Validaciones.indiceValido(indice, books.length)) return;

    final libro = books[indice];
    print("\n📖 Libro seleccionado: ${libro.titulo} | ${libro.autor} | ${libro.anio}");
    print("\n💡 Deje en blanco si NO desea cambiar ese campo.\n");

    // Actualizar TÍTULO
    stdout.write("Nuevo título [${libro.titulo}]: ");
    final nuevoTitulo = stdin.readLineSync();
    if (nuevoTitulo != null && nuevoTitulo.trim().isNotEmpty) {
      final validado = Validaciones.validarNoVacio(nuevoTitulo, "Título");
      if (validado != null) libro.titulo = validado;
    }

    // Actualizar AUTOR
    stdout.write("Nuevo autor [${libro.autor}]: ");
    final nuevoAutor = stdin.readLineSync();
    if (nuevoAutor != null && nuevoAutor.trim().isNotEmpty) {
      final validado = Validaciones.validarNoVacio(nuevoAutor, "Autor");
      if (validado != null) libro.autor = validado;
    }

    // Actualizar AÑO
    stdout.write("Nuevo año [${libro.anio}]: ");
    final nuevoAnioStr = stdin.readLineSync();
    if (nuevoAnioStr != null && nuevoAnioStr.trim().isNotEmpty) {
      final validado = Validaciones.validarAnio(nuevoAnioStr);
      if (validado != null) libro.anio = validado;
    }

    print("\n✅ Libro actualizado exitosamente:");
    print("   ${libro.titulo} | ${libro.autor} | ${libro.anio}\n");
  }
}