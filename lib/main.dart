import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retro_films/ui/movie_list_screen.dart';
import 'package:retro_films/bloc/movie_cubit.dart';
import 'package:retro_films/models/movie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final sampleMovies = [
    Movie(
      id: '1',
      title: 'Иван Васильевич меняет профессию',
      genre: 'Комедия',
      description: 'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком — точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBfFJHVOKeHFh72QpjDQSO-MLx4FsN8mFFFA&s',
      videoUrl: 'https://youtu.be/TQ8onQu5QKY?si=_FJVQrLAt76zx65F',
      comments: [],
    ),
    Movie(
      id: '2',
      title: 'Кавказская пленница',
      genre: 'Комедия',
      description: 'Отправившись в одну из горных республик собирать фольклор, студент Шурик влюбляется в симпатичную Нину — спортсменку, отличницу, комсомолку и просто красавицу. Однако банда из трёх человек похищает девушку, чтобы насильно выдать замуж. Поняв, что происходит, Шурик отважно бросается освобождать кавказскую пленницу.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrpKoqUxzVWFcupfcw7PSJqb2gUS-B7Soe7g&s',
      videoUrl: 'https://youtu.be/0f1LxDfNpv0?si=mqzrTrsKE-mb1vW2',
      comments: [],
    ),
    Movie(
      id: '3',
      title: 'Бриллиантовая рука',
      genre: 'Комедия',
      description: 'Кинороман из жизни контрабандистов с прологом и эпилогом. В южном городке орудует шайка «валютчиков», возглавляемая Шефом и его помощником Графом. Скромный советский служащий и примерный семьянин Семен Семеныч Горбунков отправляется в зарубежный круиз на теплоходе, на котором также плывет Граф, который должен забрать бриллианты в одном из восточных городов и провезти их в загипсованной руке. Но в силу недоразумения вместо жулика на условленном месте падает ничего не подозревающий Семен Семенович и драгоценный гипс накладывают ему. Вот тут-то все и начинается…',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/ru/1/17/%D0%91%D1%80%D0%B8%D0%BB%D0%BB%D0%B8%D0%B0%D0%BD%D1%82%D0%BE%D0%B2%D0%B0%D1%8F_%D1%80%D1%83%D0%BA%D0%B0_Poster.jpg',
      videoUrl: 'https://youtu.be/M9cGHdVbNXI?si=zOORptlx5W-nF8JD',
      comments: [],
    ),
    Movie(
      id: '4',
      title: 'Летят журавли',
      genre: 'Комедия',
      description: 'Рассказ о людях, в чьи судьбы безжалостно вторглась война. Не все смогли с честью вынести это испытание. В центре киноповести - трагическая история двух влюбленных, которых разлучила война.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/ru/d/df/Letat-Juravli.jpg',
      videoUrl: 'https://youtu.be/2rINnJat-5k?si=mmLj1O2M0dyutLmm',
      comments: [],
    ),
    Movie(
      id: '5',
      title: 'Американская дочь',
      genre: 'Комедия',
      description: 'Герой фильма - музыкант одного из московских ресторанов - прилетает в Сан-Франциско, чтобы... похитить свою дочь. Маленькую Анюту тайно увезла с собой его бывшая жена, выйдя замуж за респектабельного американца.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/ru/1/17/Amerikanskaya_doch.jpeg',
      videoUrl: 'https://youtu.be/Kra8cS0LIiE?si=tnr3QdUOCwSc1p1_',
      comments: [],
    ),
    Movie(
      id: '6',
      title: 'Ирония судьбы',
      genre: 'Комедия',
      description: '31 декабря пошли друзья в баню попариться, по традиции смыть с себя все плохое, чтобы встретить Новый год чистыми, а «напарились» до такой степени (пивом и водкой), что отправили в Ленинград не того.',
      imageUrl: 'https://avatars.mds.yandex.net/get-kinopoisk-image/1777765/e57b129b-68e9-471f-8416-dd835c06339b/3840x',
      videoUrl: 'https://youtu.be/L5GnqepBJkE?si=vOJTNUEq7NGiElmK',
      comments: [],
    ),
  ];

  runApp(MyApp(sampleMovies: sampleMovies));
}

class MyApp extends StatelessWidget {
  final List<Movie> sampleMovies;

  MyApp({required this.sampleMovies});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCubit>(
      create: (context) => MovieCubit()..loadMovies(sampleMovies),
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MovieListScreen(),
      ),
    );
  }
}
