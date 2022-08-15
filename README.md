# Sitefinity Quantum Website built with Docker
## Sitefinity Version 14.1.784
This repository contains a fully functioning Sitefinty 14 CMS instance running the Quantum example site.  This solution can be brought up in a mins to help with demos or training.  This is based on the [Quantum Sample](https://github.com/Sitefinity/Telerik.Sitefinity.Samples.Quantum/#net-core-renderer-setup) and the base [Sitefinity Docker Repo](https://github.com/renjohn/SitefinityDocker).  This repository was forked from the Quantum Sample and is maintained [Allegiance Group](https://www.teamallegiance.com).

### Prerequisites

Hardware Requirements:
* 40GB Free space
* 16GB RAM

Software Requirements:
* Docker Desktop 4.x - Running on experimental mode to allow both Linux and Windows VMs to run side by side.  The Windows VM is required for the Sitefinity CMS backend.  
  * Switch to Windows containers in Docker for Windows tray
  * Go to Docker Engine settings section and set experimental parameter to ‘true’
  * Add a json setting for DNS to allow internet access to windows containers - "dns": [ "8.8.8.8"]
* Visual Studio 2019+
  * Should be run in administrator mode to avoid issues
* Sitefinity License
* This was designed for use on a Windows machine 

### Directory Structure
* data - This is a persistent data directory for the solution at the root of the git repo that contain the following sub directories
  * sql_data - This is directory is mounted to the container to store the sql database and backups
      * backup - A directory to put backup files to be restored to your instance
      * data - Your Sitefinity databases will be persisted here
* src - This folder contains all the projects used to develop and run the application
  * Renderer - Location of the Sitefinty Frontend solution.  This is where you will run the main docker topology from
  * SitefinityWebApp - Location of the Sitefinity Backend solution.  This is where you can make any customizations for the backend of the product

## Getting Started

The solution is setup to build the sitefinityrenderer and sitefinitywebapp containers each time.  For speed purposes, the Sitefinity Web App needs to be built in Visual Studio before you build the containers.  The reason for this is to avoid having to the build in a larger separate docker image that uses the .Net 3.5 Framework that is necessary for the Quantum Sitefinity WebApp.  The project is setup to allow you to code in both the backend and frontend project simultaneously. The DockerFile also has the option to build using a separate container commented out if needed for anything.

### Developing and Debugging the project using Visual Studio and Docker:

These direction are for developing within Visual Studio and debugging using Docker compose from within Visual Studio.  
1. Open the Sitefinity14Quantum.sln solution in Visual studio 
2. Select the SitefinityWebApp project in the solution explorer
3. Publish the SitefinityWebApp project using the FolderProfile
4. Rebuild the solution
5. Switch the build configuration to docker compose
6. Debug the project using Docker Compose options  
7. A browser should open https://localhost:5001 

### Sitefinity Initialization

The first time you spin up your container you will need to enter values for your local instance
1. Project Startup - Choose activate a license file that you have downloaded.
2. Register yourself as the administrator
3. The project warmup screen will appear while the database is being created behind the scenes
### Setting up the Quantum Database
1. Download the Sitefinity 14 database backup file from [here](https://sitefinitystore.blob.core.windows.net/files/Telerik.Sitefinity.Samples.Quantum/QuantumDb_V141_NetRenderer.zip)
2. Unzip the file and place SitefinityQuanutmNetCore141v4.bak file in the ./data/sql_data/backup directory
3. Run the restoredb.ps1 from the root directory
  * Note:  The sql server container needs to be running in order for you to restore the database.  
4. Refresh the site
5. Login with admin / admin@2 instead of the user you created above

