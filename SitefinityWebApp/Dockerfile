### OPTION 1
##Set build container to correct .Net Framework SDK Version
#FROM mcr.microsoft.com/dotnet/framework/sdk:3.5-windowsservercore-20H2 AS build
#WORKDIR /app

## Copy Solution directory into build container
#COPY . .
##Restore packages
#RUN nuget restore 
##Build and publish Website
#RUN msbuild c:/app/SitefinityWebApp/SitefinityWebApp.csproj /p:Configuration=Release -r:false 
#RUN msbuild c:/app/SitefinityWebApp/SitefinityWebApp.csproj /p:DeployOnBuild=true /p:PublishProfile=FolderProfile.pubxml

##Set website container to run IIS and correct .Net Framework
##FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019 AS runtime 
#WORKDIR /inetpub/wwwroot
##Copy files from build container to website container
#COPY --from=build /app/SitefinityWebApp/obj/Docker/publish. ./
##Set Permissions on App Data Folder
#SHELL ["powershell"] 
#RUN & ICACLS "'C:\inetpub\wwwroot\App_Data'  /grant 'IIS APPPOOL\DefaultAppPool:(OI)(CI)F' /T"

### OPTION 2 - Faster build startup.   
##    1.Comment out all lines above   
##    2.Uncomment lines 28-32  
##    3.Publish the SitefinityWebApp from Visual Studio with Folder Publish Profile  
##    4.Build image
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019 AS runtime 
WORKDIR /inetpub/wwwroot
COPY obj/Docker/publish ./
SHELL ["powershell"] 
RUN & ICACLS "'C:\inetpub\wwwroot\App_Data'  /grant 'IIS APPPOOL\DefaultAppPool:(OI)(CI)F' /T"

##Enable Remote Debugging for either option uncomment line 30-32.  Should only be done in development
#EXPOSE 4020 4021
#RUN Invoke-WebRequest -OutFile c:\rtools_setup_x64.exe -Uri https://aka.ms/vs/17/release/RemoteTools.amd64ret.enu.exe;
#RUN 'c:\rtools_setup_x64.exe' /install /quiet /norestart
##Run the following command in powershell or the command prompt
##docker exec -it <id/name> "C:\Program Files\Microsoft Visual Studio 17.0\Common7\IDE\Remote Debugger\x64\msvsmon.exe" /nostatus /silent /noauth /anyuser /nosecuritywarn