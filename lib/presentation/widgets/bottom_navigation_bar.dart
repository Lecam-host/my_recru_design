import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_recru_design/core/assets.dart';

class CustomBottomNavIcon extends StatelessWidget {
  const CustomBottomNavIcon({
    this.isActive = false,
    required this.icon,
    required this.titre,
    super.key,
  });

  final bool isActive;
  final String icon;
  final String titre;

  @override
  Widget build(BuildContext context) {
    Color activeColor = Theme.of(context).colorScheme.primary;
    Color inactiveColor = Colors.black;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            isActive ? activeColor : inactiveColor,
            BlendMode.srcIn,
          ),
          width: 24,
          height: 24,
        ),
        const SizedBox(height: 4),
        Text(
          titre,
          style: TextStyle(
            color: isActive ? activeColor : inactiveColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 102,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // IconButton(
                    //   isActive: widget.child.currentIndex == 0,
                    //   icon: SvgIconConstants.appIcon,
                    //   titre: 'Accueil',
                    // )
                    GestureDetector(
                      onTap: () => _onItemTapped(0),
                      child: CustomBottomNavIcon(
                        icon: SvgIconConstants.favorite,
                        titre: 'Favoris',
                        isActive: widget.child.currentIndex == 0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _onItemTapped(1),
                      child: CustomBottomNavIcon(
                        icon: SvgIconConstants.recent,
                        titre: 'Récent',
                        isActive: widget.child.currentIndex == 1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _onItemTapped(2),
                      child: CustomBottomNavIcon(
                        icon: SvgIconConstants.contact,
                        titre: 'Contact',
                        isActive: widget.child.currentIndex == 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: ,

      //  Stack(
      //   children: [
      //     Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Expanded(child: widget.child),
      //         SizedBox(height: 130),
      //       ],
      //     ),
      //     Positioned(
      //       bottom: 40,
      //       left: 20,
      //       right: 20,
      //       child: ,
      //     ),
      //   ],
      // ),
      extendBody: true,
      // bottomNavigationBar: ,
    );
  }

  void _onItemTapped(int index) {
    widget.child.goBranch(
      index,
      initialLocation: index == widget.child.currentIndex,
    );
  }
}
