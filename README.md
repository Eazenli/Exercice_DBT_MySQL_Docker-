# 🏗️ Projet Data Warehouse — dojo_dbt_w12

## 🧾 Description du dépôt
Projet pédagogique de data warehouse local avec **Docker**, **MySQL**, **DBT** et **Python**.
L'objectif est de construire une chaîne complète de traitement analytique :

- Import de fichiers CSV dans une base MySQL Dockerisée

- Modélisation des données avec DBT

- Orchestration de l’environnement avec Docker Compose

---

## ⚙️ Technologies utilisées

| Composant | Description |
|----------|-------------|
| `MySQL` | hébergée dans un conteneur Docker |
| `DBT` | Framework de transformation de données en SQL versionné |
| `Docker` | Conteneurisation des environnements Python et SQL |
| `docker-compose` | Orchestration multi-conteneurs (MySQL, DBT, Python) |
| `Python (pandas, sqlalchemy)` | Script d’import des données CSV dans la base MySQL |

---

## 🔐 Configuration DBT

Le fichier `profiles.yml` contenant vos identifiants MySQL ne doit **jamais** être poussé dans GitHub.  
À la place, utilisez un fichier `profiles-template.yml` pour guider la configuration.

Une fois le projet cloné :

```bash
cp docker_profiles/profiles-template.yml docker_profiles/profiles.yml
```

## 🚀 Workflow du projet

### 1. Démarrage de l’environnement

```bash
docker-compose up --build -d
```
Cela :

- (re)construit les images personnalisées 

- démarre les conteneurs mysql, dbt, importer 

- monte les volumes persistants (les données sont conservées entre les runs) 

### 2. Importer les données CSV dans MySQL

```bash
docker-compose run importer
```
Cela :

- exécute le script connect_mysql.py, qui :

- crée la base si elle n'existe pas

- importe tous les fichiers .csv dans des tables raw_*


### 3. Lancer les modèles DBT

```bash
docker-compose run dbt dbt run
```
Cela :

- lit les fichiers .sql dans models/

- compile et exécute les requêtes sur la base dojo_dbt_w12

- crée des vues ou des tables transformées à partir des données brutes

## 🧱 Architecture du projet
.
├── docker-compose.yml
├── Dockerfile
├── connect_mysql.py
├── dojo_dbt_w12/         ← projet DBT (models, seeds, dbt_project.yml, etc.)
├── docker_profiles/      ← contient le profiles.yml pour DBT
├── CSV/    ← dossier local avec les fichiers .csv

## 📦 Volumes persistants
Le volume mysql_data est déclaré comme persistant :

```yaml
volumes:
  mysql_data:
```
Il conserve :

- toutes les données de MySQL

- même si les conteneurs sont supprimés ou Docker Desktop est fermé

Pour le visualiser :

```bash
docker volume ls
```
Et pour supprimer un volume inutile :

```bash
docker volume rm nom_du_volume
```
## 🐳 Notions importantes sur Docker

| Terme             | Signification                                                                           |
|-------------------|------------------------------------------------------------------------------------------|
| **Image**          | Modèle figé d’un environnement (ex: Python + DBT + dépendances)                        |
| **Conteneur**      | Instance vivante d’une image exécutée avec ses propres paramètres                      |
| **Volume**         | Espace de stockage externe au conteneur, persistant                                    |
| **Build**          | Construction d’une image à partir du `Dockerfile`                                      |
| **Run**            | Exécution d’un conteneur (unique ou interactif)                                        |
| **Compose**        | Outil d’orchestration multi-conteneurs                                                 |
| **Ports**          | Exposition des services vers l’extérieur du conteneur                                  |
| **restart: always**| Redémarre automatiquement un conteneur si Docker redémarre                             |


## Vérifier l’état de la base de données

```bash
docker-compose exec mysql mysql -uroot -pwcs2025 -e "SHOW DATABASES;"
````