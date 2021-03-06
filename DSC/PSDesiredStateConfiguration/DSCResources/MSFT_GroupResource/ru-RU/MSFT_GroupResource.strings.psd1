# Localized	02/13/2016 05:18 PM (GMT)	303:4.80.0411 	MSFT_GroupResource.strings.psd1
# Localized resources for MSFT_GroupResource

ConvertFrom-StringData @'
###PSLOC
GroupWithName=Группа: {0}
RemoveOperation=Удалить
AddOperation=Добавить
SetOperation=Установить
GroupCreated=Группа {0} успешно создана.
GroupUpdated=Свойства группы {0} обновлены успешно.
GroupRemoved=Группа {0} удалена успешно.
NoConfigurationRequired=Группа {0} существует на этом узле с требуемыми свойствами. Действия не требуются.
NoConfigurationRequiredGroupDoesNotExist=Группа {0} не существует на этом узле. Действия не требуются.
CouldNotFindPrincipal=Не удалось найти субъект с указанным именем [{0}]
MembersAndIncludeExcludeConflict=Параметры {0}, {1} и {2} конфликтуют. Параметр {0} не следует использовать в сочетании с параметром {1} или {2}.
MembersIsNull=Значение параметра Members равно NULL. Необходимо указать параметр {0}, если {1} и {2} не заданы.
MembersIsEmpty=Параметр Members является пустым.  Необходимо предоставить не менее одного члена группы.
MemberNotValid=Член группы не существует или его не удалось сопоставить: {0}.
IncludeAndExcludeConflict=Субъект {0} входит в значения параметров {1} и {2}. Один и тот же субъект не следует одновременно включать в значения параметров {1} и {2}.
IncludeAndExcludeAreEmpty=Параметры MembersToInclude и MembersToExclude имеют значение null или являются пустыми.  В одном из этих параметров необходимо указать не менее одного члена"
InvalidGroupName=Имя {0} невозможно использовать. Имена не могут целиком состоять из точек и пробелов, а также содержать следующие символы: {1}
GroupExists=Группа с именем {0} существует.
GroupDoesNotExist=Группа с именем {0} не существует.
PropertyMismatch=Для свойства {0} ожидается значение {1}, но оно равно {2}.
MembersNumberMismatch=Свойство {0}. Число указанных уникальных участников группы {1} отличается от числа фактических участников группы {2}.
MembersMemberMismatch=По крайней мере один из участников, заданных параметром {1} ({0}), не входит в существующую группу {2}.
MemberToExcludeMatch=По крайней мере один из участников, заданных параметром {1} ({0}), входит в существующую группу {2}.
ResolvingLocalAccount=Сопоставление {0} как локальной учетной записи.
ResolvingDomainAccount=Сопоставление {0} в домене {1}.
DomainCredentialsRequired=Для сопоставления учетной записи домена {0} требуются учетные данные.
###PSLOC

'@
