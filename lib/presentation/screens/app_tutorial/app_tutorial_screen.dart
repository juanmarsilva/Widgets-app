import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
    final String title;
    final String caption;
    final String image;

    SlideInfo(
        this.title, 
        this.caption, 
        this.image
    );
}

final slides = <SlideInfo>[
    
    SlideInfo(
        'Busca la comida', 
        'Et veniam et cupidatat elit exercitation magna proident ea commodo excepteur fugiat tempor.', 
        'assets/images/1.png'
    ),
    
    SlideInfo(
        'Entrega rapida', 
        'Consectetur tempor irure qui nisi nisi laboris.', 
        'assets/images/2.png'
    ),

    SlideInfo(
        'Disfruta la comida', 
        'Sunt id magna culpa aliqua incididunt.', 
        'assets/images/3.png'
    ),
];

class AppTutorialScreen extends StatefulWidget {

    static const name = 'app_tutorial_screen';

    const AppTutorialScreen({super.key});

    @override
    State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

    final PageController pageViewController = PageController();
    bool endReached = false;

    @override
    void initState() {
        super.initState();

        pageViewController.addListener(() {
            final page = pageViewController.page ?? 0;

            if(!endReached && page >= (slides.length - 1.5)) {
                setState(() {
                    endReached = true;
                });
            }
        });
    }

    /* 
       * Es buena practica utilizar o llamar al dispose siempre que utilizamos un controlador o agregamos un listener
       * De esta manera se limpian los listeners y no gastamos más memoria de la necesaria.
    */
    @override
    void dispose() {

        pageViewController.dispose();

        super.dispose();
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
                children: [

                    PageView(
                        controller: pageViewController,
                        physics: const BouncingScrollPhysics(),
                        children: slides.map((slide) => _Slide(slide: slide)).toList(),
                    ),

                    Positioned(
                        right: 20,
                        top: 50,
                        child: TextButton(
                            child: const Text('Salir'),
                            onPressed: () => context.pop(),
                        ),
                    ),

                    endReached 
                        ? Positioned(
                            bottom: 30,
                            right: 30,
                            child: FadeInRight(
                                from: 15,
                                delay: const Duration( seconds: 1 ),
                                child: FilledButton(
                                    onPressed: () => context.pop(), 
                                    child: const Text('Comenzar')
                                )
                            )
                        )
                        : const SizedBox()
                ],
            )
        );
    }
}

class _Slide extends StatelessWidget {

    final SlideInfo slide;

    const _Slide({
        required this.slide
    });

    @override
    Widget build(BuildContext context) {

        final titleStyle = Theme.of(context).textTheme.titleLarge;

        final captionStyle = Theme.of(context).textTheme.bodySmall;

        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                        Image(
                            image: AssetImage( slide.image )
                        ),

                        const SizedBox(height: 20),

                        Text( slide.title, style: titleStyle, ),

                        const SizedBox(height: 10),

                        Text( slide.caption, style: captionStyle ),
                    ],
                ),
            ),
        );
    }
}