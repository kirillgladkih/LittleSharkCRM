### Общая информация

Сообщения о фиксации и слияния необходимо делать используя свои имя, фамилию и корпоративную почту.
Всю разработку необходимо вести на отдельной ветке.
После окончания разработки, необходимо в свою ветку влить изменения с дева (или родительской ветки, если ветка создана не от дева), а затем в гит лаб создать запрос на слияние своей ветки с dev-веткой (родительской веткой).
После прохождения запроса на слияния и вливания функционала в родительскую ветку, текущая ветка должна быть удалена.
Рекомендуется делать небольшие и частые commit-ы и push-и в ветку, но не реже 1 раза в неделю.

#### Описание работы по Gitflow

Gitflow — это методика работы с Git. В ней определяется, какие виды веток необходимы проекту и как выполнять слияние между ними.

#### Список и назначение веток

* develop- ветка разработки, предназначена для объединения всех наработок
* feature/*** - функциональные ветки, под каждую новую задачу нужно выделить собственную ветку. Ветки feature создаются на основе develop. Когда работа над функцией завершается, соответствующая ветка сливается с develop.
* release/v.*** - когда в ветке develop оказывается достаточно функций для выпуска (или приближается назначенная дата релиза), от ветки develop создается ветка release.   На ветке release новые функции добавлять нельзя, допускается лишь исправление багов, создание документации и решение других задач, связанных с релизом. Когда подготовка к поставке завершается, на основе ветке release создается тег с номером версии. Кроме того, нужно выполнить ее слияние с веткой develop, в которой с момента создания ветки релиза могли возникнуть изменения.
* bugfix/*** - (этой ветки не существует по gitflow) ветки исправления используются для внесения исправлений в рабочий develop. Ветки bugfix создаются на основе develop. Когда работа над функцией завершается, соответствующая ветка сливается с develop. Возможно, необходимо будет создавать такие ветки и от release.

Ветки без /*** являются долгосрочными, т.е. не удаляются. Остальные ветки удаляются в определенный момент времени (при mr).

В репозитории в списке удаленных веток должны присутствовать только активные ветки (над которыми в данный момент времени ведется разработка).

#### Общая последовательность действий при работе по модели Gitflow

* Из ветки develop создается ветка release.
* Из ветки develop создаются ветки feature.
* Когда работа над веткой feature завершается, она сливается в ветку develop.
* Когда работа над веткой release завершается, она сливается с ветками develop.
* Если в ветке develop обнаруживается проблема, из develop создается ветка bugfix.
* Когда работа над веткой bugfix завершается, она сливается с веткой develop.

### Окружения

dev — окружение для ведения разработки по текущей итерации. Выкатывается автоматом из ветки develop и по кнопке из веток feature/*, bugfix/*.
stage — туда выкатываестя release candidate, после окончания тестирования в dev, чтобы проверить изменение сценариев деплоя, миграций, etc. Выкатывается автоматом из веток bugfix/*, release/*.
prod — окружение на котором работают пользователи. Выкатывается по кнопке из тэгов вида v1.1.1.
У некоторых проектов могут быть дополнительные окружения.

### Сценарий работы по Gitflow 

1. Разработка новой фичи/ функциональности

Код должен писаться на отдельной feature/* ветке
feature/* ветка должна быть создана от develop ветки
По окончании разработки, влить в свою feature/* ветку изменения с develop ветки
Создать запрос на слияние (mr) ТОЛЬКО в develop ветку
После слияния feature/* ветки с develop веткой, dev окружение собирается автоматом

2. Правка ошибки на тестовом окружении (dev)

Код должен писаться на отдельной bugfix/* ветке
bugfix/* ветка должна быть создана от develop ветки
По окончании разработки, влить в свою bugfix/* ветку изменения с develop ветки
Создать запрос на слияние (mr) ТОЛЬКО в develop ветку
После слияния feature/* ветки с develop веткой, dev окружение собирается автоматом

3. Правка ошибки на продуктовом окружении (stage)

Код должен писаться на отдельной bugfix/* ветке
bugfix/* ветка должна быть создана от актуальной release/* ветки
Номер актуальной release/* ветки можно уточнить в чате команды 
По окончании разработки, влить в свою bugfix/* ветку изменения с актуальной release/* ветки
Создать запрос на слияние (mr) ТОЛЬКО в актуальную release/* ветку
После слияния feature/* ветки с актуальной release/* веткой, stage окружение собирается автоматом

4. Дополнительно

Весь новый функционал должен реализовываться ТОЛЬКО на develop ветке и вливаться ТОЛЬКО в develop ветку, и ни в коем случае в release/* ветку
Дочерняя ветка должна сливаться только с родительской веткой, то есть с той, от которой она была создана
Смешивание в feature/* ветке кода от develop ветки и release/* ветки НЕДОПУСТИМО.То есть, если создана feature/* ветка от develop ветки или от ветки которая в свою очередь создана от develop ветки, то в созданную feature/* ветку НЕЛЬЗЯ заливать функционал от ветки, прародителем которой не является develop ветка
НЕ ДОПУСКАЕТСЯ самостоятельный перенос изменений с develop ветки в release/* ветку и наоборот с release/* ветки в develop ветку. Но если такая необходимость возникла, например, была создана bugfix/* ветка не от той ветки или это был критичный баг-фикс, который срочно просят перенести, то в данном случае необходимо в чате "Команда базового  (web)" попросить Ивана Казаковцева, чтобы он перенёс задачу в нужную ветку
Если была реализована задача и/ или поправлен баг на develop ветке, то аналогичная правка на release/* ветке НЕДОПУСТИМА. И наоборот, если были внесены изменения в release/* ветку и необходимо внести такие же изменения в develop ветку, то ручное внесение правок НЕДОПУСТИМО. Необходимо в чате "Команда базового  (web)" попросить Ивана Казаковцева, чтобы он перенёс изменения с одной ветки в нужную ветку

### Правила именования веток (branch)

Пример:

feature/999-add-product

bugfix/100-add-product

где число - это уникальный идентификатор задачи

release/v0.1.0

- тип ветки. Все доступные типы указаны в п. "Список и назначение веток"

- номер таски из трекера. Пишется в формате <ключ>-<номер>

- краткое описание для чего нужна ветка. < 30 символов, разделителем является знак “-”, все с маленькой буквы

- для ветки release указывается версия

Правила написания сообщений о фиксации (commit message)

Пример:

feat: introduce sign in via Facebook

- тип сообщения

- описание

Тип сообщения о фиксации:

feat: новая функциональность
fix: исправление ошибки
docs: работа с документацией (swagger)
style: правка стилей, codeStyle
refactor: изменение кода, которое не меняет функциональность
perf: изменение кода, улучшающее производительность
test: добавление/ исправление тестов
build: изменения в процессе сборки/ компиляции/ упаковки или вспомогательных инструментах
ci: изменения в настройке непрерывной интеграции/ доставки

Описание:

заполняется на английском языке
должен описывать вносимые изменения содержа краткую и понятную информацию
пишется в императиве: «fix bug», а не «fixed bug» или «fixes bug».  Сгенерированные сообщения при выполнении команд git merge и git revert уже соответствуют данному соглашению.
в конце сообщения точка не ставится

Примеры:

feat: add directives disabled/checked/multiple/readonly/selected

docs: update docs from Google Docs