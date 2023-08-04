import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

    static const name = 'progress_screen';

    const ProgressScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Progress Indicators')
            ),
            body: const _ProgressIndicatorsView(),
        );
    }
}

class _ProgressIndicatorsView extends StatelessWidget {

  
    const _ProgressIndicatorsView();

    @override
    Widget build(BuildContext context) {

        final colors = Theme.of(context).colorScheme;

        return Center(
            child: Column(
                children: [
                    const SizedBox( height: 30 ),

                    const Text( 'Circular progress Indicator' ),
                    const SizedBox( height: 10 ),
                    CircularProgressIndicator(
                        strokeWidth: 2, 
                        backgroundColor: colors.primary
                    ),

                    const SizedBox( height: 20 ),
                    const Text( 'Circular y Linear Controlado' ),
                    const SizedBox( height: 10 ),
                    const _ControllerProgressIndicator(),
                ],
            ),
        );
    }
}

class _ControllerProgressIndicator extends StatelessWidget {

    const _ControllerProgressIndicator();

    @override
    Widget build(BuildContext context) {

        final colors = Theme.of(context).colorScheme;

        return StreamBuilder(
            stream: Stream.periodic( const Duration( milliseconds: 300 ), (value) {
                return ( value * 2 ) / 100;
            }).takeWhile(( value ) => value < 100),
            builder: (context, snapshot) {

                final progressValue = snapshot.data ?? 0;

                return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            
                        CircularProgressIndicator(
                            value: progressValue,
                            strokeWidth: 2,
                            backgroundColor: colors.primary,
                        ),
            
                        const SizedBox(width: 20),
            
                        Expanded(
                            child: LinearProgressIndicator(value: progressValue)
                        )
                    ],
                )
            );
            } 
        );
    }
}