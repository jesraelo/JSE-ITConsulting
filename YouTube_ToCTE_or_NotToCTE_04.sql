

use _Sandbox 
go

-- Create an Employee table.
CREATE TABLE dbo.MyEmployees
(
	EmployeeID SMALLINT NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(40) NOT NULL,
	Title NVARCHAR(50) NOT NULL,
	DeptID SMALLINT NOT NULL,
	ManagerID SMALLINT NULL,
	CONSTRAINT PK_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID ASC),
	CONSTRAINT FK_MyEmployees_ManagerID_EmployeeID FOREIGN KEY (ManagerID) REFERENCES dbo.MyEmployees (EmployeeID)
);


-- Populate the table with values.
INSERT INTO dbo.MyEmployees VALUES
			 (1, N'Ken', N'S�nchez', N'Chief Executive Officer',16, NULL)
			,(273, N'Brian', N'Welcker', N'Vice President of Sales', 3, 1)
			,(274, N'Stephen', N'Jiang', N'North American Sales Manager', 3, 273)
			,(275, N'Michael', N'Blythe', N'Sales Representative', 3, 274)
			,(276, N'Linda', N'Mitchell', N'Sales Representative', 3, 274)
			,(285, N'Syed', N'Abbas', N'Pacific Sales Manager', 3, 273)
			,(286, N'Lynn', N'Tsoflias', N'Sales Representative', 3, 285)
			,(16, N'David', N'Bradley', N'Marketing Manager', 4, 273)
			,(23, N'Mary', N'Gibson', N'Marketing Specialist', 4, 16);



WITH DirectReports(DeptID, ManagerID, EmployeeID, firstname, lastname, Title, EmployeeLevel) AS
(
    SELECT DeptID, ManagerID, EmployeeID, firstname, lastname, Title, 0 AS EmployeeLevel
    FROM dbo.MyEmployees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.DeptID, e.ManagerID, e.EmployeeID, e.firstname, e.lastname, e.Title, EmployeeLevel + 1
    FROM dbo.MyEmployees AS e
        INNER JOIN DirectReports AS d
        ON e.ManagerID = d.EmployeeID
)
SELECT DeptID, ManagerID, EmployeeID, firstname, lastname, Title, EmployeeLevel
FROM DirectReports
ORDER BY ManagerID;


drop table MyEmployees


Employee
Lead
Supervisor
Manager
Director
Regional Director
Vice President
President
CEO
COO
CFO
