// ============================================
// MODELO DE DATOS (compartido - todos lo usan)
// ============================================

class Libro {
  String titulo;
  String autor;
  int anio;

  Libro({required this.titulo, required this.autor, required this.anio});

  @override
  String toString() {
    return '$titulo | $autor | $anio';
  }
}