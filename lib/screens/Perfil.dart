// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      //colocaremos un aray de widget
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            //crearemos un estack donde estara nuestra imagen de fondo .
            Stack(
              children: [
                Transform.translate(
                  //podemos modificar la imagen  en eje x,y
                  offset: const Offset(0.0, 22.0),
                  child: const FadeInImage(
                    //colocomos un fitbox fit para que cubra el espacio deseado.
                    fit: BoxFit.contain,
                    placeholder: NetworkImage(
                        'https://2.bp.blogspot.com/-obCm9f4gJHo/T0begYP85RI/AAAAAAAAxQ0/vHT81ewdgRo/s1600/paisajes-portada-facebook---www.bancodeimagenesgratuitas.com---11.jpg'),
                    image: NetworkImage(
                        'https://2.bp.blogspot.com/-obCm9f4gJHo/T0begYP85RI/AAAAAAAAxQ0/vHT81ewdgRo/s1600/paisajes-portada-facebook---www.bancodeimagenesgratuitas.com---11.jpg'),
                  ),
                ),
                Column(
                  children: [
                    //colocaremos la flecha de regreso
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      margin: const EdgeInsets.only(top: 50.0, left: 10.0),
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left,
                            color: Colors.red, size: 40.0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    _accountInfo(),
                    _followTabs(),
                    _icons_Tab(),
                  ],
                )
              ],
            )
          ]),
        ),
        SliverPadding(
          //llamos a  la  estructora de fotos.
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          sliver: SliverGrid.count(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: [
              _photos(),
              _photos(),
              _photos(),
              _photos(),
              _photos(),
              _photos(),
              _photos(),
              _photos(),
              _photos(),
              _photos(),
              _photos(),
              _photos(),
            ],
          ),
        ),
        SliverPadding(
          //llamos a  la  estructora de fotos.
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          sliver: SliverGrid.count(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: [
              _Galeria(),
              _Galeria(),
              _Galeria(),
              _Galeria(),
              _Galeria(),
              _Galeria(),
              _Galeria(),
              _Galeria(),
            ],
          ),
        )
      ],
    ));
  }
} //clases

//creamos un widget de perfil
Widget _accountInfo() {
  return Center(
    child: Column(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://scontent.flim24-1.fna.fbcdn.net/v/t1.6435-9/41980161_2055696874483072_8880176146717605888_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeE39UBV41QrSW7QZWMCeqWlhtpbHus_ifSG2lse6z-J9PchsYXtewGHrtLRNO4hRuU2UR2K45XmWGGN61wBUnru&_nc_ohc=b9Uaa6fVihYAX_c9MlD&_nc_ht=scontent.flim24-1.fna&oh=00_AT9zYMobIWSdrUccOBVgN6TziA1DEhlThhhXLB64Ph9GiA&oe=62B0375F'),
          radius: 70.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: const Text('Joao Riofrio Flores',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          child: const Text('Joaoflores1611@gmail.com',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0)),
        )
      ],
    ),
  );
}

//creamos un widget de datos
Widget _followTabs() {
  return Container(
    color: const Color.fromRGBO(0, 0, 0, 0.4),
    //se modifica la ubicacion del contenedor margin
    margin: const EdgeInsets.only(top: 1.0),
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: const [
            Icon(
              Icons.run_circle_sharp,
              color: Colors.white,
              size: 18.0,
            ),
            Text(
              'KM Recorridos ',
              style: TextStyle(
                color: Color.fromARGB(255, 253, 254, 254),
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('23 KM',
                style: TextStyle(
                  color: Color.fromARGB(255, 253, 254, 254),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
        Column(
          children: const [
            Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 18.0,
            ),
            Text(
              'Instagram ',
              style: TextStyle(
                color: Color.fromARGB(255, 253, 254, 254),
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('@joao_4250',
                style: TextStyle(
                  color: Color.fromARGB(255, 253, 254, 254),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
        Column(
          children: const [
            Icon(
              Icons.fmd_good_rounded,
              color: Colors.white,
              size: 18.0,
            ),
            Text(
              'Ubicacion ',
              style: TextStyle(
                color: Color.fromARGB(255, 253, 254, 254),
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Villa Salvado-Lima,PERÚ',
                style: TextStyle(
                  color: Color.fromARGB(255, 253, 254, 254),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                )),
          ],
        )
      ],
    ),
  );
}

//creamos un widget de iconos.
// ignore: non_constant_identifier_names
Widget _icons_Tab() {
  return Container(
    color: const Color.fromARGB(102, 241, 237, 237),
    //se modifica la ubicacion del contenedor margin
    //margin: EdgeInsets.only(top: 1.0),
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.picture_in_picture, size: 30.0),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.insert_photo, size: 30.0),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.play_circle_filled, size: 30.0),
          onPressed: () {},
        )
      ],
    ),
  );
}

Widget _photos() {
  return Container(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: const Image(
          width: 110,
          height: 110,
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxZV_i9nlzqWmN4B_HZp3i7QbDvuozI040HdwtmE5IeJjvxj6wlm920oTS-G2MdmKHWkA&usqp=CAU'),
        )),
  );
}

// ignore: non_constant_identifier_names
Widget _Galeria() {
  return Container(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: const Image(
          width: 110,
          height: 110,
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8MSdEjggOKwDD0dJx9FPI9W1A5fmg0kW3IA&usqp=CAU'),
        )),
  );
}
