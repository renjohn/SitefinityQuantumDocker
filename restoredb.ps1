
#docker exec -it sitefinitysql /opt/mssql-tools/bin/sqlcmd -S localhost `
#  -U SA -P "Sitefinity14@2022" `
#  -Q "RESTORE FILELISTONLY FROM DISK = '/var/opt/mssql/backup/SitefinityQuanutmNetCore141v4.bak'"
docker exec -it sitefinitysql /opt/mssql-tools/bin/sqlcmd `
   -S localhost -U SA -P "Sitefinity14@2022" `
   -Q "RESTORE DATABASE SitefinityQuantum FROM DISK = '/var/opt/mssql/backup/SitefinityQuanutmNetCore141v4.bak' WITH MOVE 'Sitefinity' TO '/var/opt/mssql/data/Sitefinity.mdf',  MOVE 'Sitefinity_Log' TO '/var/opt/mssql/data/Sitefinity_log.ldf'"