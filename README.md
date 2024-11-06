### Первый запуск
```shell
make config && make run
```
```shell
make con
```
#### Внутри конетейнера с php
```shell
php artisan key:generate && php artisan migrate
```
### Последующий запуск
```shell
make run
```
### Подключение к контейнеру с php
```shell
make con
```