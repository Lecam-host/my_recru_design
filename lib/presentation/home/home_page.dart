import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/core/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          leading: Icon(
            Icons.menu,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          title: SvgPicture.asset(SvgIconConstants.logo),
          actions: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AppImagesConstants.girl),
              backgroundColor: Colors.grey.shade300,
            ),
            const SizedBox(width: 10),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bonjour Lecam,',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                SizedBox(height: 8),

                Text(
                  'Bienvenue dans votre outil de gestion des contacts',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  height: 239,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(AppImagesConstants.girl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withAlpha(100),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Le pouvoir de votre réseau, simplifié et centralisé.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    context.push(PageName.mobileScannerPage);
                  },
                  child: Container(
                    height: 92,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Scanner le code QR pour ajouter un contact',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    fontSize: 20,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(SvgIconConstants.qrcode),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    context.push(PageName.contactHome);
                  },
                  child: Container(
                    height: 92,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Voir la liste des contacts',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          SvgPicture.asset(SvgIconConstants.nextDown),
                          // Icon(
                          //   Icons.arrow_forward,
                          //   color: Theme.of(context).colorScheme.primary,
                          //   size: 24,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Bouton Créer un contact
                GestureDetector(
                  onTap: () {
                    context.push(PageName.createContactPage);
                  },
                  child: Container(
                    height: 92,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Créer un contact',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                          SvgPicture.asset(
                            SvgIconConstants.contact,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget réutilisable pour les boutons d'action
class ActionButton extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final VoidCallback? onTap;
  final bool hasBorder;

  const ActionButton({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black87,
    this.iconColor = Colors.black87,
    this.onTap,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: hasBorder ? Border.all(color: Colors.grey.shade300) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    if (subtitle != null) ...[
                      SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 14,
                          color: textColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  backgroundColor == Theme.of(context).colorScheme.primary
                      ? 4
                      : 8,
                ),
                decoration: BoxDecoration(
                  color:
                      backgroundColor == Theme.of(context).colorScheme.primary
                      ? Colors.white.withOpacity(0.2)
                      : iconColor,
                  borderRadius: BorderRadius.circular(
                    backgroundColor == Theme.of(context).colorScheme.primary
                        ? 6
                        : 8,
                  ),
                ),
                child: Icon(
                  icon,
                  color:
                      backgroundColor == Theme.of(context).colorScheme.primary
                      ? Colors.white
                      : Colors.white,
                  size: backgroundColor == Theme.of(context).colorScheme.primary
                      ? 20
                      : 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
