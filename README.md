# Dremio demo

* [Demo deck](https://docs.google.com/presentation/d/1-Uv_3vNzYVGgXwKDMeZzM0Xkku65gvCKvU6j6yP9uN4/edit?usp=sharing)

## Requirements
Install [Visual Studio Code](https://code.visualstudio.com/) and the [Rest Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) extension.
Install the [DBeaver](https://dbeaver.io/) opensource edition. 
Install the [RStudio](https://www.rstudio.com/) opensource edition. 
Install the [GoodData DB Gateway](https://github.com/zsvoboda/gooddata-db-gateway)

## Creating Postgres DB
There are two options how to load data to your PostgreSQL database.

### DBeaver
1. Connect to your Postgres from the DBeaver
2. Execute the ``sql/pgsql_tables.sql``
3. Import data to the tables that the script creates (select tables and right-click) from the corresponding CSV files in the ``data`` directory
4. Execute the ``sql/pgsql_constraints.sql`` script

### pg_restore
The database has been dumped with this command:

 ``pg_dump --host=localhost --port=5432 --user=demouser --compress=9 --file=insurance.dump --format=c --schema=insurance demo``

 You can restore it using this command:

  ``pg_restore --host=localhost --port=5432  --dbname=demo ./data/backup/insurance.dump``

## Invoking GoodData.CN REST APIs
Open workspace `workspace.code-workspace` in the VSCode editor (it should be
detected automatically while opening the folder). There are three environments
preconfigured in this workspace:
* "GoodData.CN CE" for calling API of local Docker container

Open the ``./api/rest.http`` file in the VSCode editor, select a proper environment
and and click on the ``Send Request`` link on top of each request.

## Publish analytics solution: REST calls sequence
Note the comments on top of each request. Execute the sequence of requests with the comments below:

1. Create datasource
3. Publish physical model
5. Publish all workpaces

## Setup the GoodData DB gateway
The gateway is used by BI tools (Excel, Power BI, Qlik, Tableau, RStudio, Jupyter) to connect to the GoodData workspace. 

1. Checkout the [GoodData DB Gateway](https://github.com/zsvoboda/gooddata-db-gateway)
2. ``cd docker && ./start.sh`` from the repo root. Wait for the Docker image build and start.
3. Connect to the gateway from DBeaver via PostgreSQL driver (localhost:2543, database: gooddata, user: gooddata, password: gooddata)
4. Execute the ``sql/gateway_config.sql`` script in the DBEaver. 
5. Connect to the gateway via PostgreSQL driver (localhost:2543, database: gooddata, user: gooddata, password: gooddata) from a tool.

Enjoy!