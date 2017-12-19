-- Drop database if it exists
drop user ersuser cascade;

-- Create database
create user ersuser
identified by p4ssw0rd
default tablespace users
temporary tablespace temp
quota 10M on users;

grant connect to ersuser;
grant resource to ersuser;
grant create session to ersuser;
grant create table to ersuser;
grant create view to ersuser;

conn ersuser/p4ssw0rd

create table Employee (
	EmployeeID number not null,
	FirstName varchar2(50),
	LastName varchar2(50),
	ManagerID number,
	EmailAddress varchar2(50),
	Password varchar2(64),
	EmployeeType varchar2(20),
	constraint PK_Employee primary key (EmployeeID),
	constraint UNIQUE_EmailAddress UNIQUE (EmailAddress)
);

create table Reimbursement (
	ReimbursementID number not null,
	Amount number(10, 2),
	EmployeeID number,
	ManagerID number,
	Justification varchar2(500),
	Approved number(1),
	constraint PK_Reimbursement primary key (ReimbursementID),
	constraint CHECK_Amount check (Amount > 0)
);

alter table Employee add constraint FK_Employee_ManagerID
	foreign key (ManagerID) references Employee (EmployeeID);

alter table Reimbursement add constraint FK_Reimbursement_EmployeeID
	foreign key (EmployeeID) references Employee (EmployeeID);

alter table Reimbursement add constraint FK_Reimbursement_ManagerID
	foreign key (ManagerID) references Employee (EmployeeID);

-- fill database with employee data from mockaroo.com - the realistic data generator
-- managerid and password fields are left empty
insert into Employee (employeeid, firstname, lastname, emailaddress) values (1, 'Audrye', 'Natwick', 'anatwick0@house.gov');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (2, 'Myrilla', 'Castelin', 'mcastelin1@answers.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (3, 'Flossie', 'Bragger', 'fbragger2@dailymotion.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (4, 'Candy', 'Durtnall', 'cdurtnall3@istockphoto.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (5, 'Aguie', 'O''Hanlon', 'aohanlon4@jiathis.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (6, 'Morganica', 'ffrench Beytagh', 'mffrenchbeytagh5@webeden.co.uk');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (7, 'Benoit', 'Innott', 'binnott6@washington.edu');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (8, 'Charmion', 'Rookledge', 'crookledge7@nba.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (9, 'Willard', 'Treadwell', 'wtreadwell8@geocities.jp');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (10, 'Carla', 'Ouldcott', 'couldcott9@nature.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (11, 'Isaak', 'Gronaller', 'igronallera@pagesperso-orange.fr');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (12, 'Rey', 'Rotlauf', 'rrotlaufb@eventbrite.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (13, 'Mabelle', 'Krienke', 'mkrienkec@unicef.org');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (14, 'Kevin', 'Winskill', 'kwinskilld@furl.net');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (15, 'Eolanda', 'Schall', 'eschalle@engadget.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (16, 'Marthena', 'McRobb', 'mmcrobbf@soundcloud.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (17, 'Leilah', 'Pourvoieur', 'lpourvoieurg@symantec.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (18, 'Alana', 'Lesmonde', 'alesmondeh@facebook.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (19, 'Tommie', 'Doree', 'tdoreei@goo.gl');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (20, 'Florella', 'Langstone', 'flangstonej@whitehouse.gov');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (21, 'Taite', 'Grocock', 'tgrocockk@ebay.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (22, 'Dave', 'Prover', 'dproverl@blinklist.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (23, 'Myra', 'Skpsey', 'mskpseym@eepurl.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (24, 'Zorana', 'Eustanch', 'zeustanchn@miibeian.gov.cn');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (25, 'Reynolds', 'Laughnan', 'rlaughnano@google.pl');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (26, 'Victor', 'Grabeham', 'vgrabehamp@blogspot.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (27, 'Franklin', 'Speere', 'fspeereq@godaddy.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (28, 'Fransisco', 'Martine', 'fmartiner@wiley.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (29, 'Adrian', 'Thomazet', 'athomazets@techcrunch.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (30, 'Arlee', 'Gerrens', 'agerrenst@ocn.ne.jp');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (31, 'Orton', 'McClaurie', 'omcclaurieu@posterous.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (32, 'Carin', 'Mancell', 'cmancellv@ning.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (33, 'Emili', 'Allabarton', 'eallabartonw@angelfire.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (34, 'Dorothee', 'Haet', 'dhaetx@ted.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (35, 'Marge', 'Getcliff', 'mgetcliffy@ustream.tv');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (36, 'Selig', 'Collie', 'scolliez@discovery.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (37, 'Vincents', 'Derdes', 'vderdes10@nifty.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (38, 'Jillana', 'Fell', 'jfell11@tinypic.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (39, 'Thacher', 'Beaufoy', 'tbeaufoy12@discuz.net');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (40, 'Hodge', 'Lamperti', 'hlamperti13@phpbb.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (41, 'Wendie', 'Bettlestone', 'wbettlestone14@squidoo.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (42, 'Cicely', 'Pool', 'cpool15@blog.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (43, 'Torin', 'Desborough', 'tdesborough16@zimbio.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (44, 'Ainslie', 'Aitken', 'aaitken17@latimes.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (45, 'Rob', 'Hodge', 'rhodge18@craigslist.org');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (46, 'Thacher', 'Hearne', 'thearne19@so-net.ne.jp');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (47, 'Mellie', 'Iacovazzi', 'miacovazzi1a@deliciousdays.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (48, 'Meara', 'McAuslan', 'mmcauslan1b@amazon.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (49, 'Lynette', 'Rudyard', 'lrudyard1c@loc.gov');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (50, 'Nike', 'Lynett', 'nlynett1d@sfgate.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (51, 'Desi', 'Whyteman', 'dwhyteman1e@census.gov');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (52, 'Mitchel', 'Scandrick', 'mscandrick1f@php.net');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (53, 'Liane', 'Tarply', 'ltarply1g@netscape.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (54, 'Letitia', 'Lynnett', 'llynnett1h@miitbeian.gov.cn');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (55, 'Rosalia', 'Udell', 'rudell1i@phoca.cz');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (56, 'Parnell', 'Nowell', 'pnowell1j@tripod.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (57, 'Lorianna', 'Karim', 'lkarim1k@globo.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (58, 'Mallorie', 'Minghetti', 'mminghetti1l@hexun.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (59, 'Sax', 'Britten', 'sbritten1m@google.de');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (60, 'Jorie', 'Klasen', 'jklasen1n@tuttocitta.it');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (61, 'Veronica', 'Kristufek', 'vkristufek1o@redcross.org');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (62, 'Teriann', 'Gislebert', 'tgislebert1p@mayoclinic.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (63, 'Hewie', 'Liles', 'hliles1q@sphinn.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (64, 'Gerrard', 'Masse', 'gmasse1r@un.org');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (65, 'Alvin', 'Benneyworth', 'abenneyworth1s@meetup.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (66, 'Blanch', 'Fend', 'bfend1t@123-reg.co.uk');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (67, 'Vivianne', 'Kruger', 'vkruger1u@netscape.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (68, 'Stanislas', 'Simnor', 'ssimnor1v@sciencedaily.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (69, 'Guss', 'Franceschelli', 'gfranceschelli1w@loc.gov');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (70, 'Oby', 'Francescuzzi', 'ofrancescuzzi1x@hibu.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (71, 'Wallis', 'Gilhooly', 'wgilhooly1y@shutterfly.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (72, 'Riva', 'MacKill', 'rmackill1z@mail.ru');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (73, 'Carolus', 'McKilroe', 'cmckilroe20@homestead.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (74, 'Elka', 'Wanstall', 'ewanstall21@topsy.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (75, 'Julita', 'Wimlett', 'jwimlett22@wunderground.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (76, 'Robert', 'Titcom', 'rtitcom23@prlog.org');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (77, 'Marcel', 'Richmond', 'mrichmond24@disqus.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (78, 'Dasie', 'Thurman', 'dthurman25@e-recht24.de');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (79, 'Carlota', 'Priver', 'cpriver26@sfgate.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (80, 'Celestina', 'Goddard', 'cgoddard27@shinystat.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (81, 'Bradford', 'Hanfrey', 'bhanfrey28@netscape.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (82, 'Ahmad', 'Espine', 'aespine29@theguardian.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (83, 'Cosme', 'Kaas', 'ckaas2a@timesonline.co.uk');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (84, 'Dmitri', 'Feldmesser', 'dfeldmesser2b@ftc.gov');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (85, 'Myrtice', 'Russel', 'mrussel2c@upenn.edu');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (86, 'Marita', 'Wooff', 'mwooff2d@trellian.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (87, 'Cchaddie', 'Dunsmore', 'cdunsmore2e@hud.gov');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (88, 'Bjorn', 'Gennings', 'bgennings2f@shinystat.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (89, 'Norry', 'Clementel', 'nclementel2g@economist.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (90, 'Norene', 'Birdsey', 'nbirdsey2h@yellowpages.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (91, 'Janey', 'Bibby', 'jbibby2i@nbcnews.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (92, 'Archambault', 'Freeborne', 'afreeborne2j@godaddy.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (93, 'Crissie', 'Yeulet', 'cyeulet2k@auda.org.au');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (94, 'Fey', 'Guihen', 'fguihen2l@infoseek.co.jp');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (95, 'Gerianne', 'Giabucci', 'ggiabucci2m@domainmarket.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (96, 'Libbi', 'Fetherstan', 'lfetherstan2n@yandex.ru');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (97, 'Sky', 'Suddell', 'ssuddell2o@live.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (98, 'Freeland', 'Strowger', 'fstrowger2p@hostgator.com');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (99, 'Darci', 'Pruvost', 'dpruvost2q@army.mil');
insert into Employee (employeeid, firstname, lastname, emailaddress) values (100, 'Tracie', 'Wakelin', 'twakelin2r@unblog.fr');

-- set managers
update employee set managerid=1 where employeeid between 11 and 20;
update employee set managerid=2 where employeeid between 21 and 30;
update employee set managerid=3 where employeeid between 31 and 40;
update employee set managerid=4 where employeeid between 41 and 50;
update employee set managerid=5 where employeeid between 51 and 60;
update employee set managerid=6 where employeeid between 61 and 70;
update employee set managerid=7 where employeeid between 71 and 80;
update employee set managerid=8 where employeeid between 81 and 90;
update employee set managerid=9 where employeeid between 91 and 100;

-- set employee types
update employee set EmployeeType='Manager' where employeeId between 1 and 9;
update employee set EmployeeType='Normal' where employeeId between 10 and 100;

-- create a sequence for the Reimbursement table
create or replace sequence SQ_Reimbursement_ID_Sequence;

-- create a trigger to assign a a PK from Reimbursement_ID_Sequence to a new row in Reimbursement
create or replace trigger TR_Reimbursement_On_Insert
before insert on Reimbursement
for each row
begin
	select SQ_Reimbursement_ID_Sequence.nextval into :new.id from dual;
end;
/

-- stored procedures
create or replace procedure SP_Update_Employee_Password (eid in number, pw in varchar2) is
begin
	update Employee set Password=pw where EmployeeID=eid;
	commit;

	exception
		when others
		then dbms_output.put_line('Failed to update employee password.');
		rollback;
end;
/

create or replace procedure SP_Insert_Reimbursement_Record (amt in number(10,2), eid in number,  mid in number, jst in varchar2, app in number) is
begin
	insert into Reimbursement (Amount, EmployeeID, ManagerID, Justification, Approved) values (amt, eid, mid, jst, app);
	commit;

	exception
		when others
		then dbms_output.put_line('Failed to insert new reimbursement record.');
		rollback;
end;
/

create or replace procedure SP_Approve_Reimbursement (rid in number) is
begin
	update Reimbursement set Approved=1 where ReimbursementID=rid;
	commit;

	exception
		when others
		then dbms_output.put_line('Failed to approve reimbursement.');
		rollback;
end;
/

create or replace procedure SP_Disapprove_Reimbursement (rid in number) is
begin
	update Reimbursement set Approved=2 where ReimbursementID=rid;
	commit;

	exception
		when others
		then dbms_output.put_line('Failed to disapprove reimbursement.');
		rollback;
end;
/

commit;
exit;