part of 'episode_bloc.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object> get props => [];
}

class FetchEpisodeData extends EpisodeEvent {
  final String id;
  FetchEpisodeData(this.id);
}
