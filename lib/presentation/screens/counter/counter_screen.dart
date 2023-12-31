import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

    static const String name = 'counter_screen';

    const CounterScreen({super.key});

    @override
    Widget build( BuildContext context, WidgetRef ref ) {

        final int counterValue = ref.watch( counterProvider );
        final bool isDarkMode = ref.watch( isDarkModeProvider );

        return Scaffold(
            appBar: AppBar(
                title: const Text('Counter Screen'),
                actions: [
                    IconButton(
                        icon: Icon( 
                            isDarkMode 
                                ? Icons.dark_mode_outlined 
                                : Icons.light_mode_outlined
                            ),
                        onPressed: () {
                            ref.read( isDarkModeProvider.notifier ).update((isDarkMode) => !isDarkMode);
                        }, 
                    )
                ],
            ),

            body: Center(
                child: Text('Valor: $counterValue', style: Theme.of(context).textTheme.titleLarge),
            ),

            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    /* 
                      ? NUNCA usar watch dentro de metodos, se considera una super mala practica.
                      * En vez de eso hay que usar read. De esa manera detectamos el valor del estado y lo podemos cambiar.
                    */
                    ref.read( counterProvider.notifier ).state++;
                    // ref.read( counterProvider.notifier ).update((value) => value + 1);
                },
                child: const Icon(Icons.add),
            ),
        );
    }
}