
CREATE TABLE Transactions(
Sender_ID  int NOT NULL,
Receiver_ID int NOT NULL ,
Amount int NOT NULL ,
Transaction_Date text NOT NULL)


INSERT INTO Transactions (Sender_ID  , Receiver_ID,  Amount, Transaction_Date)
VALUES('55', '22', '500', '18-05-2021');
INSERT INTO Transactions (Sender_ID  , Receiver_ID,  Amount, Transaction_Date)
VALUES('11',	'33',	'350',	'19-05-2021');
INSERT INTO Transactions (Sender_ID  , Receiver_ID,  Amount, Transaction_Date)
VALUES('22',	'11',	'650',	'19-05-2021');
INSERT INTO Transactions (Sender_ID  , Receiver_ID,  Amount, Transaction_Date)
VALUES('22',	'33',	'900',	'20-05-2021');
INSERT INTO Transactions (Sender_ID  , Receiver_ID,  Amount, Transaction_Date)
VALUES('33',	'11',	'500',	'21-05-2021');
INSERT INTO Transactions (Sender_ID  , Receiver_ID,  Amount, Transaction_Date)
VALUES('33',	'22',	'750',	'21-05-2021');
INSERT INTO Transactions (Sender_ID  , Receiver_ID,  Amount, Transaction_Date)
VALUES('11',	'44',	'300',	'22-05-2021');       


select Sender_ID, SUM (Amount) As Sender
from Transactions
group by Sender_ID;

select Receiver_ID, SUM (Amount) As Receiver
from Transactions
group by Receiver_ID


SELECT COALESCE(S.Sender_ID, R.Receiver_Id) AS Acount_ID ,(COALESCE(R.Receiver,0)-COALESCE(S.Sender,0)) AS Net_Change
FROM  (select Sender_ID, SUM (Amount) As Sender from Transactions group by Sender_ID) AS S
FULL OUTER JOIN  (select Receiver_ID, SUM (Amount) As Receiver from Transactions group by Receiver_ID) AS R On S.Sender_ID=R.Receiver_ID
Order BY Net_Change DESC;
