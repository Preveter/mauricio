![main](https://github.com/Ecialo/mauricio/workflows/main/badge.svg)

# Mauricio
Наглый котик в телеграме. Реинкарнация старого [кота](https://github.com/Ecialo/kotbot), которого стало слишком больно поддерживать.

## Состояния и события
Кот реагирует на события в зависимости от состояния. Сейчас состояний 4:
* Бодрствует -- Awake. Кот шарится по квартире и занимается своими обычными кошачими делами.
* Спит -- Sleep. Котик спит. Не будите его.
* Гуляет -- Away. Котофея нет дома. Никто не знает, чем он занимается.
* Хочет ласки -- Want care.

Событий больше:
* Поглажен -- pet
* Обнят -- hug
* Устал -- tire
* Заскучал -- pine
* Меняется -- metabolic
* Проголодался -- hungry

Ещё есть триггеры на текст, которые тут пока что не описаны.

Состояние/событие | pet | hug | tire | pine | hungry | metabolic
----------------- | --- |---- | ---- | ---- | ------ | ---------
Awake | Растит счётчик поглаживания. Если кота много гладить он может цапнуть. | Даёт представление о том, как кот к вам относится и сколько весит | Снижает энергию на 1. Если она уже 0, то кот засыпает | Если кот мало глажен (меньше 4 раз), то он начинает докапываться до чата (Want care), если много -- убегает | Съедает первое что лежит в кормушке. Если кормушка пустая, то сытость уменьшается на 1 | Толстеет или худеет, в зависимости от насыщения
Sleep | Ничего не делает | Будит кота, а затем как в Awake | Восстанавливает 0.35 от максимума энергии + 1. И храпит! | Игнорируется | Игнорируется | Как в Awake
Away | Игнорируется | Игнорируется | Игнорируется | Кот возвращается домой | Игнорируется | Как в Awake, но без сообщений
Want care | Ура! | Успокаивается, а затем как в Awake | Как в Awake | Кот трижды напоминает о себе, а затем обижается на всех | как в Awake | как в Awake 

## Расписание
В schedule указано раз в сколько происходит то или иное событие связанное с котом. Это число умножается на ленивость кота и к нему добавляется +- 0.5 ленивости кота. Итоговое значение это раз в сколько будет срабатывать это события.
