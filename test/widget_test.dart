import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aula7_navegacao/main.dart';

void main() {
  testWidgets('Teste da tela principal', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Seleção de Itens'), findsOneWidget);

    expect(find.text('Smartphone Galaxy S24'), findsOneWidget);

    expect(find.text('1'), findsOneWidget);

    expect(find.text('Zerar Contador'), findsOneWidget);

    expect(find.text('Avançar para Resumo'), findsOneWidget);
  });

  testWidgets('Teste do botão adicionar', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    await tester.tap(find.byIcon(Icons.add));

    await tester.pump();

    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('Teste do botão diminuir', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    await tester.tap(find.byIcon(Icons.add));

    await tester.pump();

    await tester.tap(find.byIcon(Icons.remove));

    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}