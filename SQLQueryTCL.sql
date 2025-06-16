CREATE DATABASE banks;

use banks;
CREATE TABLE Accounts (
  AccountID     INT            PRIMARY KEY,
  AccountHolder NVARCHAR(100)  NOT NULL,
  Balance       DECIMAL(15,2)  NOT NULL
);

CREATE TABLE TransactionLog (
  TransactionID INT            IDENTITY(1,1) PRIMARY KEY,
  FromAccount   INT            NULL  REFERENCES Accounts(AccountID),
  ToAccount     INT            NULL  REFERENCES Accounts(AccountID),
  Amount        DECIMAL(15,2)  NOT NULL,
  TxDate        DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
  Status        NVARCHAR(20)   NOT NULL  -- e.g. 'Pending','Committed','RolledBack'
);


INSERT INTO Accounts (AccountID, AccountHolder, Balance) VALUES
  (1, 'Alice Adams',   1000.00),
  (2, 'Bob Baker',     1500.00),
  (3, 'Carol Clark',   500.00),
  (4, 'David Dawson',  2000.00),
  (5, 'Eva Emerson',   250.00);

  --transfer $200 from alice account to bob's atomically.

BEGIN TRAN FUNDTRX

UPDATE Accounts SET Balance = Balance - 200
WHERE AccountID = 1

UPDATE Accounts SET Balance = Balance + 200
WHERE AccountID = 2

INSERT INTO TransactionLog (FromAccount, ToAccount, Amount, Status)
VALUES(1, 2, 200, 'Committed')

SELECT * FROM Accounts
SELECT * FROM TransactionLog

COMMIT TRAN FUNDTRX
END

--only allow transaction if senders account is sufficient for transfer

BEGIN TRAN SAFEXfer

DECLARE @SrcBal DECIMAL(15, 2);
SELECT @SrcBal = Balance
FROM Accounts  WHERE AccountID = 3;

IF @SrcBal < 300
BEGIN 
INSERT INTO TransactionLog (FromAccount, ToAccount, Amount, Status)
VALUES(3, 4, 300, 'ROLLBACK');
ROLLBACK TRAN SAFEXfer;
END
ELSE
BEGIN
UPDATE Accounts SET Balance -=300
WHERE AccountID = 3;
UPDATE Accounts SET Balance += 300
WHERE AccountID = 4;
INSERT INTO TransactionLog(FromAccount, ToAccount, Amount, Status)
VALUES(3, 4, 300, 'Commited');
COMMIT TRAN SAFEXfer;
END

--