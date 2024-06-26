import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    // * 6. Consumir información
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvier);
    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final someWords = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upcomingMoviesProvider);

    if (someWords.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        toolbarHeight: 65,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppBar(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideShow(movies: someWords),
              MovieHorizontalListview(
                  movie: nowPlayingMovies,
                  title: 'En cines',
                  subtitle: 'Hoy',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage()),
              MovieHorizontalListview(
                  movie: popularMovies,
                  title: 'Populares',
                  subtitle: 'Tendencia',
                  loadNextPage: () =>
                      ref.read(popularMoviesProvider.notifier).loadNextPage()),
              MovieHorizontalListview(
                  movie: topRatedMovies,
                  title: 'Top',
                  subtitle: 'De todos los tiempos',
                  loadNextPage: () =>
                      ref.read(topRatedMoviesProvider.notifier).loadNextPage()),
              MovieHorizontalListview(
                  movie: upComingMovies,
                  title: 'Próximamente',
                  subtitle: 'Esperando..',
                  loadNextPage: () =>
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage()),
              const SizedBox(height: 20)
            ],
          );
        }, childCount: 1),
      ),
    ]);
  }
}
