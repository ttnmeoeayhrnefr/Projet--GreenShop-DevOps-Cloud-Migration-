# README - Machine srvweb

## Description

Ce serveur héberge un site de e-commerce appelé GreenShop. Les services utilisés sont :

- Serveur Web : Apache
- Base de données : MariaDB

---

## Organisation du serveur

### 1. Serveur Web (Apache)

Le serveur web utilisé est Apache. Les fichiers sources du site web GreenShop sont situés dans le répertoire suivant :

```
/var/www/greenshop/
```

C'est dans ce répertoire que se trouvent tous les fichiers PHP et HTML, comme index.php, product.php, register.php, et autres fichiers liés au site e-commerce.

### 2. Base de données (MariaDB)

La base de données utilisée pour stocker les utilisateurs, produits et autres informations est MariaDB. Vous pouvez utiliser un SQL dump pour récupérer la base de données.

Pour exporter la base de données en SQL dump, vous pouvez utiliser la commande suivante depuis un terminal :

```bash
mysqldump -u [user] -p [database_name] > database_dump.sql
```

Cela générera un fichier `database_dump.sql` que vous pourrez importer dans une nouvelle instance MariaDB.

---

## Fichiers de configuration

### Apache

Le fichier principal de configuration d'Apache est situé dans `/etc/apache2/apache2.conf`.

Le site est configuré dans `/etc/apache2/sites-available/greenshop.conf`.

### MariaDB

Les fichiers de configuration de MariaDB se trouvent dans `/etc/mysql/my.cnf`.

---

## Récupération de la base de données

Si vous avez besoin de récupérer la base de données, vous pouvez importer le SQL dump en utilisant la commande suivante dans MariaDB :

```bash
mysql -u [user] -p [database_name] < database_dump.sql
```