
DROP TABLE IF EXISTS Trnsctn;
DROP TABLE IF EXISTS Process_Account;
DROP TABLE IF EXISTS Asmbly_Account;
DROP TABLE IF EXISTS Department_Account;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Fit_Job;
DROP TABLE IF EXISTS Cut_Job;
DROP TABLE IF EXISTS Paint_Job;
DROP TABLE IF EXISTS Job;
DROP TABLE IF EXISTS Manufactured;
DROP TABLE IF EXISTS Paint_Process;
DROP TABLE IF EXISTS Cut_Process;
DROP TABLE IF EXISTS Fit_Process;
DROP TABLE IF EXISTS Process;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Asmbly;
DROP TABLE IF ExISTS Customer;




DROP INDEX IF EXISTS prcs_act_ind_pid ON Process_Account;
DROP INDEX IF EXISTS asmbly_act_ind_asmblyid ON Asmbly_Account;
DROP INDEX IF EXISTS dpt_act_ind_dpno ON Department_Account;
DROP INDEX IF EXISTS job_ind_pid_edate ON Job;
DROP INDEX IF EXISTS job_ind_asmblyid ON Job;
DROP INDEX IF EXISTS process_ind_dptno ON Process;
DROP INDEX IF EXISTS customer_ind_category ON Customer;



CREATE TABLE Customer (
    cust_name VARCHAR(20),
    cust_address VARCHAR(120) NOT NULL,
    category INT,

    CONSTRAINT chk_category CHECK (category BETWEEN 1 and 10),
    CONSTRAINT PK_customer PRIMARY KEY (cust_name)
    
)

CREATE TABLE Asmbly(
    asmbly_id VARCHAR(10),
    date_ordrd  DATE NOT NULL,
    asmbly_dtls VARCHAR(100) ,
    cust_name VARCHAR(20),
    CONSTRAINT PK_asmbly
        PRIMARY KEY(asmbly_id),
    CONSTRAINT FK_asmbly_cust_name FOREIGN KEY (cust_name)
        REFERENCES Customer(cust_name)
)

CREATE TABLE Department(
    department_no  VARCHAR(10),
    department_data VARCHAR(100) ,
    CONSTRAINT PK_dpt
        PRIMARY KEY(department_no)
)

CREATE TABLE Process(
    process_id VARCHAR(10),
    process_data VARCHAR(100),
    department_no VARCHAR(10),

    CONSTRAINT PK_prcs
        PRIMARY KEY(process_id),
    CONSTRAINT FK_prcs_dpno
        FOREIGN KEY(department_no) 
            REFERENCES Department(department_no)
)

CREATE TABLE Fit_Process(
    process_id VARCHAR(10),
    fit_type VARCHAR(10) NOT NULL,
    CONSTRAINT PK_FK_fit_prcs
        PRIMARY KEY(process_id) ,
        FOREIGN KEY(process_id) REFERENCES Process(process_id)
)

CREATE TABLE Cut_Process(
    process_id VARCHAR(10),
    cutting_type VARCHAR(10) NOT NULL,
    machine_type VARCHAR(10) NOT NULL,

    CONSTRAINT PK_FK_cut_prcs
        PRIMARY KEY(process_id) ,
        FOREIGN KEY(process_id) REFERENCES Process(process_id)
)

CREATE TABLE Paint_Process(
    process_id VARCHAR(10),
    paint_type VARCHAR(10) NOT NULL,
    painting_method VARCHAR(10) NOT NULL,
    
    CONSTRAINT PK_FK_paint_prcs
        PRIMARY KEY(process_id) ,
        FOREIGN KEY(process_id) REFERENCES Process(process_id)
)

CREATE TABLE Manufactured(
    asmbly_id VARCHAR(10) FOREIGN KEY REFERENCES Asmbly(asmbly_id),
    process_id VARCHAR(10) FOREIGN KEY REFERENCES Process(process_id),
    CONSTRAINT PK_mnf
        PRIMARY KEY(asmbly_id,process_id),
    
)

CREATE TABLE Job(
    job_no INT,
    job_start_date DATE NOT NULL,
    job_end_date DATE ,
    asmbly_id VARCHAR(10) NOT NULL,
    process_id VARCHAR(10) NOT NULL,

    CONSTRAINT Pk_Job
        PRIMARY KEY(job_no),
    CONSTRAINT FK_Job
        FOREIGN KEY(asmbly_id,process_id) REFERENCES Manufactured(asmbly_id,process_id),
    CONSTRAINT chk_date
        CHECK(job_end_date>=job_start_date)
)

CREATE TABLE Paint_Job(
    job_no INT,
    color  VARCHAR(10) NOT NULL,
    volume REAL DEFAULT 0,
    labor_time INT DEFAULT 0,

    CONSTRAINT PK_FK_paint_job
        PRIMARY KEY(job_no),
        FOREIGN KEY (job_no) REFERENCES Job(job_no)
)

CREATE TABLE Cut_Job(
    job_no INT,
    machine_type VARCHAR(10) NOT NULL,
    machine_time INT DEFAULT 0,
    labor_time INT DEFAULT 0,
    material VARCHAR(20) NOT NULL,
    CONSTRAINT PK_FK_cut_job
        PRIMARY KEY(job_no),
        FOREIGN KEY (job_no) REFERENCES Job(job_no)
)

CREATE TABLE Fit_Job(
    job_no INT,
    labor_time INT DEFAULT 0,
    CONSTRAINT PK_FK_fit_job
        PRIMARY KEY(job_no),
        FOREIGN KEY (job_no) REFERENCES Job(job_no)
)
CREATE TABLE Account(
    account_no VARCHAR(10) PRIMARY KEY,
    account_start_date DATE NOT NULL,
)


CREATE TABLE Department_Account(
    account_no VARCHAR(10),
    details_2 REAL DEFAULT 0,
    department_no VARCHAR(10) UNIQUE NOT NULL,

    CONSTRAINT PK_FK_dpt_act
        PRIMARY KEY(account_no),
        FOREIGN KEY(account_no) REFERENCES Account(account_no),
    CONSTRAINT FK_dpt_act_dpno
        FOREIGN KEY (department_no) 
            REFERENCES Department(department_no),

)


CREATE TABLE Asmbly_Account(
    account_no VARCHAR(10) ,
    details_1 REAL DEFAULT 0,
    asmbly_id VARCHAR(10) UNIQUE NOT NULL,

    CONSTRAINT PK_FK_asm_act
        PRIMARY KEY(account_no),
        FOREIGN KEY(account_no) REFERENCES Account(account_no),
    CONSTRAINT FK_asm_act_asmid
        FOREIGN KEY (asmbly_id) 
            REFERENCES Asmbly(asmbly_id)

)

CREATE TABLE Process_Account(
    account_no VARCHAR(10),
    details_3 REAL DEFAULT 0,
    process_id VARCHAR(10) UNIQUE NOT NULL,

    CONSTRAINT PK_FK_prcs_act
        PRIMARY KEY(account_no),
        FOREIGN KEY(account_no) REFERENCES Account(account_no),
    CONSTRAINT FK_prcs_act_prcid
        FOREIGN KEY (process_id) 
            REFERENCES Process(process_id)
)

CREATE TABLE Trnsctn(
    transaction_no VARCHAR(20),
    sup_cost REAL NOT NULL DEFAULT 0,
    job_no INT NOT NULL,
    dep_acno VARCHAR(10) ,
    asmb_acno VARCHAR(10) ,
    prcs_acno VARCHAR(10) ,

    CONSTRAINT PK_trns
        PRIMARY KEY(transaction_no),

    CONSTRAINT FK_trns_dep_acno
        FOREIGN KEY(dep_acno)
            REFERENCES Department_Account(account_no),

    CONSTRAINT FK_trns_asmb_acno
        FOREIGN KEY(asmb_acno)
            REFERENCES Asmbly_Account(account_no),

    CONSTRAINT FK_trns_procs_acno
        FOREIGN KEY (prcs_acno)
            REFERENCES Process_Account(account_no)
)


CREATE INDEX  customer_ind_category ON Customer(category);
CREATE INDEX  process_ind_dptno ON Process(department_no);
CREATE INDEX job_ind_asmblyid ON Job(asmbly_id);
CREATE INDEX job_ind_pid_edate ON Job(job_end_date,process_id);
CREATE INDEX dpt_act_ind_dpno ON Department_Account(department_no);
CREATE INDEX asmbly_act_ind_asmblyid ON Asmbly_Account(asmbly_id);
CREATE INDEX prcs_act_ind_pid ON Process_Account(process_id);


