# local-docker-postgres

This is a simple docker compose setup to create a temporary database using docker. Using a temporary database has the advantage of making it easy to bring up and tear down a database without the overhead that comes with creating a temporary databse locally.

## Instructions

1. Copy everything from config_templates onto the root directory.

```shell
cp -r ./config_templates/{.,}* .
```

2. Fill in information in the newly copied over `.env` file from the database containing the data you would like to copy to your local.

3. Run docker compose.

```shell
# This might cause errors if you exit and run it a second time. If the errors indicate that a pg_restore had already been done previously, this is mostly harmless.
docker compose up

# Alternately, you can just run this to prevent pg_restore from re-running.
docker compose up temp_instance
```

4. Optionally, you can view the database in pgadmin by connecting to this server using the credentials supplied in `.env`. Note that the container needs to be running for this to work. The following assumes you did not modify the defaults from `.env`:

```python
Name: anything you'd like
Host name/addess: localhost
Port: 5432
# must be the same as CLOUD_DBNAME
Maintainence database:
Username: username
Password: password
```
