import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafio/widgets/NavBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  bool showNumber = false;
  bool gridFavoritos = false;

  String numeroCartao = '';
  String limiteDisponivel = '';
  String melhorDia = '';

  bool novoCartao = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 89,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5).withOpacity(0.4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                elevation: 4,
                unselectedItemColor: const Color(0xFFB4B4B8),
                selectedLabelStyle: const TextStyle(fontSize: 9),
                unselectedLabelStyle: const TextStyle(fontSize: 9),
                selectedItemColor: const Color(0xFF2890CF),
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
                  BottomNavigationBarItem(icon: Icon(CupertinoIcons.doc_text), label: "Fatura"),
                  BottomNavigationBarItem(icon: Icon(CupertinoIcons.creditcard), label: "Settings"),
                  BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: "Shop"),
                ],
                currentIndex: _selectedIndex,
                onTap: (index){
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled)=> [
            SliverAppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: const Color(0xFF3C6AB2),
              elevation: 0,
              title: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Olá, ", style: TextStyle(color: Colors.white),),
                    Text("Cliente", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.chat_bubble)),
                IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
              ],
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Divider(
                    height: 2.0,
                  ),
                ),
              ),
            ),
          ],
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF3C6AB2), Color(0xFFFFFFFF)],
                    stops: [0.1, 0.6]
                )
            ),
            child: ListView(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                  ),
                  items: [
                    Center(
                      child: Container(
                        width: 300,
                        height: 140,
                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFF2B66BC), Color(0xFF132D55)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: const Color(0xFFD9D9D9),
                                  height: 56,
                                  width: 88,
                                ),
                                const SizedBox(width: 16,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 9,),
                                    Text(showNumber ? "1989 5621" : "•••• 5621", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                    const Text("GS3 TEC", style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                const Spacer(),
                                IconButton(onPressed: (){
                                  setState(() {
                                    showNumber = !showNumber;
                                  });
                                },
                                    icon: const Icon(CupertinoIcons.eye, color: Color(0xFF089EE3), size: 18,))
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Divider(
                                height: 1,
                                color: Color(0xFF3660A1),
                              ),
                            ),
                            const Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Limite disponível", style: TextStyle(fontSize: 8, color: Colors.white),),
                                    Text("R\$ 7.867,80", style: TextStyle(fontSize: 16, color: Colors.white),)
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Melhor dia de compra", style: TextStyle(fontSize: 8, color: Colors.white),),
                                    Text("20", style: TextStyle(fontSize: 16, color: Colors.white),)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 140,
                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFF005153), Color(0xFF005555)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: const Color(0xFFD9D9D9),
                                  height: 56,
                                  width: 88,
                                ),
                                const SizedBox(width: 16,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 9,),
                                    Text(showNumber ? "0009 1504" : "•••• 1504", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                    const Text("GS3 TEC", style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                const Spacer(),
                                IconButton(onPressed: (){
                                  setState(() {
                                    showNumber = !showNumber;
                                  });
                                },
                                    icon: const Icon(CupertinoIcons.eye, color: Color(0xFF089EE3), size: 18,))
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Divider(
                                height: 1,
                                color: Color(0xFF3660A1),
                              ),
                            ),
                            const Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Limite disponível", style: TextStyle(fontSize: 8, color: Colors.white),),
                                    Text("R\$ 7.867,80", style: TextStyle(fontSize: 16, color: Colors.white),)
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Melhor dia de compra", style: TextStyle(fontSize: 8, color: Colors.white),),
                                    Text("20", style: TextStyle(fontSize: 16, color: Colors.white),)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: novoCartao,
                      child: Center(
                        child: Container(
                          width: 300,
                          height: 140,
                          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFFe36dc4), Color(0xFFdc84de)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: const Color(0xFFD9D9D9),
                                    height: 56,
                                    width: 88,
                                  ),
                                  const SizedBox(width: 16,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 9,),
                                      Text(showNumber ? (numeroCartao.length > 4 ? "${numeroCartao.substring(0, 4)} ${numeroCartao.substring(4)}" : numeroCartao) : (numeroCartao.length > 4 ? "•••• ${numeroCartao.substring(4)}" : numeroCartao), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                      const Text("GS3 TEC", style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(onPressed: (){
                                    setState(() {
                                      showNumber = !showNumber;
                                    });
                                  },
                                      icon: const Icon(CupertinoIcons.eye, color: Color(0xFF089EE3), size: 18,))
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Divider(
                                  height: 1,
                                  color: Color(0xFF3660A1),
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Limite disponível", style: TextStyle(fontSize: 8, color: Colors.white),),
                                      Text("R\$ ${_formatCurrency(limiteDisponivel)}", style: const TextStyle(fontSize: 16, color: Colors.white),)
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text("Melhor dia de compra", style: TextStyle(fontSize: 8, color: Colors.white),),
                                      Text(melhorDia, style: const TextStyle(fontSize: 16, color: Colors.white),)
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Divider(
                    height: 2.0,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("Meus Favoritos", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        const Spacer(),
                        const Text("Personalizar", style: TextStyle(fontSize: 8),),
                        IconButton(onPressed: (){
                          setState(() {
                            gridFavoritos = !gridFavoritos;
                          });
                        }, icon: const Icon(CupertinoIcons.square_grid_2x2, size: 20, color: Color(0xFF2890CF),)),
                        const SizedBox(width: 10,)
                      ],
                    ),
                    Visibility(
                      visible: !gridFavoritos,
                      child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 4,
                              enableInfiniteScroll: false,
                              viewportFraction: 0.3
                          ),
                          items: [
                            Column(
                              children: [
                                Container(
                                  width: 66,
                                  height: 66,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.creditcard,
                                    color: Color(0xFF346CBD),
                                  ),
                                ),
                                const Text("Cartão Virtual", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                            InkWell(
                              child: Column(
                                children: [
                                  Container(
                                    width: 66,
                                    height: 66,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.creditcard_fill,
                                      color: Color(0xFF346CBD),
                                    ),
                                  ),
                                  const Text("Cartão adicional", style: TextStyle(fontSize: 10),)
                                ],
                              ),
                              onTap: () {
                                const snackBar = SnackBar(
                                  content: Text('Limite de cartão adicional atingido!'),
                                );
                                novoCartao ? ScaffoldMessenger.of(context).showSnackBar(snackBar) : _showDialog(context);
                              },
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 66,
                                  height: 66,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.shield_lefthalf_fill,
                                    color: Color(0xFF346CBD),
                                  ),
                                ),
                                const Text("Seguros", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 66,
                                  height: 66,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.envelope,
                                    color: Color(0xFF346CBD),
                                  ),
                                ),
                                const Text("Pacote SMS", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                          ]
                      ),
                    ),
                    Visibility(
                      visible: gridFavoritos,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2,
                            enableInfiniteScroll: false,
                            viewportFraction: 0.6
                        ),
                        items: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 66,
                                          height: 66,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.creditcard,
                                            color: Color(0xFF346CBD),
                                          ),
                                        ),
                                        const Text("Cartão Virtual", style: TextStyle(fontSize: 10),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 66,
                                            height: 66,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            child: const Icon(
                                              CupertinoIcons.creditcard_fill,
                                              color: Color(0xFF346CBD),
                                            ),
                                          ),
                                          const Text("Cartão adicional", style: TextStyle(fontSize: 10),)
                                        ],
                                      ),
                                      onTap: () {
                                        const snackBar = SnackBar(
                                          content: Text('Limite de cartão adicional atingido!'),
                                        );
                                        novoCartao ? ScaffoldMessenger.of(context).showSnackBar(snackBar) : _showDialog(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 66,
                                          height: 66,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.shield_lefthalf_fill,
                                            color: Color(0xFF346CBD),
                                          ),
                                        ),
                                        const Text("Seguros", style: TextStyle(fontSize: 10),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 66,
                                          height: 66,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.envelope,
                                            color: Color(0xFF346CBD),
                                          ),
                                        ),
                                        const Text("Pacote SMS", style: TextStyle(fontSize: 10), softWrap: false,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Divider(
                    height: 2.0,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("Últimos lançamentos", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        const Spacer(),
                        const Text("Ver todos", style: TextStyle(fontSize: 8),),
                        IconButton(onPressed: (){
                          setState(() {
                            //gridFavoritos = !gridFavoritos;
                          });
                        }, icon: const Icon(CupertinoIcons.right_chevron, size: 20, color: Color(0xFF2890CF),)),
                        const SizedBox(width: 10,)
                      ],
                    ),
                    Column(

                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 30,),
                            Text("Hoje, 05 Set", style: TextStyle(fontSize: 12, color: Color(0xFF2890CF), fontWeight: FontWeight.bold ),),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            const SizedBox(width: 30,),
                            Container(
                              width: 66,
                              height: 66,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                CupertinoIcons.device_phone_portrait,
                                color: Color(0xFF346CBD),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Apple", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("05/09 às 22:35", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                            const Spacer(),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("R\$545,99", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("em 12x", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                            const SizedBox(width: 30,)
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 13, bottom: 13),
                          child: Divider(
                            height: 2.0,
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 30,),
                            Container(
                              width: 66,
                              height: 66,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Icon(
                                      CupertinoIcons.exclamationmark_circle_fill,
                                      color: Color(0xFFFFAC31),
                                      size: 13,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.car_detailed,
                                    color: Color(0xFF346CBD),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Uber*Uber*Trip", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("05/09 às 15:25", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                            const Spacer(),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("R\$12,96", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                            const SizedBox(width: 30,)
                          ],
                        ),
                      ],
                    ),
                    Column(

                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 30,),
                            Text("03 Set", style: TextStyle(fontSize: 12, color: Color(0xFF2890CF), fontWeight: FontWeight.bold ),),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            const SizedBox(width: 30,),
                            Container(
                              width: 66,
                              height: 66,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5E5E5).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                CupertinoIcons.shopping_cart,
                                color: Color(0xFF346CBD),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Carrefour", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("03/09 às 09:34", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                            const Spacer(),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("R\$349,76", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("em 3x", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                            const SizedBox(width: 30,)
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  void _showDialog(BuildContext context) {
    numeroCartao = '';
    limiteDisponivel = '';
    melhorDia = '';
    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return StatefulBuilder(
            builder: (context, setState){
              return AlertDialog(
                title: const Text("Adicionar cartão"),
                content: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 140,
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFe36dc4), Color(0xFFdc84de)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: const Color(0xFFD9D9D9),
                                height: 56,
                                width: 88,
                              ),
                              const SizedBox(width: 16,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 9,),
                                  Text(showNumber ? (numeroCartao.length > 4 ? "${numeroCartao.substring(0, 4)} ${numeroCartao.substring(4)}" : numeroCartao) : (numeroCartao.length > 4 ? "•••• ${numeroCartao.substring(4)}" : numeroCartao), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                  const Text("GS3 TEC", style: TextStyle(color: Colors.white))
                                ],
                              ),
                              const Spacer(),
                              IconButton(onPressed: (){
                                setState(() {
                                  showNumber = !showNumber;
                                });
                              },
                                  icon: const Icon(CupertinoIcons.eye, color: Color(0xFF089EE3), size: 18,))
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Divider(
                              height: 1,
                              color: Color(0xFF3660A1),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Limite disponível", style: TextStyle(fontSize: 8, color: Colors.white),),
                                  Text("R\$ ${_formatCurrency(limiteDisponivel)}", style: const TextStyle(fontSize: 16, color: Colors.white),)
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text("Melhor dia de compra", style: TextStyle(fontSize: 8, color: Colors.white),),
                                  Text(melhorDia, style: const TextStyle(fontSize: 16, color: Colors.white),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Número do Cartão',
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 8,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o número do cartão';
                                  }
                                  return null;
                                },
                                onChanged: (text){
                                  setState(() {
                                    numeroCartao = text;
                                  });
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Limite Disponível',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o limite disponível';
                                  }
                                  return null;
                                },
                                onChanged: (text){
                                  setState((){
                                    limiteDisponivel = text;
                                  });
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Melhor Dia de Compra',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o melhor dia de compra';
                                  }
                                  int? dia = int.tryParse(value);
                                  if (dia == null || dia < 1 || dia > 31) {
                                    return 'Por favor, insira um dia válido (1-31)';
                                  }
                                  return null;
                                },
                                onChanged: (text){
                                  setState((){
                                    melhorDia = text;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  // define os botões na base do dialogo
                  MaterialButton(
                    child: const Text("Fechar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    child: const Text("Salvar"),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        novoCartao = true;
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              );
            }
        );
      },
    ).then((_){
      setState(() {
        novoCartao = novoCartao;
      });
    });
  }

  String _formatCurrency(String value) {
    try {
      double parsedValue = double.parse(value.replaceAll(',', '.'));
      return NumberFormat.currency(locale: 'pt_BR', symbol: '').format(parsedValue);
    } catch (e) {
      return '';
    }
  }
}
