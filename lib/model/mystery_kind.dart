enum MysteryKind { bird, animal, human, last }

extension MysteryKindExtension on MysteryKind {
  static MysteryKind? of(String kind) {
    switch (kind) {
      case 'bird':
        return MysteryKind.bird;
      case 'animal':
        return MysteryKind.animal;
      case 'human':
        return MysteryKind.human;
      case 'final':
        return MysteryKind.last;
      default:
        return null;
    }
  }
}
