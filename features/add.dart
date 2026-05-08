import 'dart:io';
import '../models/books.dart';
import '../utils/valodation.dart';

// ============================================
// PERSONA 1: AGREGAR LIBRO
// ============================================

class Persona1Agregar {
  final List<Libro> books;

  Persona1Agregar(this.books);

  void ejecutar() {
    print("\n--- AGREGAR LIBRO ---");

    final titulo = Validaciones.leerTexto("Ingrese el nombre del libro: ");
    if (titulo == null) return;

    final autor = Validaciones.leerTexto("Ingrese el autor del libro: ");
    if (autor == null) return;

    stdout.write("Ingrese el año de publicación del libro: ");
    final anio = Validaciones.validarAnio(stdin.readLineSync());
    if (anio == null) return;

    books.add(Libro(titulo: titulo, autor: autor, anio: anio));
    print("\n✅ Libro agregado exitosamente.\n");
  }
}