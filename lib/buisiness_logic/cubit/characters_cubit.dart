import 'package:bloc/bloc.dart';
import 'package:breaking_bad/buisiness_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/data/models/char_quotes.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/repository/cahracters_repository.dart';
import 'package:meta/meta.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  final CharactersRepository charactersRepository;

  List<Character> characters = [];


  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character>? getAllCharacters()
  {
    charactersRepository.getAllCharacters().then((characters){
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
  
  void getQuotes(String charName)
  {
    charactersRepository.getCharacterQuotes(charName).then((quotes)
    {
      emit(QuotesLoaded(quotes));
    });
  }
}
