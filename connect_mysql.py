import os
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy_utils import database_exists, create_database

# Paramètres de connexion.
username = "root"
password = "wcs2025"
host = "mysql"  # <-- nom du service docker-compose
port = 3306
database = "dojo_dbt_w12"

# On créée la connexion vers la base de données.
DATABASE_URI = f'mysql+pymysql://{username}:{password}@{host}:{port}/{database}'
engine = create_engine(DATABASE_URI)

# On créée la base de données si elle n'existe pas.
if not database_exists(engine.url):
    create_database(engine.url)

# On créée un DataFrame pour chaque fichier CSV de la base de données.
liste_tables = ["CountryRegion", "Customer", "Person", "Product", "ProductCategory", "ProductDescription",
                "ProductModel", "ProductModelProductDescriptionCulture", "ProductSubCategory", "SalesOrderDetail",
                "SalesOrderHeader", "SalesTerritory"]

dossier = "./csv"

for table in liste_tables:
    csv_url = os.path.join(dossier, f"{table}.csv")

    if not os.path.isfile(csv_url):
        print(f"Fichier introuvable : {csv_url}")
        continue  # Passe au fichier suivant sans planter

    try:
        df = pd.read_csv(csv_url)
        df.to_sql(f"raw_{table.lower()}", engine,
                  if_exists="replace", index=False)
        print(f"Table raw_{table} chargée avec succès.")
    except Exception as e:
        print(f"Erreur lors du chargement de {table} : {e}")
