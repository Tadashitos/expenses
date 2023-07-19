import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5); //Gerando um número aleatório
    _backgroundColor = colors[
        i]; //Pegando uma cor aleatória a partir do número aleatório gerado
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${widget.tr.value}'),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? ElevatedButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error))
            : IconButton(
                //Ícone de lixeira, pra excluir uma transação
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () => widget.onRemove(widget.tr.id),
              ),
      ),
    );
  }
}
