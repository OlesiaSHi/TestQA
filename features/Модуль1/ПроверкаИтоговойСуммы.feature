﻿#language: ru

@tree

Функционал: создание документа Заказ 

Как Менеджер по закупкам я хочу
создать документ Заказ 
чтобы произвести закупку у поставщика   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа заказ
* Открытие формы документа
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
* Заполнение шапки
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
	И я нажимаю кнопку выбора у поля с именем 'Покупатель'
	Тогда открылось окно "Контрагенты"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование"              |
		| "000000010" | "Корнет ЗАО" |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Средний"
* Заполнение ТЧ Товары
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование"  |
		| "000000012" | "Электротовары" |
	И в таблице 'Список' я перехожу на один уровень вниз
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000013" | "Чайники"      |
	И в таблице 'Список' я перехожу на один уровень вниз
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "5"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "8 000,00"
	И в таблице 'Товары' я завершаю редактирование строки
* Проверка итоговой суммы
	И я запоминаю значение поля с именем 'ТоварыЦена' таблицы "Товары" как "$Цена$"
	И я запоминаю значение поля с именем 'ТоварыКоличество' таблицы "Товары" как "$Количество$"
	И Я запоминаю значение выражения '$Цена$*$Количество$' в переменную "$Сумма$"
* Проверка суммы итого
	И реквизиты формы имеют значение:
    	| 'Имя'              | 'Значение'   | 'КакИскать' |
    	| 'ТоварыИтогСумма'  | "$Сумма$" 	| 'ПоИмени'   |
* Сохранение и проведение заказа
И я нажимаю на кнопку с именем 'ФормаЗаписать'
И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна "Заказ * от *" в течение 20 секунд


