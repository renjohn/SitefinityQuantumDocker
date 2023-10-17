# Sitefinity Quantum Website built with Docker
## Sitefinity Version 14.4.8132.17
This repository contains a fully functioning Sitefinty 14 CMS instance running the Quantum example site.  This solution can be brought up in a mins to help with demos or training.  This is based on the [Quantum Sample](https://github.com/Sitefinity/Telerik.Sitefinity.Samples.Quantum/#net-core-renderer-setup) and the base [Sitefinity Docker Repo](https://github.com/renjohn/SitefinityDocker). This repository was forked from the Quantum Sample and is maintained [Allegiance Group](https://www.teamallegiance.com).

### Prerequisites

Hardware Requirements:
* 40GB Free space
* 16GB RAM

Software Requirements:
* Docker Desktop 4.18 - Running on experimental mode to allow both Linux and Windows VMs to run side by side.  The Windows VM is required for the Sitefinity CMS backend.  
  * Must use Docker Desktop Version 4.18, LCOW is deprecated in future versions
  * Switch to Windows containers in Docker for Windows tray
  * Go to Docker Engine settings section and set experimental parameter to ‘true’
  * Add a json setting for DNS to allow internet access to windows containers - "dns": [ "8.8.8.8"]
* Visual Studio 2019+
  * Should be run in administrator mode to avoid issues
* Sitefinity License
* This was designed for use on a Windows machine 

### Directory Structure

* data - This is a persistent data directory for the solution at the root of the git repo that contain the following sub directories
  * sql_data - This is directory is mounted to the container to store the sql database.  Your Sitefinity databases will be persisted here
* src - This folder contains all the projects used to develop and run the application
  * Renderer - Location of the Sitefinty Frontend solution.  This is where you will run the main docker topology from
  * SitefinityWebApp - Location of the Sitefinity Backend solution.  This is where you can make any customizations for the backend of the product

## Getting Started

The solution is setup to build the sitefinityrenderer and sitefinitywebapp containers each time.  For speed purposes, the Sitefinity Web App needs to be built in Visual Studio before you build the containers.  The reason for this is to avoid having to the build in a larger separate docker image that uses the .Net 3.5 Framework that is necessary for the Quantum Sitefinity WebApp.  The project is setup to allow you to code in both the backend and frontend project simultaneously. The DockerFile also has the option to build using a separate container commented out if needed for anything.

### Developing and Debugging the project using Visual Studio and Docker:

These direction are for developing within Visual Studio and debugging using Docker compose from within Visual Studio.  
1. Open the Sitefinity14Quantum.sln solution in Visual studio 
2. Build the solution
3. Publsih the SitefinityWebApp Solution
4. Switch the build configuration to docker compose
5. Debug the project using Docker Compose build configuration  
6. A browser should open https://localhost:5001 

### Setting up the database
1. Download the Sitefinity 14 database backup file from [here](https://sitefinitystore.blob.core.windows.net/files/Telerik.Sitefinity.Samples.Quantum/QuantumDb_V141_NetRenderer.zip)
2. Unzip the file and place SitefinityQuanutmNetCore141v4.bak file in the ./data/sql_data/backup directory
3. Create a Sitefinity.mdf and Sitefinity_log.ldf file in the ./data/sql_Data/data directory
4. Run the restoredb.ps1 from the root directory
  * Note:  The sql server container needs to be running in order for you to restore the database.

### Sitefinity Initialization

After you have restored the database you can re-run the docker compose in Visual Studio.  The first time you spin up your container you will need to enter values for your local instance
1. Project Startup - Choose activate a license file that you have downloaded.
    * The license file will be provided by the Tech Lead
2. Database Settings
    * MS SQL Server
    * Server:  quantumsitefinitysql
    * Port: 1433
    * Password:  See .env file in root of solution
    * Database Name: Sitefinity
3. Login with admin / admin@2
4. Ensure that the Default webservice has Anonymous access enabled (Administrations > Web Services) 


### Styling of the page sample
In `client-src` directory you can find all the assets needed for the front-end representation of the Quantum sample demo. If you want to play around with them all you have to do is to install [NodeJS](https://nodejs.org/) (version 14.15.1) navigate to `client-src` folder and run `npm i` followed by `npm start`. This will precompile all the SCSS file to CSS, copy all the needed assets (fonts) and uglify sample's JavaScript file. On top of this, it will run a watch task that will do the previous tasks when SCSS file or JS file is modified.
Following the [Bootstrap customization](https://getbootstrap.com/docs/5.0/customize/overview/) instructions in `client-src/scss/vendors/_bootstrap.scss` we have overridden some of the variables that did not meet our design requirements, such as spacings, breakpoints and container widths. We urge you to follow this approach when using [Bootstrap](https://getbootstrap.com/) as "This is the way" (yes, Mandalorian pun intended). If you can use the Bootstrap "as is" you can check its usage in the [_Layout.cshtml](https://github.com/Sitefinity/sitefinity-aspnetcore-mvc-samples/blob/gebov/samples-for-13.2/src/starter-template/Views/Shared/_Layout.cshtml#L14) within the [.NET Core starter template sample](https://github.com/Sitefinity/sitefinity-aspnetcore-mvc-samples/tree/gebov/samples-for-13.2/src/starter-template).