#!/bin/bash
vboxmanage createvm --name CLI --ostype RedHat_64 --register
echo "Виртульная машина CLI создана..."
vboxmanage modifyvm CLI --cpus 4 --memory 4096 --vram 12
echo "Добавлено 4 ядра, 4 ГБ ram 12 vram..."
VBoxManage modifyvm CLI --nic1 intnet
echo "Подключена сетевая карта к внутренней сети..."
vboxmanage modifyvm CLI --intnet1 "CLI-ISP"
echo "Имя сети создано..."
vboxmanage createhd --filename /home/PPK.EDU/ol21/VM_discs/CLI1.vdi --size 20480 --variant Standard
echo "Диск создан..."
VBoxmanage storagectl CLI --name "SATA Controller" --add sata --bootable on
echo "Контроллер хранилища добавлен к виртуальной машине..."
vboxmanage storageattach CLI --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium /home/PPK.EDU/ol21/VM_discs/CLI1.vdi
echo "Жесткий диск подключен к хранилищу..."
vboxmanage storagectl CLI --name "IDE Controller" --add ide
echo "Добавлен контроллер IDE к машине..."
vboxmanage storageattach CLI --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium /home/PPK.EDU/ol21/'Рабочий стол'/alt_work.iso
echo "ISO образ добавлен..."
vboxmanage modifyvm CLI --vrde on
echo "протокол удаленного дисплея включен..."
vboxmanage startvm CLI
echo "Запуск машины..."






