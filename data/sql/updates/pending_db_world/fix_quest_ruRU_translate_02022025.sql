-- Add Russian locale for QuestID: 4641
DELETE FROM quest_offer_reward_locale WHERE ID = 4641 AND locale = 'ruRU';
INSERT INTO quest_offer_reward_locale(ID,locale,RewardText,VerifiedBuild) VALUES (4641,'ruRU','Очередной рекрут Калтунка?$B$BВидно, плохи наши дела, если у нас нет никого получше. Ну, ничего. К тому времени, как мы решим, что тебе пора покинуть долину, из тебя $c получится бравый воитель Орды!',0);

-- Add Russian locale for QuestID: 788
DELETE FROM quest_offer_reward_locale WHERE ID = 788 AND locale = 'ruRU';
INSERT INTO quest_offer_reward_locale(ID,locale,RewardText,VerifiedBuild) VALUES (788,'ruRU','Ну что ж, $N, неплохо. Но не задирай носа: грядут бои с куда более серьезными врагами.$b$bОднако ты показал себя достойным бойцом. В следующем испытании тебе придется встретиться с более опасным противником, так что дополнительная защита не помешает.',0);

-- Fix Russian locale for QuestID: 783
DELETE FROM quest_template_locale WHERE ID = 783 AND locale = 'ruRU';
INSERT INTO quest_template_locale(ID, locale, Title, Details, Objectives, VerifiedBuild) VALUES (783, 'ruRU', 'Внутренняя угроза', 'Надеюсь, ты $gготов:готова; к подвигам, |3-6($c), поскольку для тебя есть дело здесь, в Североземье.$B$BИ я имею в виду не мирные сельские заботы.$B$BСтража Штормграда с трудом поддерживает здесь мир: слишком многие из нас находятся в дальних краях, а тревожных вестей меньше не становится. И потому мы надеемся на помощь всех, кто готов защитить свой дом и своих близких.$B$BЕсли ты $gготов:готова; откликнуться на призыв, то поговори с моим командиром, маршалом Макбрайдом. Он здесь, в аббатстве у меня за спиной.', 'Поговорите с маршалом Макбрайдом.', 0);

-- Fix Russian locale for QuestID: 792
DELETE FROM quest_template_locale WHERE ID = 792 AND locale = 'ruRU';
INSERT INTO quest_template_locale(ID, locale, Title, Details, Objectives, VerifiedBuild) VALUES (792, 'ruRU', 'Злобные фамильяры', 'Что ж, |3-6($c), надеюсь, у нас ты многому научишься.$b$bМеня послали сюда, чтобы я стала твоей наставницей, но оказывается, здесь не все ладно!$b$bВ долине Испытаний обосновался клан Пылающего Клинка. Эти твари скрываются в пещере на северо-востоке, и их злобные фамильяры выбираются оттуда и сеют хаос.$b$bИтак, вот твое первое задание в борьбе с Пылающим Клинком: перебей их столько, сколько сумеешь, и, если выживешь, возвращайся ко мне.', 'Убейте 8 злобных фамильяров и вернитесь к Зурите Востроглазой, которая ждет вас у Логова.', 0);
