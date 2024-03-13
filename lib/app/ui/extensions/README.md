# Context Extension

Essa extension me permite trabalhar com variáveis que dependem de contexto de forma facilitada, por
exemlo:

em vez de pegar o colorScheme do app da forma nativa

```dart
void build(BuildContext context) {
  final colorScheme = Theme
      .of(context)
      .colorScheme;
}
```

eu posso pegar da seguinte forma

```dart
void build(BuildContext context) {
  final colorScheme = context.colorScheme;
}
```

