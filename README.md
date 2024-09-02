My situation - I often use greenbone openvas, the thing is that there is often only 50gb of space on virtual machines. After running a couple of tests, the log containers start to overflow so much that they completely occupy the machine, disabling the entire scanner. 
For this purpose I wrote this script above because it is terrible to delete manually logs from 10 containers called 823498xxxxxxxxxxxxx. 
You may realise that you have encountered the same problem when logging into the admin panel of the scanner - "The Greenbone Vulnerability Manager service not responding .... Please try again later ..." 
To make sure that this is exactly what I am writing about here. 
Check the space on your machine using df -h

![grnberror](rmdockefrlogs/unknown.png)

# Description (EN)
This script is designed for system administrators and developers working with Docker. It helps to manage container logs by clearing them and limiting their size. This is useful for saving disc space and preventing problems related to log overflow.

## Who is this script useful for?
- **System Administrators**: For managing disc space on servers with a large number of Docker containers.
- **Developers**: To optimise logging and prevent log overflow in development environments.
- **DevOps Engineers**: To automate log management in CI/CD pipelines.

## Situations for use
- Container logs are starting to take up too much space, causing a disc overflow.
- Log management automation is required to clean up the logs regularly and limit their size.
- Need to restart Docker quickly after logs are cleaned up to apply changes.

Translated with DeepL.com (free version)

# Docker Log Management Script (RU)

## Описание
Этот скрипт предназначен для системных администраторов и разработчиков, работающих с Docker. Он помогает управлять логами контейнеров, очищая их и ограничивая их размер. Это полезно для экономии дискового пространства и предотвращения проблем, связанных с переполнением логов.

## Для кого полезен этот скрипт?
- **Системные администраторы**: Для управления пространством на диске на серверах с большим количеством Docker-контейнеров.
- **Разработчики**: Для оптимизации логирования и предотвращения переполнения логов в среде разработки.
- **DevOps инженеры**: Для автоматизации управления логами в CI/CD конвейерах.

## Ситуации для использования
- Логи контейнеров начинают занимать слишком много места, что приводит к переполнению диска.
- Требуется автоматизация управления логами для регулярной очистки и ограничения их размера.
- Необходимо быстро перезапустить Docker после очистки логов для применения изменений.

## Установка и использование
```bash
git clone https://github.com/cromeroner44/rmdockefrlogs.git
chmod +x cleardock.sh
./cleardock.sh
```
# Очистка логов, ограничение их размера и перезапуск Docker:
```bash
./cleardock.sh -r 


