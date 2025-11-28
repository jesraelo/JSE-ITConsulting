/*   MENU
===========  PRODUCTION: MIGRATION BACKUP PREPARATION
[01] - DISABLE APPS
[02] - STOP SSRS AGENT SERVICE
[03] - STOP SSRS AND SQL PRINCIPAL SERVICES
[04] - DISABLE DATABASE USERS (SEE EXCEL LIST, I.E. , dpaDB,NCCI_DOM\servapp,NCCI_DOM\SQLsvrRptg,NCCI_DOM\SQLsvrUser)
[05] - DISASSOCIATE DBs IN MIRRORING (SET PARTNER OFF)
[06] - SET DB IN SINGLE USER MODE 
[07] - FULL DB BACKUP 
[08] - COPY OVER ONTO THE SHARED NET PATH
[09] - REPEAT FROM STEP [04] FOR ALL DBs
===========  VM 07: RESTORATION FROM PRODUCTION AND BACKUPS FOR MIRRORING RESTORATION
[10] - IF REQUIRED:  SET MIRRORING PARTNERS OFF 
[11] - RESTORE ALL DBs WITH REPLACE OPTION (USE THE LATEST SHARED PATH FOR RESTORATION) 
[12] - SET ALL DBs COMPATIBILITY LEVEL TO 130 (set compatibility_level = 130) 
[13] - (OPTIONAL) OPTIONAL ALL USER DB INDEX CHECK AND MAINTENANCE
[14] - TAKE FULL BACKUP OF ALL DBs AND THE LOGs SEPARATELY
[15] - COPY THE N*2 FILES OVER TO VM 08 (I.E. C:\TEMP, E:\...) 
============  VM 08: RESTORATION OF DB BACKUPS COPIED OVER FROM THE PRINCIPAL SERVER
[16] - LOG ON TO VM 08, RUN SSMS
[17] - DROP ALL DBs ON VM 08
[18] - RESTORE ALL DBs FROM THE SHARED NET PATH
[19] - SET PARTNERS TO POINT TO 07 (SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022')
============  VM 07: FINALIZING THE PROCESS
[20] - SET PARTNERS TO POINT TO 08 (SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5022')
[21] - REFRESH THE REGISTERED SERVERS AND DATABASES AND MAKE SURE ALL dbS ARE IN SYNC AND ON MIRRORED SERVER YOU SHOULD SEE (MIRROR,SYNC/RESTORING)
DONE
*/
-- 

-- CREATE THE TEMP FOLDER ON THE ROOT OF THE "F" DRIVE FOR BACKUPS TO COPY TO THE MIRRORING FOR THE INITIAL SETUP

-- ALTER DATABASE dbCheckList SET PARTNER FORCE_SERVICE_ALLOW_DATA_LOSS ; 

-- CHANGE CONNECTION TO 08 THE MIRRORING SERVER. 
-- in 08 disassociate mirros with principals
ALTER DATABASE _ARCHIVES		SET PARTNER OFF;
ALTER DATABASE AgentResults		SET PARTNER OFF;
ALTER DATABASE bluscreen		SET PARTNER OFF;
ALTER DATABASE dba_admin		SET PARTNER OFF;
ALTER DATABASE dba_johne		SET PARTNER OFF;
ALTER DATABASE dbCheckList		SET PARTNER OFF;
ALTER DATABASE dbDone			SET PARTNER OFF;
ALTER DATABASE LossMitigation	SET PARTNER OFF;
ALTER DATABASE NCCI				SET PARTNER OFF;
ALTER DATABASE Reporting		SET PARTNER OFF;
ALTER DATABASE RPI				SET PARTNER OFF;
ALTER DATABASE Staging			SET PARTNER OFF;
ALTER DATABASE WebData			SET PARTNER OFF;

-- drop databases prior to re-establishing the new mirrors
-- if 1 or more DBs are stuck in mirroring/recovery then reboot then drop db
drop database _ARCHIVES	
drop database AgentResults	
drop database bluscreen		
drop database dba_admin		
drop database dba_johne		
drop database dbCheckList		
drop database dbDone			
drop database LossMitigation	
drop database NCCI				
drop database Reporting		
drop database RPI				
drop database Staging			
drop database WebData			

--==========================================================================================================
-- WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING 
-- PROCEED WITH PRIMARY SERVER (PRINCIPAL)
-- CHANGE CONNECTION TO 07

-- RESTORING method DURATION :  APPX= 40 TO 45 MINUTES
		USE [master]
		ALTER DATABASE _Archives SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE _Archives 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\_Archives_backup_2025_10_08_003003_2437332.BAK' WITH  
			   
				FILE = 1,  MOVE N'_Archives'           TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\_Archives.mdf',  
						   MOVE N'_Archives_log'       TO N'F:\MSSQL Logs\_Archives_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE _Archives SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE AgentResults SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE AgentResults 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\AgentResults_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'AgentResults_Dat'           TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\AgentResults.mdf',  
						   MOVE N'AgentResults_Log'       TO N'F:\MSSQL Logs\AgentResults_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE AgentResults SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE Bluscreen SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE Bluscreen 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\Bluscreen_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'Bluscreen_Data'           TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\Bluscreen.mdf',  
						   MOVE N'Bluscreen_Log'       TO N'F:\MSSQL Logs\Bluscreen_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE Bluscreen SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE DBA_Admin SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE DBA_Admin 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\DBA_Admin_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'DBA_Admin'           TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\DBA_Admin.mdf',  
						   MOVE N'DBA_Admin_Log'       TO N'F:\MSSQL Logs\DBA_Admin_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE DBA_Admin SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE DBA_JohnE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE DBA_JohnE 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\DBA_JohnE_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'DBA_JohnE'           TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\DBA_JohnE.mdf',  
						   MOVE N'DBA_JohnE_Log'       TO N'F:\MSSQL Logs\DBA_JohnE_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE DBA_JohnE SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE dbCheckList SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE dbCheckList 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\dbCheckList_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'dbCheckList'           TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbCheckList.mdf',  
						   MOVE N'dbCheckList_Log'       TO N'F:\MSSQL Logs\dbCheckList_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE dbCheckList SET MULTI_USER;

-- ========

		USE [master]
		ALTER DATABASE dbDone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE dbDone 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\dbDone_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'dbDone_Dat'       TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbDone.mdf',  
						   MOVE N'dbDone_Log'       TO N'F:\MSSQL Logs\dbDone_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE dbDone SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE LossMitigation SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE LossMitigation 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\LossMitigation_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'LossMitigation_Data'      TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\LossMitigation.mdf',  
						   MOVE N'LossMitigation_Log'       TO N'F:\MSSQL Logs\LossMitigation_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE LossMitigation SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE NCCI SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE NCCI 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\NCCI_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'NCCI_Data'      TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\NCCI.mdf',  
						   MOVE N'NCCI_Log'       TO N'F:\MSSQL Logs\NCCI_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE NCCI SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE Reporting SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE Reporting 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\Reporting_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'Reporting'      TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\Reporting.mdf',  
						   MOVE N'Reporting_Log'       TO N'F:\MSSQL Logs\Reporting_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE Reporting SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE RPI SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE RPI 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\RPI_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'RPI_Data'      TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\RPI.mdf',  
						   MOVE N'RPI_Log'       TO N'F:\MSSQL Logs\RPI_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE RPI SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE Staging SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE Staging 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\Staging_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'StagingData'      TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\Staging.mdf',  
						   MOVE N'StagingData_log'  TO N'F:\MSSQL Logs\Staging_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE Staging SET MULTI_USER;
-- ========

		USE [master]
		ALTER DATABASE WebData SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		RESTORE DATABASE WebData 
			FROM  DISK = N'\\nationalcreditors.com\deploy\LakeForest\_SQLBACKUP_20251008\WebData_backup_2025_10_08_003003_2437332.BAK' WITH  
				FILE = 1,  MOVE N'webdataX_dat'      TO N'E:\MSSQL13.MSSQLSERVER\MSSQL\DATA\WebData.mdf',  
						   MOVE N'webdataX_log'  TO N'F:\MSSQL Logs\WebData_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 20 ; 
		ALTER DATABASE WebData SET MULTI_USER;
/*
Nonqualified transactions are being rolled back. Estimated rollback completion: 0%.
Nonqualified transactions are being rolled back. Estimated rollback completion: 100%.
20 percent processed.
40 percent processed.
60 percent processed.
80 percent processed.
100 percent processed.
Processed 13616768 pages for database 'WebData', file 'webdataX_dat' on file 1.
Processed 76 pages for database 'WebData', file 'webdataX_log' on file 1.
RESTORE DATABASE successfully processed 13616844 pages in 1702.748 seconds (62.476 MB/sec).
select 1702.748 / 60.0   =  28.3791333 minutes 
*/

-- ===================================================================================================
-- set to 2016 compatibility, currently are set to 100 (2008) 
select @@VERSION 
-- Microsoft SQL Server 2016 (SP3-GDR) (KB5058718) - 13.0.6460.7 (X64)   May 29 2025 21:37:21   
-- Copyright (c) Microsoft Corporation  Enterprise Edition: Core-based Licensing (64-bit) 
-- on Windows Server 2016 Standard 10.0 <X64> (Build 14393: ) (Hypervisor) 

select SERVERPROPERTY('productversion') ;
alter database _archives		set compatibility_level = 130 ; 
alter database _TEST			set compatibility_level = 130 ; 
alter database AgentResults		set compatibility_level = 130 ; 
alter database Bluscreen		set compatibility_level = 130 ; 
alter database DBA_Admin		set compatibility_level = 130 ; 
alter database DBA_johne		set compatibility_level = 130 ; 
alter database DBCheckList		set compatibility_level = 130 ; 
alter database dbDone			set compatibility_level = 130 ; 
alter database LossMitigation	set compatibility_level = 130 ; 
alter database NCCI				set compatibility_level = 130 ; 
alter database Reporting		set compatibility_level = 130 ; 
alter database RPI				set compatibility_level = 130 ; 
alter database Staging			set compatibility_level = 130 ; 
alter database WebData			set compatibility_level = 130 ; 

-- ===================================================================================================
-- ===================================================================================================
-- OPTIONAL ALL USER DB INDEX CHECK AND MAINTENANCE
-- ===================================================================================================
declare @RunStatements bit = 0 ; 

 -- GET MAX DB NUMBER (DATABASE_ID) 
declare @LastDB_ID smallint ;
select @LastDB_ID = MAX(DATABASE_ID) from sys.databases ; 

declare @dbid as smallint = 5 ; 
declare @SQL  as nvarchar(max) = '' 
declare @DatabaseName as nvarchar(max) = (select [name]  from sys.databases where database_id = @dbid )
drop table if exists #IndexTable ;
create table #IndexTable (DatabaseName varchar(64), table_name varchar(64), index_name varchar(64), index_type varchar(64), avg_fragmentation_in_percent decimal(12,10), SQL varchar(max) )

while @dbid <= @LastDB_ID 
begin
	if @dbid = 5 or @dbid between 11 and 17  
	begin
		set @sql = 
		'insert #IndexTable 
		select '''+ 
			  @DatabaseName + ''' DatabaseName
			,obj.name as Table_Name
			,ind.[name] as Index_Name
			,indexstats.index_type_desc as Index_Type 
			,indexstats.Avg_Fragmentation_in_Percent
			,''Alter Index '' + quotename(ind.name) + '' ON '' + '''+@DatabaseName + '''+ ''.''+ sch.[name] + ''.'' + obj.name + 
			case when indexstats.avg_fragmentation_in_percent >= 30 then '' rebuild with (fillfactor = 80) ''
				 when indexstats.avg_fragmentation_in_percent between 15 and 29 then '' reorganize ''
				 else null 
			end as [SQL] 
		from sys.dm_db_index_physical_stats (' + cast(@dbid as varchar(2)) + ',null,null,null,null) indexstats
		join ' + @DatabaseName + '.sys.indexes ind on ind.object_id = indexstats.object_id and
			ind.index_id = indexstats.index_id
		join ' +@DatabaseName+'.sys.objects obj on obj.object_id = ind.object_id 
		join ' +@DatabaseName+'.sys.schemas sch on sch.schema_id = obj.schema_id 
		where ind.name is not null
		order by indexstats.avg_fragmentation_in_percent desc '
		print @sql 
		exec sp_executesql @SQL 
	end 
	set @dbid += 1 
	set @DatabaseName = (select [name]  from sys.databases where database_id = @dbid )
end ; 

select * from #IndexTable where [SQL] is not null
-- ====================================================
if @RunStatements = 1
begin
	-- create a cursor to execute the statements
	declare @statement as nvarchar(max) = '' 
	declare TheCursor cursor for (select [SQL] from #IndexTable where [SQL] is not null ) ; 
	open TheCursor
	fetch next from TheCursor into @statement 

	while @@FETCH_STATUS =0 
	begin
		print 'executing ' + @statement
		exec sp_executesql @statement 
		fetch next from TheCursor into @statement 
	end 

	close TheCursor
	deallocate TheCursor 
end ; 

-- END OF OPTIONAL INDEXING 
-- ===================================================================================================


-- =====================================
-- MUST TAKE A FULL BACKUP AND THE LOG BACKUP
--    UPON COMPLETION; COPY THE FILES AND DROP THEM ON THE MIRROR SERVER (C:\TEMP)

use master 
go 
	BACKUP DATABASE _TEST 
		TO  DISK = N'F:\TEMP\_TEST_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'_TEST Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG _TEST 
		TO  DISK = N'F:\TEMP\_TEST_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'_TEST LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE _Archives 
		TO  DISK = N'F:\TEMP\_Archives_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'_Archives Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG _Archives 
		TO  DISK = N'F:\TEMP\_Archives_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'_Archives LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================
	BACKUP DATABASE AgentResults 
		TO  DISK = N'F:\TEMP\AgentResults_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'AgentResults Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG AgentResults 
		TO  DISK = N'F:\TEMP\AgentResults_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'AgentResults LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE Bluscreen 
		TO  DISK = N'F:\TEMP\Bluscreen_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'Bluscreen Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG Bluscreen 
		TO  DISK = N'F:\TEMP\Bluscreen_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'Bluscreen LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE DBA_Admin 
		TO  DISK = N'F:\TEMP\DBA_Admin_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'DBA_Admin Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG DBA_Admin 
		TO  DISK = N'F:\TEMP\DBA_Admin_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'DBA_Admin LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE DBA_JohnE 
		TO  DISK = N'F:\TEMP\DBA_JohnE_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'DBA_JohnE Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG DBA_JohnE 
		TO  DISK = N'F:\TEMP\DBA_JohnE_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'DBA_JohnE LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE dbCheckList 
		TO  DISK = N'F:\TEMP\dbCheckList_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'dbCheckList Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG dbCheckList 
		TO  DISK = N'F:\TEMP\dbCheckList_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'dbCheckList LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE dbDone 
		TO  DISK = N'F:\TEMP\dbDone_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'dbDone Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG dbDone 
		TO  DISK = N'F:\TEMP\dbDone_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'dbDone LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE LossMitigation 
		TO  DISK = N'F:\TEMP\LossMitigation_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'LossMitigation Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG LossMitigation 
		TO  DISK = N'F:\TEMP\LossMitigation_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'LossMitigation LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE NCCI 
		TO  DISK = N'F:\TEMP\NCCI_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'NCCI Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG NCCI 
		TO  DISK = N'F:\TEMP\NCCI_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'NCCI LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE Reporting 
		TO  DISK = N'F:\TEMP\Reporting_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'Reporting Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG Reporting 
		TO  DISK = N'F:\TEMP\Reporting_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'Reporting LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE RPI 
		TO  DISK = N'F:\TEMP\RPI_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'RPI Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG RPI 
		TO  DISK = N'F:\TEMP\RPI_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'RPI LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
	BACKUP DATABASE Staging 
		TO  DISK = N'F:\TEMP\Staging_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'Staging Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG Staging 
		TO  DISK = N'F:\TEMP\Staging_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'Staging LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
-- =======================================================================	
USE [WebData]
GO
DBCC SHRINKFILE (N'webdataX_log' , 0, TRUNCATEONLY)
GO
--   6 MINUTES BACKUP THE DB AND LOGS, 4 MINUTES TO COPY OVER TO 08 TOTAL OF 10 MINUTES 
--   7 MINUTES TO RESTORE IN 08 AND SETUP THE MIRRORING.
--   TOTAL DURATION:  UNDER 20 MINUTES FOR WEBDATA DB + 28 MINUTES (UNDER 30) FOR THE INITIAL BACKUP RESTORATION FROM PRODUCTION
--   GRAND TOTAL FOR WEBDATA UNDER 50 MINUTES 
	use master 
	go
	BACKUP DATABASE WebData 
		TO  DISK = N'F:\TEMP\WebData_BU_Compressed.bak' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'WebData Database Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10

	BACKUP LOG WebData 
		TO  DISK = N'F:\TEMP\WebData_BU_Compressed.TRN' 
		WITH NOFORMAT, Checksum, INIT,  
		NAME = N'WebData LOG Backup', 
		SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
/*
10 percent processed.
20 percent processed.
30 percent processed.
40 percent processed.
50 percent processed.
60 percent processed.
70 percent processed.
80 percent processed.
90 percent processed.
Processed 13616792 pages for database 'WebData', file 'webdataX_dat' on file 1.
100 percent processed.
Processed 14 pages for database 'WebData', file 'webdataX_log' on file 1.
BACKUP DATABASE successfully processed 13616806 pages in 352.731 seconds (301.593 MB/sec).
select 352.731 / 60.00    =  5.878850 minutes 
27 percent processed.
81 percent processed.
100 percent processed.
Processed 59 pages for database 'WebData', file 'webdataX_log' on file 1.
BACKUP LOG successfully processed 59 pages in 0.021 seconds (21.833 MB/sec).
*/

-- webdata backup and restore from 07 to 08\\\\  duration = 8 minutes to backup and on 08 = 
-- =======================================================================

-- COPY THE FILES FROM C:\TEMP ON 07 TO C:\TEMP OF 08

-- NEXT: PROCEED WITH RESTORATIONS OF DB FULL AND LOG FILE. 
-- NEXT PROCEED WITH THE MIRRORING CONFIGURATION

-- STATUS OF MIRRORED DATABASES 
SELECT s.name, m.* FROM SYS.database_mirroring m join sys.databases s on s.database_id = m.database_id WHERE M.DATABASE_ID > 4 AND MIRRORING_GUID IS NOT NULL 




-- WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING 
--	IF MIRRORING STILL SHOWS 927 ERROR THEN RUN THE FOLLOWING 
--	MUST CONNECT TO 08 FIRST RUN THE FOLLOWING 
--  AND CHECK BACK BY REFRESHING THE DATABASES IN THE EXPLORER
ALTER DATABASE _TEST			SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE _ARCHIVES		SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE AgentResults		SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE bluscreen		SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE dba_admin		SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE dba_johne		SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE dbCheckList		SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE dbDone			SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE LossMitigation	SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE NCCI				SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE Reporting		SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE RPI				SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE Staging			SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;
ALTER DATABASE WebData			SET PARTNER = 'TCP://SQLSVR08.NATIONALCREDITORS.COM:5023' ;

-- CONNECT TO 07 AND RUN THE FOLLOWING 
ALTER DATABASE _TEST			SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE _ARCHIVES		SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE AgentResults		SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE bluscreen		SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE dba_admin		SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE dba_johne		SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE dbCheckList		SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE dbDone			SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE LossMitigation	SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE NCCI				SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE Reporting		SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE RPI				SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE Staging			SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;
ALTER DATABASE WebData			SET PARTNER = 'TCP://SQLSVR07.NATIONALCREDITORS.COM:5022' ;


-- GOT TO HAVE THIS TESTED :) 
-- SHUT DOWN THE SERVICES ON 07,CONNECT TO 08, OR STAY ON 08
USE MASTER
GO
ALTER DATABASE _TEST SET PARTNER OFF
GO
RESTORE DATABASE _TEST WITH RECOVERY 
