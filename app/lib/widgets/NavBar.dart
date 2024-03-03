import 'package:desafio/widgets/CustomCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xFF3C6AB2).withOpacity(0.7)
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Text("Olá, Cliente", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
              SizedBox(height: 10,),
              Center(
                child: Text("Agência 0001 Conta 12938-08\nBanco 999 - GS3 TEC", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              CustomCard(
                leftIcon: Icons.help_outline,
                rightIcon: CupertinoIcons.right_chevron,
                text: 'Me ajuda',
              ),
              CustomCard(
                leftIcon: CupertinoIcons.person,
                rightIcon: CupertinoIcons.right_chevron,
                text: 'Perfil',
              ),
              CustomCard(
                leftIcon: CupertinoIcons.money_rubl,
                rightIcon: CupertinoIcons.right_chevron,
                text: 'Minhas chaves Pix',
              ),
              CustomCard(
                leftIcon: CupertinoIcons.creditcard,
                rightIcon: CupertinoIcons.right_chevron,
                text: 'Configurar Cartão',
              ),
              CustomCard(
                leftIcon: CupertinoIcons.mail,
                rightIcon: CupertinoIcons.right_chevron,
                text: 'Configurar Notificações',
              ),
              CustomCard(
                leftIcon: CupertinoIcons.device_phone_portrait,
                rightIcon: CupertinoIcons.right_chevron,
                text: 'Configurações do app',
              ),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
