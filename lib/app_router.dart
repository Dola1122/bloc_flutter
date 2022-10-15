import 'package:bloc_app/business_logic_layer/cubit/characters_cubit.dart';
import 'package:bloc_app/data_layer/repository/characters_repository.dart';
import 'package:bloc_app/data_layer/web_services/characters_web_services.dart';
import 'package:bloc_app/presentation_layer/screens/character_details_screen.dart';
import 'package:bloc_app/presentation_layer/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data_layer/models/character_model.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (BuildContext context) => charactersCubit,
              child: CharactersScreen(),
            ));
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character : character));
    }
  }
}
