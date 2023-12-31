import 'package:flutter/material.dart';

class MenuItems {

    final String title;
    final String subtitle;
    final String link;
    final IconData icon;

    const MenuItems({
        required this.title, 
        required this.subtitle, 
        required this.link, 
        required this.icon    
    });
}

const List<MenuItems> appMenuItems = [

    MenuItems(
        title: 'Botones', 
        subtitle: 'Varios botones en Flutter', 
        link: '/buttons', 
        icon: Icons.smart_button_outlined,
    ),

    MenuItems(
        title: 'Tarjetas', 
        subtitle: 'Un contenedor estilizado', 
        link: '/cards', 
        icon: Icons.credit_card,
    ),

    MenuItems(
        title: 'Progress Indicators', 
        subtitle: 'Generales y controlados', 
        link: '/progress', 
        icon: Icons.refresh_rounded,
    ),

    MenuItems(
        title: 'Snackbars y Dialogos', 
        subtitle: 'Indicadores en pantallas', 
        link: '/snackbars', 
        icon: Icons.info_outline,
    ),

    MenuItems(
        title: 'Animated Container', 
        subtitle: 'Stateful widget animado', 
        link: '/animated', 
        icon: Icons.check_box_outlined,
    ),

    MenuItems(
        title: 'UI Controls + Tiles', 
        subtitle: 'Una serie de controles en Flutter', 
        link: '/ui-controls', 
        icon: Icons.car_rental_outlined,
    ),

    MenuItems(
        title: 'Introducción a la aplicación', 
        subtitle: 'Pequeño tutorial introductorio', 
        link: '/tutorial', 
        icon: Icons.accessible_rounded,
    ),

    MenuItems(
        title: 'Infinite Scroll y Pull', 
        subtitle: 'Listas infinitas y pull to refresh', 
        link: '/infinite-scroll', 
        icon: Icons.list_alt_rounded,
    ),

    MenuItems(
        title: 'Counter Screen', 
        subtitle: 'Contador numerico', 
        link: '/counter', 
        icon: Icons.plus_one_outlined,
    ),

    MenuItems(
        title: 'Cambiar tema', 
        subtitle: 'Cambiar tema de la aplicacion', 
        link: '/theme-changer', 
        icon: Icons.color_lens_outlined,
    ),
];