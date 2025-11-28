 select  run_duration, RIGHT(STUFF(STUFF(REPLACE(STR(run_duration,7,0),' ','0'),4,0,':'),7,0,':'),8) Duration,run_time, 
					 RIGHT(STUFF(STUFF(REPLACE(STR(run_time,7,0),' ','0'),4,0,':'),7,0,':'),8)  RunTime, j.[name] JobName, H.job_id, step_id, step_name, Run_Date ,
					 RIGHT(STUFF(STUFF(STR(run_date,8,0),5,0,'-'),8,0,'-'),10) RunDate ,
					 SS.[name] JobScheduleInfo,
					 (CASE SS.[enabled]  WHEN 0 THEN 'Disabled' ELSE 'Enabled' END) JobStatus
	FROM 
		msdb.dbo.sysjobhistory H 
		JOIN msdb.dbo.sysjobs J ON h.job_id = j.job_id 
		JOIN msdb.dbo.sysjobschedules S ON S.job_id = j.job_id
		JOIN msdb.dbo.sysschedules SS ON SS.schedule_id = S.schedule_id 
		where 
			step_name <> '(job outcome)'  -- AND (CASE SS.[enabled]  WHEN 0 THEN 'Disabled' ELSE 'Enabled' END) LIKE '%fail%'
			--J.name LIKE '%ecomm%' AND 
			--CONVERT(VARCHAR(10), run_date,112) BETWEEN '2024' AND '2024'
			and j.[name] not like '%LSBackup%' and j.name not like '%views_monitor%'
			and j.name like '%_update_scorecards%'
			--and run_duration > 3000
			--and run_date = '20251116'
		--ORDER BY JobName, Run_Time, step_id, run_date Desc, H.job_id
		order by run_date desc  , run_time desc 
