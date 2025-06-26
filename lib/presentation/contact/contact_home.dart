import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/core/assets.dart';
import 'package:my_recru_design/presentation/widgets/button_custom.dart';
import 'package:my_recru_design/presentation/widgets/text_field.dart';

class ContactHome extends StatefulWidget {
  const ContactHome({super.key});

  @override
  ContactHomeState createState() => ContactHomeState();
}

class ContactHomeState extends State<ContactHome> {
  final List<Contact> contacts = [
    Contact(
      name: "Allhassane Coulibaly",
      avatar: AppImagesConstants.girl,
      profession: "Developpeur",
      numero: "0788730000",
      email: "user@gmail.com",
    ),
    Contact(
      name: "Mohamed Franck Seri",
      avatar: AppImagesConstants.girl,
      profession: "Developpeur",
      numero: "0788730000",
      email: "user@gmail.com",
    ),
    Contact(
      name: "Michael Owen",
      avatar: AppImagesConstants.girl,
      profession: "Developpeur",
      numero: "0788730000",
      email: "user@gmail.com",
    ),
    Contact(
      name: "Marina Alaba",
      avatar: AppImagesConstants.girl,
      profession: "Developpeur",
      numero: "0788730000",
      email: "user@gmail.com",
    ),
    Contact(
      name: "Isaac Barron Cypher",
      avatar: AppImagesConstants.girl,
      profession: "Developpeur",
      numero: "0788730000",
      email: "user@gmail.com",
    ),
    Contact(
      name: "Vanessa Kouakou",
      avatar: AppImagesConstants.girl,
      profession: "Developpeur",
      numero: "0788730000",
      email: "user@gmail.com",
    ),
    Contact(
      name: "Roy de Salem Niamkey",
      avatar: AppImagesConstants.girl,
      profession: "Developpeur",
      numero: "0788730000",
      email: "user@gmail.com",
    ),
    Contact(
      name: "Nina Ariane",
      avatar: AppImagesConstants.girl,
      profession: "Developpeur",
      numero: "0788730000",
      email: "user@gmail.com",
    ),
    Contact(
      name: "Nina Ariane",
      avatar: AppImagesConstants.girl,
      profession: "Developpeur",
      numero: "0788730000",
      email: "user@gmail.com",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),

        child: AppBar(
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(AppImagesConstants.logo),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFieldWidget(
                hintText: 'Rechercher dans les contacts',
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              SizedBox(height: 16),
              ButtonCustom(
                backgroundColor: Colors.white,
                textColor: Theme.of(context).colorScheme.primary,
                withBoder: true,
                label: 'Créer un contact',
                onPressed: () {
                  context.push(PageName.createContactPage);
                },
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    return ContactTile(contact: contacts[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const SearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF0E6E6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? subtitle;

  const EmptyState({
    super.key,
    required this.title,
    required this.icon,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),

          if (subtitle != null) ...[
            SizedBox(height: 8),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ],

          SizedBox(height: 30),

          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xFFF0E6E6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 40,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class Contact {
  final String name;
  final String avatar;
  final String profession;
  final String numero;
  final String email;

  Contact({
    required this.name,
    required this.avatar,
    required this.profession,
    required this.numero,
    required this.email,
  });
}

class ContactTile extends StatelessWidget {
  final Contact contact;

  const ContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(PageName.contactDetailsPage, extra: contact),
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 247, 247),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(contact.avatar),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                contact.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
