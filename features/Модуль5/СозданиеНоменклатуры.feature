﻿#language: ru

@tree

Функционал: создание номенклатуры

Как Тестировщик я хочу
создать элементы справочника номенклатуры 
чтобы использовать при тестировании  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание номенклатуры
	И Я запоминаю значение выражения '1' в переменную "Номер"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Номер$ +1' в переменную "Номер"
		И Я запоминаю значение выражения '"Тестовая номенклатура"+$Номер$ ' в переменную "НаименованиеНоменклатуры"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en'             | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '58792'  | ''            | '$НаименованиеНоменклатуры$' | ''                 | ''               | ''               |          |          |          |          |         |


