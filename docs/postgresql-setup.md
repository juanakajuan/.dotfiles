1. Install PostgreSQL from the official repositories:
```bash
sudo pacman -S postgresql
```

2. Initialize the database cluster:
```bash
sudo -u postgres initdb -D /var/lib/postgres/data
```

3. Start and enable the PostgreSQL service:
```bash
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

4. Create a new PostgreSQL user matching your system user:
```bash
sudo -u postgres createuser --interactive
```

#### When prompted, enter your system username and decide if you want the user to be a superuser.
5. Create a database for your user:
```bash
sudo -u postgres createdb db_name
```

6. Verify the installation by connecting to the database:
```bash
psql
```
