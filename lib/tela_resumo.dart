import 'package:flutter/material.dart';

class TelaResumo extends StatelessWidget {
  final String item;
  final int quantidade;
  final double total;

  const TelaResumo({
    super.key,
    required this.item,
    required this.quantidade,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo do Pedido'),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.green,
              ),

              const SizedBox(height: 20),

              Text(
                'Item: $item',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                'Quantidade: $quantidade',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Total: R\$ ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(
                  'Confirmar Pedido',
                ),
              ),

              const SizedBox(height: 10),

              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Voltar e Alterar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}