import 'package:flutter/material.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_ios, color: Color(0xFF00B4D8),)),
            Text(
              "Detalhes de evento",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Color(0xFF00B4D8),))
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://picsum.photos/seed/488/600',
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Nome do Evento",
                    style: TextStyle(
                        color: Color(0xff242424),
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text("Categoria", style: TextStyle(color: Color(0xFF00B4D8)),)
                ],
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_month, color: Color(0xFF00B4D8),),
                      SizedBox(width: 10,),
                      Text("26/12/2024")
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.place_rounded, color: Color(0xFF00B4D8)),
                      SizedBox(width: 10,),
                      Text("Lugar do evento")
                    ],
                  )
                ],
              ),
              const Divider(
                color: Color(0xff8F9098),
                thickness: 0.2,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Descrição',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 5),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus  tincidunt elit non libero vulputate luctus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed at  risus in enim iaculis tincidunt at nec lectus. Morbi sit amet est  convallis, varius quam sit amet, fermentum metus. In tempor iaculis  ipsum nec.. Leia Mais",
                style: TextStyle(
                  color: Color(0xff71727A),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Itens alocados',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
