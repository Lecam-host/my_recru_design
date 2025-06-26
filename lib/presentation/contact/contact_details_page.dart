import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/core/assets.dart';
import 'package:my_recru_design/presentation/contact/contact_home.dart';
import 'package:my_recru_design/presentation/widgets/button_custom.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({super.key, required this.contact});
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(width: double.infinity, child: Image.asset(contact.avatar)),
          // Photo de profil et informations principales
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),

                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.13],
                  colors: [Colors.white.withAlpha(0), Colors.white],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 10),
                  Text(
                    contact.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    contact.profession,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 10),
                  _buildContactItem(
                    icon: Icons.phone,
                    label: 'Téléphone',
                    value: contact.numero,
                    countryFlag: '🇨🇮',
                    onTap: () {},
                    showCallButton: true,
                  ),
                  SizedBox(height: 10),
                  _buildContactItem(
                    icon: Icons.email,
                    label: 'Adresse email',
                    value: contact.email,
                    onTap: () {},
                    showEmailButton: true,
                  ),
                  SizedBox(height: 10),
                  _buildActionButton(
                    icon: Icons.share,
                    text: 'Partager le contact',
                    onTap: () => _shareContact(context, contact),
                    context: context,
                  ),
                  SizedBox(height: 10),
                  _buildActionButton(
                    icon: Icons.delete,
                    text: 'Supprimer le contact',
                    onTap: () => _showDeleteConfirmation(context),
                    context: context,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: () {
                      // Action pour la caméra
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    String? countryFlag,
    required VoidCallback onTap,
    bool showCallButton = false,
    bool showEmailButton = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 245, 245, 245),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (countryFlag != null) ...[
                        Text(countryFlag, style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                      ],
                      Expanded(
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (showCallButton || showEmailButton)
              Container(
                height: showCallButton ? 60 : null,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B1538),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showCallButton) ...[
                      const Icon(Icons.message, color: Colors.white, size: 16),
                      const SizedBox(width: 8),
                      const Icon(Icons.phone, color: Colors.white, size: 16),
                    ],
                    if (showEmailButton)
                      const Icon(Icons.email, color: Colors.white, size: 16),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 245, 245),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
          ],
        ),
      ),
    );
  }

  void _canalSharing(BuildContext context, Contact contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Partager le contact',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(contact.name, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 4),
              Text(
                "Telephone",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 12),
              ),
              Row(
                children: [
                  Text('🇨🇮', style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      contact.numero,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: SvgPicture.asset(
                      SvgIconConstants.facebook,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),

                  SizedBox(width: 5),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    backgroundImage: AssetImage(contact.avatar),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    backgroundImage: AssetImage(contact.avatar),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ButtonCustom(
                backgroundColor: Colors.white,
                textColor: Theme.of(context).colorScheme.primary,
                withBoder: true,
                label: 'Annuler',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _shareContact(BuildContext context, Contact contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Partager le contact',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(contact.name, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 4),
              Text(
                "Telephone",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 12),
              ),
              Row(
                children: [
                  Text('🇨🇮', style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      contact.numero,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ButtonCustom(
                label: 'Continuer',
                onPressed: () {
                  context.pop();
                  _canalSharing(context, contact);
                },
              ),
              SizedBox(height: 10),

              ButtonCustom(
                backgroundColor: Colors.white,
                textColor: Theme.of(context).colorScheme.primary,
                withBoder: true,
                label: 'Annuler',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Placer dans la corbeille ?',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Ce contact sera supprimé de tous vos appareils synchronisés',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 10),
              ButtonCustom(label: 'Placer dans la corbeille', onPressed: () {}),
              SizedBox(height: 10),

              ButtonCustom(
                backgroundColor: Colors.white,
                textColor: Theme.of(context).colorScheme.primary,
                withBoder: true,
                label: 'Annuler',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
