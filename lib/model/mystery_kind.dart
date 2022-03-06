enum MysteryKind { bird, animal, human }

extension MysteryKindExtension on MysteryKind {
  static MysteryKind? of(String kind) {
    switch (kind) {
      case 'bird':
        return MysteryKind.bird;
      case 'animal':
        return MysteryKind.animal;
      case 'human':
        return MysteryKind.human;
      default:
        return null;
    }
  }
}
