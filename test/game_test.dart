import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_zar_macerasi/oyun_zar_macerasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(zarMacerasiConfig.title.length, 33);
    expect(zarMacerasiConfig.tagline.length, 33);
    for (final s in zarMacerasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(zarMacerasiConfig.gameId, zarMacerasiId);
    expect(zarMacerasiRules.gameId, zarMacerasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(zarMacerasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: zarMacerasiId, optionalMechanics: zarMacerasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(zarMacerasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
