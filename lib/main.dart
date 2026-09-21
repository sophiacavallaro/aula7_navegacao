import 'package:flutter/material.dart';
import 'tela_resumo.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aula 7 - Navegação',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
      ),
      home: const TelaContador(),
    );
  }
}

class TelaContador extends StatefulWidget {
  const TelaContador({super.key});

  @override
  State<TelaContador> createState() {
    return _TelaContadorState();
  }
}

class _TelaContadorState extends State<TelaContador> {
  int quantidade = 1;

  final String nomeProduto = 'Smartphone Galaxy S24';

  final double precoUnitario = 150.00;

  void aumentar() {
    setState(() {
      quantidade++;
    });
  }

  void diminuir() {
    if (quantidade > 1) {
      setState(() {
        quantidade--;
      });
    }
  }

  void zerar() {
    setState(() {
      quantidade = 1;
    });
  }

  Future<void> abrirResumo() async {
    final confirmado = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TelaResumo(
            item: nomeProduto,
            quantidade: quantidade,
            total: quantidade * precoUnitario,
          );
        },
      ),
    );

    if (!mounted) {
      return;
    }

    if (confirmado == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Pedido Confirmado com Sucesso!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seleção de Itens',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nomeProduto,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                'R\$ ${precoUnitario.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filledTonal(
                    onPressed: diminuir,
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Text(
                      '$quantidade',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  IconButton.filledTonal(
                    onPressed: aumentar,
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                'Total: R\$ ${(quantidade * precoUnitario).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              OutlinedButton(
                onPressed: zerar,
                child: const Text(
                  'Zerar Contador',
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: abrirResumo,
                child: const Text(
                  'Avançar para Resumo',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}