# Sitefinity Quantum Website built with Docker
This repository contains a fully functioning Sitefinty 14 CMS instance running the Quantum example site.  This solution can be brought up in a mins to help with demos or training.  This is based on the [Quantum Sample](https://github.com/Sitefinity/Telerik.Sitefinity.Samples.Quantum/#net-core-renderer-setup) and the base [Sitefinity Docker Repo] (https://github.com/renjohn/SitefinityDocker)

## Starting your instance
Please follow the instructions for setting up the docker containers from  [Sitefinity Docker Repo] (https://github.com/renjohn/SitefinityDocker) 

## Setting up the database
1. Download the Sitefinity 14 database backup file from [here](https://sitefinitystore.blob.core.windows.net/files/Telerik.Sitefinity.Samples.Quantum/QuantumDb_V141_NetRenderer.zip)
2. Unzip the file and place SitefinityQuanutmNetCore141v4.bak file in the ./data/sql_data/backup directory
3. Run the restoredb.ps1 from the root directory
  * Note:  The container needs to be running in order for you to restore the database

## Styling of the page sample
In `client-src` directory you can find all the assets needed for the front-end representation of the Quantum sample demo. If you want to play around with them all you have to do is to install [NodeJS](https://nodejs.org/) (version 14.15.1) navigate to `client-src` folder and run `npm i` followed by `npm start`. This will precompile all the SCSS file to CSS, copy all the needed assets (fonts) and uglify sample's JavaScript file. On top of this, it will run a watch task that will do the previous tasks when SCSS file or JS file is modified.
Following the [Bootstrap customization](https://getbootstrap.com/docs/5.0/customize/overview/) instructions in `client-src/scss/vendors/_bootstrap.scss` we have overridden some of the variables that did not meet our design requirements, such as spacings, breakpoints and container widths. We urge you to follow this approach when using [Bootstrap](https://getbootstrap.com/) as "This is the way" (yes, Mandalorian pun intended). If you can use the Bootstrap "as is" you can check its usage in the [_Layout.cshtml](https://github.com/Sitefinity/sitefinity-aspnetcore-mvc-samples/blob/gebov/samples-for-13.2/src/starter-template/Views/Shared/_Layout.cshtml#L14) within the [.NET Core starter template sample](https://github.com/Sitefinity/sitefinity-aspnetcore-mvc-samples/tree/gebov/samples-for-13.2/src/starter-template).