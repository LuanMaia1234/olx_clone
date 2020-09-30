import 'package:mobx/mobx.dart';
import 'package:olxclone/repositories/announcement_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;
enum HomeState { initial, loading, loaded }

abstract class _HomeStore with Store {
  @observable
  ObservableFuture homeFuture;

  @observable
  String currentState;

  @observable
  String currentCategory;

  @computed
  HomeState get state {
    if (homeFuture == null && homeFuture.status == FutureStatus.rejected) {
      return HomeState.initial;
    } else if (homeFuture.status == FutureStatus.pending) {
      return HomeState.loading;
    } else {
      return HomeState.loaded;
    }
  }

  @action
  Future<void> getAnnouncements({Map<String,dynamic> filter}) {
    AnnouncementRepository announcementRepository = AnnouncementRepository();
    return homeFuture =
        ObservableFuture(announcementRepository.getAllApproved(filter: filter));
  }

  @action
  void setCurrentState(String value)=>currentState = value;

  void setCurrentCategory(String value)=> currentCategory= value;
}
