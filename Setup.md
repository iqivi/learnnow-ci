

# LearnNow – Instrukcja uruchomienia środowiska

Ten dokument opisuje jak skonfigurować środowisko lokalne (`dev`) i serwer (`server`), jak wykonać `repo sync` i uruchomić wszystkie usługi przy użyciu skryptów CI.  

---

## 1. Wymagania wstępne

Na maszynie lokalnej lub serwerze musisz mieć:

- Git
- `repo` (narzędzie Google do zarządzania wieloma repozytoriami)
- Docker (wersja z obsługą `docker compose`)
- `curl`, `wget`, `unzip` (opcjonalnie)

# Instalacja zależności na Ubuntu

```bash
# Aktualizacja systemu
sudo apt update && sudo apt upgrade -y

# Git
sudo apt install -y git curl wget unzip

# Repo
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

(repo jest rowniez dodane pod ci/bin/repo)

# Docker
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER
```

## Klonowanie repo

## Branch dev
```bash
mkdir -p ~/learnnow-dev && cd ~/learnnow-dev
repo init -u https://github.com/iqivi/learnnow-infra.git -b dev -m manifests/default.xml
repo sync
./ci/repo-checkout.sh
```


## Konfiguracja środowiska
W katalogu ci znajduje się skrypt envsetup.sh, który ustawia ścieżki i zmienne środowiskowe:
```bash
cd ~/server/ci
source envsetup.sh
```
> Repo sync by default ustawia repozytorium w stanie HEAD detached
> Aby github zaakceptowal commit, musimy ustawic w naszym repozytorium adekwatny branch, przykladowo git checkout -b main
> Skrypt repo-checkout.sh ustawia automatycznie w kadym repozytorium branch ustawiony w manifest.xml

```bash
./ci/repo-checkout.sh
```
> update frontend / update backend -> repo sync into docker build + nginx reset

## Przejscie lokalnie na dev / feature branch

Przykladowo dla repo backend zmien w manifest.xml revision (jesli nie ma wpisu revision, to repo uzyje main (dafult entry)):
path do manifestu, uzywanego przez repo (* nie ./infra/manifest):
project/.repo/manifests/manifests/deafult.xml

```xml
    <project
        name="learnnow-backend"
        path="backend"
        revision="dev-maciek" />
```

> Po lokalnej zmianie w manifest, wymagany jest repo sync z flaga --nmu (no manifest update, co zablokuje nadpisanie lokalnych zmian w manifescie)
```bash
repo sync --nmu
```

jesli chcemy cofnac sie na mastera w manifescie:
cd .repo/manifests
git reset --hard

#### TODO
Po zrobieniu

## Branch server (produkcja)
# Utwórz katalog projektu
```bash
mkdir -p ~/server && cd ~/server
```
# Inicjalizacja repo dla brancha server
```bash
repo init -u https://github.com/iqivi/learnnow-infra.git -b server -m manifests/default.xml

# Synchronizacja repo
repo sync
```

