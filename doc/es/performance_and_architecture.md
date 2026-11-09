# 🏗️ Arquitectura y Rendimiento Técnico

El paquete **`flutter_native_ui_nyk`** fue diseñado bajo principios estrictos de **alto rendimiento gráfico, consumo nulo de dependencias externas y optimización de memoria**.

---

## ⚡ Principios de Diseño Gráfico

### 1. Cero Dependencias de Parsing (0 SVG / 0 TTF)
La mayoría de librerías de iconos y animaciones dependen de parseadores XML/SVG en tiempo de ejecución (como `flutter_svg`) o archivos de animaciones Lottie (JSON). Esto introduce:
- Decodificación y parseo continuo en CPU.
- Aumento sustancial del tamaño del APK/IPA.
- Latencia en el renderizado inicial (*frame drop*).

**`flutter_native_ui_nyk`** resuelve esto mediante **código Dart puro**, dibujando comandos geométricos de vectores (`Path`, `drawArc`, `drawRRect`, `drawCircle`) directamente sobre la instancia `Canvas` de Flutter.

---

## 🛡️ Aislamiento de Renderizado con `RepaintBoundary`

En Flutter, cuando un widget solicita repintarse (por ejemplo, mediante `AnimationController.addListener` o `setState`), por defecto puede invalidar la capa de dibujo (*layer*) de sus ancestros en la jerarquía.

Para evitar esto, **todas las 24 animaciones nativas** están envueltas internamente en un `RepaintBoundary`:

```dart
@override
Widget build(BuildContext context) {
  return RepaintBoundary(
    child: AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _MiPintorAnimado(_controller.value),
        );
      },
    ),
  );
}
```

### Beneficios Técnicos:
- **Capa separada en la GPU**: Las animaciones corren en su propia capa de composición.
- **60 a 120 FPS constantes**: El árbol de UI principal no sufre recomposiciones ni repintados mientras la animación oscila.

---

## 📐 Escalado Geométrico y Responsive

Todos los componentes vectoriales parten de un lienzo de coordenadas de referencia `24.0 x 24.0` (o `48.0 x 48.0`). 

En el método `paint(Canvas canvas, Size size)` de cada `CustomPainter`, se aplica una transformación de matriz de escala:

```dart
final scale = size.width / 24.0;
canvas.scale(scale, scale);
```

Esto garantiza que el icono o animación mantenga proporciones exactas sin importar si se renderiza a `16px` o `512px`.

---

## 🧼 Gestión de Memoria y Ciclo de Vida

- **Liberación de Animaciones**: Los `AnimationController` están vinculados al ciclo de vida del widget con `SingleTickerProviderStateMixin` y se liberan explícitamente en el método `dispose()`:

```dart
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

- **Reutilización de Delegados (`shouldRepaint`)**: Los `CustomPainter` implementan comparaciones eficientes en `shouldRepaint` para evitar volver a ejecutar algoritmos de dibujo si los parámetros no han cambiado.

---

## 🌗 Adaptación Automática a ThemeData

Los componentes leen el contexto de tema mediante `Theme.of(context)` de manera pasiva:
- Si no se especifica un color explícito, los iconos toman la tonalidad por defecto del esquema de colores (`colorScheme.primary` u `onSurface`).
- Total compatibilidad con **Material 3**, modo oscuro y modo claro.
