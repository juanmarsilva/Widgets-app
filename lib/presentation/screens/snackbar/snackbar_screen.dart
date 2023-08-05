import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

    static const name = 'snackbar_screen';

    const SnackbarScreen({super.key});

    void showCustomSnackbar( BuildContext context) {

        ScaffoldMessenger.of(context).clearSnackBars();

        final snackbar = SnackBar(
            content: const Text('Hola mundo'),
            action: SnackBarAction(label: 'Ok', onPressed: () {}),
            duration: const Duration(seconds: 2),
        );

        ScaffoldMessenger.of(context).showSnackBar( snackbar );
    }

    void openDialog(BuildContext context) {

        showDialog(
            context: context,
            /* 
              *  Sirve para obligar al usuario a que tenga que presionar un boton para poder sacar el modal 
            */
            barrierDismissible: false,
            builder: (context) => AlertDialog(
                title: const Text('¿Estas seguro?'),
                content: const Text('Reprehenderit proident duis exercitation ut nulla commodo ad veniam officia aliquip nulla et. Sit excepteur est labore laboris dolore elit ex sunt. Sint exercitation anim reprehenderit mollit deserunt consectetur. Sit dolor pariatur laborum incididunt adipisicing incididunt. Laboris deserunt ipsum dolor velit sunt dolore ad Lorem nulla quis Lorem.'),
                actions: [

                    TextButton(
                        onPressed: () => context.pop(), 
                        child: const Text('Cancelar')
                    ),

                    FilledButton(
                        onPressed: () => context.pop(), 
                        child: const Text('Aceptar')
                    ),

                ],
            ),
        );


    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Snackbars y Dialogos'),
            ),

            body: Center(
                child: Column(
                    children: [

                        FilledButton.tonal(
                            onPressed: () {
                                showAboutDialog(
                                    context: context,
                                    children: [
                                        const Text('Nulla nostrud excepteur officia non eu incididunt. Do magna sint culpa proident ea quis mollit ipsum dolore aute enim ad officia. Proident nulla culpa reprehenderit eiusmod labore voluptate. Amet ullamco velit id nisi non. Consequat eiusmod tempor duis elit commodo nulla enim laborum. Ex ex cupidatat velit dolore duis id id ex qui.')
                                    ]
                                );
                            },
                            child: const Text('Licencias usadas'),
                        ),

                        FilledButton.tonal(
                            onPressed: () => openDialog(context),
                            child: const Text('Mostrar dialogo'),
                        ),

                    ],
                )
            ),


            floatingActionButton: FloatingActionButton.extended(
                icon: const Icon(Icons.remove_red_eye_outlined),
                label: const Text('Mostrar snackbar'),
                onPressed: () => showCustomSnackbar(context), 
            ),
        );
    }
}
