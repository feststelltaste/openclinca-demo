# Welcome!

OpenClinica is an open source software for Electronic Data Capture (EDC) and Clinical Data Management (CDM) used to optimize clinical trial workflow in a smart and secure fashion. Use OpenClinica to:

- Build studies
- Create eCRFs
- Design rules/edit checks
- Schedule patient visits 
- Capture eCRF data from study sites via the web
- Monitor and manage clinical data
- Audit trails and electronic signatures
- Role-based access controls
- Import/Export Data
- Extract data for analysis and reporting
- and much more!

## Getting Started

- [System requirements](https://docs.openclinica.com/installation/system-requirements)
- [Report an issue](https://jira.openclinica.com/)
- [Release notes](https://docs.openclinica.com/release-notes)
- [Extensions/Contributions](https://community.openclinica.com/extensions)
- [Installation](https://github.com/OpenClinica/OpenClinica/wiki)

## Local test installation

The repository contains a Docker Compose setup for a disposable local
OpenClinica installation. It requires Maven, JDK 17 for the build, Docker, and
Docker Compose.

Build all modules and start the application from the repository root:

```bash
mvn -DskipTests package
docker compose -f docker-compose.test.yml up -d
```

The first application start creates and migrates the database and can take a
few minutes. Follow it with:

```bash
docker compose -f docker-compose.test.yml logs -f openclinica
```

Open <http://127.0.0.1:8080/OpenClinica/MainMenu> and sign in with the initial
test account `root` / `12345678`. The Compose configuration and credentials are
for local testing only. Forced password changes and password expiration are
disabled in this local test installation.

Reset the local database and load deterministic demo data:

```bash
./docker/test/reset-demo-data.sh --yes
```

The command creates eight simple English demo studies with 20 synthetic
subjects each (160 in total), complete visits, forms, and everyday habit data.
Their enrollment targets produce different study progress values from 10% to
100%. Planned study periods span 2024 to 2028, with follow-up visits ranging
from 30 days to one year. It deletes the existing local Docker test database
first. No real personal data is used.

Stop the containers while retaining test data:

```bash
docker compose -f docker-compose.test.yml down
```

To remove the test database and uploaded files as well, add `--volumes`.

### GitHub Codespaces

The repository includes a development-container configuration for Codespaces.
Create a codespace with at least four CPU cores. Maven and Docker are installed
automatically, but the application is not built during container creation. This
keeps codespace rebuilds fast. Build and start OpenClinica when needed:

```bash
mvn -DskipTests package
docker compose -f docker-compose.test.yml up -d
```

To load the synthetic demo data after the application has started, run:

```bash
./docker/test/reset-demo-data.sh --yes
```

Open the `PORTS` tab, select port `8080`, and open its forwarded address. Add
`/OpenClinica/MainMenu` to that address. Forwarded ports are private by default;
do not make this test installation public because it uses known credentials.

Codespace storage survives stopping and restarting a codespace, but deleting
the codespace also deletes its local Docker volumes and uploaded CRFs.

## Request a feature

To request a feature please submit a ticket on [Jira](https://jira.openclinica.com/) or start a discussion on the [OpenClinica Forum](http://forums.openclinica.com).

##Screenshots
![Imgur](http://i.imgur.com/ACXj3L7.jpg "Home screen") 
##![Imgur](http://i.imgur.com/DqHQ05Z.jpg "Subject Matrix")



## License

[GNU LGPL license](https://www.openclinica.com/gnu-lgpl-open-source-license)
