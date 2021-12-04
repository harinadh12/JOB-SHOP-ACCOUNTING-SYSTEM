DROP PROCEDURE IF EXISTS qproc_1;
DROP PROCEDURE IF EXISTS qproc_2;
DROP PROCEDURE IF EXISTS qproc_3;
DROP PROCEDURE IF EXISTS qproc_3_1;
DROP PROCEDURE IF EXISTS qproc_3_2;
DROP PROCEDURE IF EXISTS qproc_3_3;
DROP PROCEDURE IF EXISTS qproc_4;
DROP PROCEDURE IF EXISTS qproc_4_1;
DROP PROCEDURE IF EXISTS qproc_5;
DROP PROCEDURE IF EXISTS qproc_5_1;
DROP PROCEDURE IF EXISTS qproc_5_2;
DROP PROCEDURE IF EXISTS qproc_5_3;
DROP PROCEDURE IF EXISTS qproc_6;
DROP PROCEDURE IF EXISTS qproc_7;
DROP PROCEDURE IF EXISTS qproc_7_1;
DROP PROCEDURE IF EXISTS qproc_7_2;
DROP PROCEDURE IF EXISTS qproc_7_3;
DROP PROCEDURE IF EXISTS qproc_8;
DROP PROCEDURE IF EXISTS qproc_9;
DROP PROCEDURE IF EXISTS qproc_10;
DROP PROCEDURE IF EXISTS qproc_11;
DROP PROCEDURE IF EXISTS qproc_12_1;
DROP PROCEDURE IF EXISTS qproc_12_2;
DROP PROCEDURE IF EXISTS qproc_12_3;
DROP PROCEDURE IF EXISTS qproc_13;
DROP PROCEDURE IF EXISTS qproc_14;
DROP PROCEDURE IF EXISTS qproc_15;

GO 
    CREATE PROCEDURE qproc_1
        @cust_name VARCHAR(20),
        @cust_address VARCHAR(100),
        @category INT
        AS
            BEGIN 
                INSERT INTO Customer (
                    [cust_name],[cust_address],[category]
                )        
                VALUES(
                    @cust_name,@cust_address,@category
                )
            END 

GO 
    CREATE PROCEDURE qproc_2
        @department_no VARCHAR(10),
        @department_data VARCHAR(100)
        AS
            BEGIN 
                INSERT INTO Department (
                    [department_no],[department_data]
                )        
                VALUES(
                    @department_no,@department_data
                )

            END 


GO 
    CREATE PROCEDURE qproc_3
        @process_id VARCHAR(10),
        @process_data VARCHAR(100),
        @department_no VARCHAR(10)
        AS
            BEGIN 
                INSERT INTO Process(
                    [process_id],[process_data],[department_no]
                )        
                VALUES(
                    @process_id, @process_data, @department_no
                )

            END 




GO 
    CREATE PROCEDURE qproc_3_1
        @process_id VARCHAR(10),
        @fit_type VARCHAR(10)
        AS
            BEGIN 
                INSERT INTO Fit_Process (
                    [process_id],[fit_type]
                )        
                VALUES(
                    @process_id, @fit_type
                )

            END 

GO 
    CREATE PROCEDURE qproc_3_3
        @process_id VARCHAR(10),
        @cutting_type VARCHAR(10),
        @machine_type VARCHAR(10)
        AS
            BEGIN 
                INSERT INTO Cut_Process (
                    [process_id],[cutting_type],[machine_type]
                )        
                VALUES(
                    @process_id, @cutting_type,@machine_type
                )

            END 



GO 
    CREATE PROCEDURE qproc_3_2
        @process_id VARCHAR(10),
        @paint_type VARCHAR(10),
        @painting_method VARCHAR(10)
        AS
            BEGIN 
                INSERT INTO Paint_Process (
                    [process_id],[paint_type],[painting_method]
                )        
                VALUES(
                    @process_id, @paint_type, @painting_method
                )

            END 



GO 
    CREATE PROCEDURE qproc_4
        @asmbly_id VARCHAR(10),
        @date_ordrd VARCHAR(10),
        @asmbly_dtls VARCHAR(100),
        @cust_name VARCHAR(20)
        AS
            BEGIN 
                INSERT INTO Asmbly (
                    [asmbly_id],[date_ordrd],[asmbly_dtls],[cust_name]
                )        
                VALUES(
                    @asmbly_id, CAST(@date_ordrd AS DATE),@asmbly_dtls,@cust_name
                )

            END 


GO 
    CREATE PROCEDURE qproc_4_1
        @asmbly_id VARCHAR(10),
        @process_id VARCHAR(10)
        AS
            BEGIN 
                INSERT INTO Manufactured (
                    [asmbly_id],[process_id]
                )        
                VALUES(
                    @asmbly_id, @process_id
                )

            END 




GO 
    CREATE PROCEDURE qproc_5
        @account_no VARCHAR(10),
        @account_start_date VARCHAR(10)
        
        AS
            BEGIN 
                INSERT INTO Account(
                    [account_no],[account_start_date]
                )        
                VALUES(
                    @account_no, cast(@account_start_date as DATE)
                )

            END 




GO 
    CREATE PROCEDURE qproc_5_1
        @account_no VARCHAR(10),
        -- @details_2 REAL,
        @department_no VARCHAR(10)
    
        AS
            BEGIN 
                INSERT INTO Department_Account (
                    [account_no],[department_no]
                )        
                VALUES(
                    @account_no, @department_no   
                )

            END 



GO 
    CREATE PROCEDURE qproc_5_2
        @account_no VARCHAR(10),
        -- @account_start_date VARCHAR(10),
        -- @details_1 REAL,
        @asmbly_id VARCHAR(10)
    
        AS
            BEGIN 
                INSERT INTO Asmbly_Account (
                    [account_no],[asmbly_id]
                )        
                VALUES(
                    @account_no, @asmbly_id 
                )

            END 


GO 
    CREATE PROCEDURE qproc_5_3
        @account_no VARCHAR(10),
        -- @account_start_date VARCHAR(10),
        -- @details_3 REAL,
        @process_id VARCHAR(10)
    
        AS
            BEGIN 
                INSERT INTO Process_Account (
                    [account_no],[process_id]
                )        
                VALUES(
                    @account_no, @process_id
                )

            END 


GO 
    CREATE PROCEDURE qproc_6
        @job_no VARCHAR(10),
        @job_start_date VARCHAR(10),
        @asmbly_id VARCHAR(10),
        @process_id VARCHAR(10)
    
        AS
            BEGIN 
                INSERT INTO Job (
                    [job_no],[job_start_date],[asmbly_id],[process_id]
                )        
                VALUES(
                    @job_no, CAST(@job_start_date AS DATE), @asmbly_id, @process_id
                )

            END 


GO 
    CREATE PROCEDURE qproc_7
        @job_no VARCHAR(10),
        @job_end_date VARCHAR(10)
    
        AS
            BEGIN 
                UPDATE Job 
                    SET job_end_date = CAST(@job_end_date AS DATE)
                        WHERE job_no = @job_no
                   
            END 


GO 
    CREATE PROCEDURE qproc_7_1
        @job_no VARCHAR(10),
        @labor_time INT
    
        AS
            BEGIN 
                INSERT INTO Fit_Job (
                    [job_no],[labor_time]
                )        
                VALUES(
                    @job_no, @labor_time
                )

            END 


GO 
    CREATE PROCEDURE qproc_7_2
        @job_no VARCHAR(10),
        @labor_time INT,
        @color VARCHAR(10),
        @volume REAL
    
        AS
            BEGIN 
                INSERT INTO Paint_Job (
                    [job_no],[labor_time],[color],[volume]
                )        
                VALUES(
                    @job_no, @labor_time , @color, @volume    
                )

            END 


GO 
    CREATE PROCEDURE qproc_7_3
        @job_no VARCHAR(10),
        @machine_type VARCHAR(10),
        @machine_time INT,
        @labor_time INT,
        @material VARCHAR(20)
    
        AS
            BEGIN 
                INSERT INTO Cut_Job (
                    [job_no],[machine_type],[machine_time],[labor_time],[material]
                )        
                VALUES(
                    @job_no, @machine_type, @machine_time, @labor_time, @material    
                )

            END 




GO 
    CREATE PROCEDURE qproc_8
        @transaction_no VARCHAR(20),
        @sup_cost REAL,
        @job_no VARCHAR(10)     
              
        AS
            BEGIN 
                DECLARE @dep_acno VARCHAR(10),
                        @asmb_acno VARCHAR(10),
                        @prcs_acno VARCHAR(10)

                SET @dep_acno = (SELECT account_no FROM Department_Account,Process, Job
                                    WHERE Job.job_no = @job_no and 
                                            Department_Account.department_no = Process.department_no and 
                                                Process.process_id = Job.process_id);
                
                SET @asmb_acno = (SELECT account_no FROM Asmbly_Account, Job
                                    WHERE Job.job_no = @job_no and Asmbly_Account.asmbly_id = Job.asmbly_id);
                
                SET @prcs_acno = (SELECT account_no FROM Process_Account, Job
                                    WHERE Job.job_no = @job_no and Process_Account.process_id = Job.process_id);
                
                                
                INSERT INTO Trnsctn (
                    [transaction_no],[sup_cost],[job_no],[dep_acno],[asmb_acno],[prcs_acno]
                )        
                VALUES(
                    @transaction_no, @sup_cost, @job_no, @dep_acno,@asmb_acno,@prcs_acno
                )

                UPDATE Department_Account 
                    SET details_2 = details_2 + @sup_cost
                    WHERE account_no = @dep_acno

                UPDATE Asmbly_Account
                    SET details_1 = details_1 + @sup_cost
                    WHERE account_no = @asmb_acno

                UPDATE Process_Account
                    SET details_3 = details_3 + @sup_cost
                    WHERE account_no = @prcs_acno

            END 


GO
    CREATE PROCEDURE qproc_9
        @asmbly_id VARCHAR(10)
        AS
        BEGIN 
            SELECT details_1 from Asmbly_Account
                WHERE Asmbly_Account.asmbly_id = @asmbly_id
        
        END 

GO
    CREATE PROCEDURE qproc_10
        @department_no VARCHAR(10),
        @job_end_date VARCHAR(10)
            
        AS
        BEGIN 
            DECLARE @fit_labr_time   INT,
                    @cut_labr_time   INT,
                    @paint_labr_time INT,
                    @total_labr_time INT;

            SET @fit_labr_time = (SELECT labor_time from Fit_Job  
                                    WHERE Fit_Job.job_no in (
                                        SELECT distinct(job_no) from Job 
                                            WHERE Job.process_id in (SELECT distinct(process_id) FROM Process
                                                                        WHERE Process.department_no = @department_no) and 
                                                                    Job.job_end_date = cast(@job_end_date As date)
                                    )
                                    
                                );
            
            SET @cut_labr_time = ( SELECT labor_time from Cut_Job  
                                    WHERE Cut_Job.job_no in (
                                        SELECT distinct(job_no) from Job 
                                            WHERE Job.process_id in (SELECT distinct(process_id) FROM Process
                                                                        WHERE Process.department_no = @department_no) and 
                                                                    Job.job_end_date = cast(@job_end_date As date)
                                    )
                                    
                                );

            SET @paint_labr_time = ( SELECT labor_time from Paint_Job  
                                    WHERE Paint_Job.job_no in (
                                        SELECT distinct(job_no) from Job 
                                            WHERE Job.process_id in (SELECT distinct(process_id) FROM Process
                                                                        WHERE Process.department_no = @department_no) and 
                                                                    Job.job_end_date = cast(@job_end_date As date)
                                    )
                                    
                                );

            IF @fit_labr_time IS NULL SET @fit_labr_time = 0;
            IF @cut_labr_time IS NULL SET @cut_labr_time = 0;
            IF @paint_labr_time IS NULL SET @paint_labr_time = 0;


            SET @total_labr_time = @fit_labr_time + @cut_labr_time + @paint_labr_time;
            SELECT @total_labr_time;

        END 


GO
    CREATE PROCEDURE qproc_11
        @asmbly_id VARCHAR(10)
        AS
        BEGIN 
            SELECT Job.process_id, Process.department_no, Job.job_start_date
                FROM Job, Process
                WHERE Job.asmbly_id = @asmbly_id AND Process.process_id = Job.process_id ORDER BY Job.job_start_date;

        END 
      
GO
    CREATE PROCEDURE qproc_12_1
        @job_end_date VARCHAR(10),
        @department_no VARCHAR(10)

        AS
        BEGIN
            SELECT DISTINCT(Job.job_no), Job.asmbly_id, Fit_Job.labor_time
                FROM Job, Fit_Job
                WHERE Job.job_end_date = cast(@job_end_date AS DATE) and Job.process_id in 
                (SELECT Process.process_id FROM Process, Department 
                    WHERE Process.department_no = Department.department_no)
                AND Job.job_no = fit_Job.job_no
                    
        END
        


GO
    CREATE PROCEDURE qproc_12_2
        @job_end_date VARCHAR(10),
        @department_no VARCHAR(10)

        AS
        BEGIN
            SELECT DISTINCT(Job.job_no), Job.asmbly_id, Paint_Job.color, Paint_Job.volume, Paint_Job.labor_time
                FROM Job, Paint_Job
                WHERE Job.job_end_date = cast(@job_end_date  AS DATE)
                AND Job.process_id 
                IN  (SELECT Process.process_id FROM Process, Department 
                        WHERE Process.department_no = Department.department_no)
                AND Job.job_no = Paint_Job.job_no
                    
        END
      

GO
    CREATE PROCEDURE qproc_12_3
        @job_end_date VARCHAR(10),
        @department_no VARCHAR(10)

        AS
        BEGIN 
            SELECT DISTINCT(Job.job_no), Job.asmbly_id, Cut_Job.machine_type, Cut_Job.machine_time, Cut_Job.material, Cut_Job.labor_time
                FROM Job, Cut_Job
                WHERE Job.job_end_date = cast(@job_end_date AS DATE) and Job.process_id in 
                (SELECT Process.process_id FROM Process, Department 
                    WHERE Process.department_no = Department.department_no)
                AND Job.job_no = Cut_Job.job_no
                    
        END 




GO
    CREATE PROCEDURE qproc_13
        @clower INT,
        @cupper INT

        AS
        BEGIN 
           SELECT * FROM Customer
           WHERE category >=@clower AND category<=@cupper
           ORDER BY cust_name
                    
        END 
       

GO
    CREATE PROCEDURE qproc_14
        @jno_lower INT,
        @jno_upper INT

        AS
        BEGIN 
           DELETE FROM Cut_Job WHERE job_no >=@jno_lower AND job_no <= @jno_upper
                    
        END 
   
    
GO
    CREATE PROCEDURE qproc_15
        @job_no INT,
        @color VARCHAR(10)

        AS
        BEGIN 
           UPDATE Paint_Job SET color = @color WHERE job_no = @job_no
                    
        END 
  



