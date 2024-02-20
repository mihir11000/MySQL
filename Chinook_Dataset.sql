-- Active: 1698730200540@@127.0.0.1@3306@chinook
"1 EXtracting the Individual Table"
SELECT * FROM customer;

"2 Extracting Column names from a particular Table name 'artist'."
select  ArtistId,Name
FROM
artist;

"3 Extracting Unique total entities in columns of Invoice Table"
select distinct BillingCity,BillingState
from invoice;

"4 Counting Unique total entities in City column of Customer Table"
select count (DISTINCT City)
from customer;

"5 Counting Unique total entities in City,State,Country column of Customer Table"
SELECT COUNT(DISTINCT City, State, Country) 
FROM customer;

"6 Selecting all InvoiveID & Unit Prices where Quantity is 1"
SELECT InvoiceId,UnitPrice
FROM invoiceline
WHERE quantity = 1;

"7.Counting all Customerid's where Country is India"
select count (DISTINCT CustomerID)
From customer
where Country = 'India';

"8. Extracting names whose country is India"
select FirstName,LastName
FROM customer
where Country = "India";

"9. Extracting names whose country is India and City is Banglore by using AND & OR operator"

select FirstName,LastName
FROM customer
where Country = "India" AND City = "Bangalore";

select FirstName,LastName
FROM customer
where Country = "India" OR City = "Bangalore";

select FirstName,LastName
FROM customer
where Country = "India" OR City = "Bangalore" AND "Delhi";

"10. Extracting Titles whose Artistid's except 50"
select Title
from albumm
where NOT ArtistId = 50;

"11. Counting of Albumid's where Total length of Album is less then 100000 `Milliseconds`"
select Composer
from track;

SELECT COUNT(AlbumId) 
FROM track
WHERE Milliseconds < 100000;

"12. Extracting Company Names whose are not located in Spain or Germany"
select company
from customer
where not country = "Spain" OR "Germany";

"13. Extracting `BillingState` from Invoice Table"
select distinct BillingState
from invoice;

select * from invoice;

"14. Selected All PlaylistId's and Trackid's from Playlisttrack Table which set in Descending Order of `TrackId`"
select playlistid,TrackId
from playlisttrack
ORDER BY TrackId DESC;

"15. Application of IS Null & Is NOT Null"

select CustomerID,Address
from customer
where PostalCode IS NOT NULL;

select Playlistid
from playlist
where Name IS NULL;

select * from Employee
where Title = "Sales Support Agent";

"16. OFFSET & LIMIT"

select CustomerId
from customer
where country = "France"
limit 3;


"17. Like & NOTLIKE Operator"

select * from Customer
where City like "a%";

select * from Customer
where City like "_msterdam";

select * from Customer
where City like "a%";

select * from customer
where City NOT LIKE "s%";

"17. MAX,MIN,AVG,SUM Operator"

select  max(ArtistId)
from artist;

select min(ArtistId)
from artist;

select avg(ArtistId)
from artist;

select sum(ArtistId)
from artist;

select count(ArtistId)
from artist;

"18. Delete the Records"

delete from playlist
where Name = "Music";

"19. Update the Records"

Update playlist
set Name = "LaLaLand"
where PlaylistId = "19";

delete from customer
where PostalCode = 70174;

"20. IN operator & NOT IN"

select * from customer
where country in("UK","France","Spain");

select * from invoice
where BillingCity in("Vancouver","Stuttgart","Copenhagen");

select * from track
where composer in("Angus Young, Malcolm Young, Brian Johnson");

select * from customer
where country NOT IN("Canada","Australia","Ireland");

select * from customer
where country in(select country from customer);

"21. Between operator with IN & Not IN"

select * from invoice
where Total between 1.00 and 5.00;

select * from invoice
where Total between 1.00 and 5.00
and BillingCity in("Redmond","Amsterdam","Stuttgart");

select * from invoice
where Total between 1.00 and 5.00
and BillingCity in(select BillingCity from invoice);

select * from invoiceline
where trackid not between 10 and 30
and invoiceid between 100 and 350
and trackid not in(2,4,6,8,10);

"22. INNER JOIN"

Select Name,Title
from Albumm
Inner join Artist
on Albumm.ArtistId = Artist.ArtistId;

Select InvoiceLineId,Bytes,Composer
from Invoiceline
INNER JOIN track
on Invoiceline.TrackId = Track.TrackId;

select Birthdate,Hiredate,SupportRepId
from employee
inner join customer
on employee.Country = customer.Country;

select name,Trackid
from playlisttrack
inner join playlist
on playlisttrack.playlistid = playlist.playlistid;

select Trackid,Name
from playlist
inner join playlisttrack
on playlist.playlistid = playlisttrack.playlistid;


SELECT Track.Milliseconds,Invoiceline.UnitPrice,Albumm.Title
FROM ((Track
INNER JOIN Invoiceline ON Track.TrackId = Invoiceline.TrackId)
INNER JOIN Albumm ON Track.AlbumId = Albumm.`ï»¿AlbumId`);


"23. LEFT JOIN"

select artist.name,albumm.title
from artist
left join albumm on artist.artistid = albumm.artistid;

select genre.name,track.bytes,track.composer,genre.genreid
from genre
LEFT JOIN track on genre.genreid = track.genreid;


select playlist.name,playlist.playlistid,playlisttrack.TrackId
from playlist
LEFT JOIN playlisttrack on playlist.playlistid = playlisttrack.playlistid;

select albumm.title,artist.name,track.Composer
from ((albumm
left join artist on albumm.artistid = artist.artistid)
left join track  on albumm.`ï»¿AlbumId` = track.albumid);

"24. RIGHT JOIN"

SELECT Mediatype.name,Track.unitprice,Track.genreid
from mediatype
right join track on mediatype.mediatypeid = track.mediatypeid;

select distinct invoice.billingaddress,invoice.billingpostalcode,customer.company
from invoice
right join customer on invoice.customerid = customer.customerid;

select distinct track.albumid,track.composer,track.bytes,playlisttrack.playlistid,genre.name
from ((track
right join playlisttrack on track.trackid = playlisttrack.trackid)
right join genre on track.genreid = genre.genreid);

"25. CROSS JOIN"

select invoiceline.invoiceid,invoice.billingpostalcode
from invoiceline
cross join invoice;

select playlist.playlistid,employee.title
from playlist
cross join employee;


select playlisttrack.playlistid,playlisttrack.trackid,playlist.name
from playlisttrack
cross join playlist
where playlisttrack.playlistid = playlist.playlistid;

"26. Union & Union All"

SELECT City FROM Customer
UNION
SELECT City FROM Employee;

SELECT City FROM Customer
UNION ALL
SELECT City FROM Employee;

SELECT City, Country FROM Customer
WHERE Country='Germany'
UNION
SELECT City, Country FROM Employee
WHERE Country='Germany'
ORDER BY City;

SELECT City, Country FROM Customer
WHERE Country='Spain'
UNION ALL
SELECT City, Country FROM Employee
WHERE Country='Spain';

SELECT 'SuppourtRepId' AS Type,City, Country
FROM Customer
UNION
SELECT 'ReportsTo',City, Country
FROM Employee;


"27. Group By"

SELECT COUNT(CustomerID), Country
FROM Customer
GROUP BY Country;

SELECT COUNT(CustomerID), Country
FROM Customer
GROUP BY Country
ORDER BY COUNT(CustomerID) ASC;

"28. Having"

SELECT COUNT(CustomerID),Country
FROM Customer
GROUP BY Country
HAVING COUNT(CustomerID) > 5;


SELECT COUNT(CustomerID),Country
FROM Customer
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) ASC;













































