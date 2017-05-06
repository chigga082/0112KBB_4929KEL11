domains
lis = integer*
number, limit =integer

facts
nondeterm list_angka(integer,integer,string)
nondeterm list(lis, integer)

predicates
nondeterm run
%GAME1================================
nondeterm binary(lis,integer)
nondeterm predict(lis,integer)
nondeterm cek_input(integer)
nondeterm opsi(string)
nondeterm kelompok(string,string,integer) 
nondeterm draft(integer)
%======================================
%game2=================================
nondeterm tes_ran(number,limit)
nondeterm var_x(integer)
nondeterm var_y(integer)
nondeterm kons_x(integer)
nondeterm kons_y(integer)
nondeterm cek(integer,integer,integer,integer,integer)
nondeterm clue(integer,integer)
nondeterm game2(integer)
%======================================
clauses
kelompok("Syahrul Andi Subakti","1515015060",1).
kelompok("Arinda Mulawardhani K","1515015081",2).
kelompok("Chrisman Bonor Sinaga","1515015082",3).

draft(No):-
	kelompok(Nama,Nim,No),NewNo=No+1,
	write(Nama," \t ",Nim),nl,draft(NewNo);
	No>0.
	
cek_input(In):-
	In=1;
	In=0;
	write("Inputan tidak sesuai dengan permintaan program"),nl,!,run.

%GAME 1=====================================================================	
binary([],5).
binary([NewHead|NewTail],Count):-
	NewCount=Count+1,
	list_angka(NewCount,1,List1),
	list_angka(NewCount,2,List2),
	list_angka(NewCount,3,List3),
	list_angka(NewCount,4,List4),
	nl,
	write(List1),nl,
	write(List2),nl,
	write(List3),nl,
	write(List4),nl,
	nl,
	write("-------------------------------------------------------------------"),nl,
	write("Apakah angka anda terdapat pada angka diatas ?(1=ya, 0=tidak)"),
	readint(In),cek_input(In),nl,
	write("-------------------------------------------------------------------"),nl,
	NewHead=In,
	binary(NewTail,NewCount).
predict(NewNumb,Numb):-
	list(NewNumb,Numb).
%==========================================================================================
%GAME 2====================================================================================
tes_ran(Result,Max):-
	random(Real),Result=Real*Max+1.

var_x(Result1):-
	tes_ran(Result1,4).
var_y(Result2 ):-
	tes_ran(Result2,4).
kons_x(Result3):-
	tes_ran(Result3,3).
kons_y(Result4):-
	tes_ran(Result4,3).
cek(X,Y,A,B,Score):-
	X=A,Y=B,write("Anda benar"),NewScore=Score+10,nl,
	game2(NewScore);
	write("Anda salah, Score anda ",Score).
clue(A,B):-
	C=A-B,
	write("CLUE = Nilai dari X-Y adalah ",C).
game2(Score):-
	var_x(Result1),
	var_y(Result2),
	kons_x (Result3),
	kons_y(Result4),
	Hasil=Result3*Result1+Result4*Result2,
	write("Berapa kah nilai X dan Y pada persamaan ini ",Result3,"X + ",Result4,"Y = ",Hasil),nl,clue(Result1,Result2),
	nl,
	write("X = "),readint(X),nl,
	write("Y = "),readint(Y),cek(X,Y,Result1,Result2,Score).
%=================================================================================
run:-
	write("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"),nl,
	write("|			MENU				|"),nl,	
	write("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"),nl,
	write("|1. Game 1(Menebak Angka yang Anda Pikirkan)\t\t\t|"),nl,
	write("|2. Game 2(Mengungkap misteri X dan Y)\t\t\t|"),nl,
	write("|3. Credit\t\t\t\t\t\t\t|"),nl,
	write("|4. Cara Bermain\t\t\t\t\t\t|"),nl,
	write("|5. Keluar\t\t\t\t\t\t\t|"),nl,
	write("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"),nl,
	write("Pilih Menu : "),
	readln(Menu),nl,opsi(Menu),nl.
opsi(Menu):-
	Menu="1",
	write("Pikirkan satu angka dari angka 1 hingga angka 31"),readchar(_),
	binary(NewNumb,0),!,
	predict(NewNumb,Hasil),nl,
	write("Angka yang anda pikirkan adalah ",Hasil),nl,
	write(" tekan sembarang untuk kembali ke menu"),readchar(_),nl,nl,run;
	
	Menu="2",Score=0,
	game2(Score),nl,
	write(" tekan sembarang untuk kembali ke menu"),readchar(_),nl,nl,run;
	
	Menu="3",
	write("+++++++++++++++++++++++++++++++++++++++++"),nl,
	write("| Kelompok 11\t\t\t\t|"),nl,
	write("+++++++++++++++++++++++++++++++++++++++++"),nl,
	draft(1),
	write("tekan sembarang untuk kembali ke menu"),readchar(_),nl,nl,
	run;
	
	Menu="4",
	write("Cara Bermain Game 1 :"),nl,
	write("1. Pada game pertama, pemain diminta untuk memikirkan angka 1 hingga 31"),nl,
	write("2. Akan tampil deretean angka-angka, bila pemain menemukan angka yang\n    dipilih maka pemain memasukkan angka '1', bila angka yang dipilih tidak\n    ada pemain memasukkan angka '0'"),nl,
	write("Cara Bermain Game 2 :"),nl,
	write("1. Pada game kedua, pemain diminta untuk memenebak nilai dari X dan Y"),nl,
	write("2. Terdapat clue yang merupakan selisih nilai dari X dan Y"),nl,
	write("2. Nilai X dan Y adalah bilangan bulat positif"),
	write("3. Raihlah score tertinggi"),nl,
	nl,readchar(_),nl,nl,run;
	
	Menu="5", write("bye");
	Menu<>"1",Menu<>"2",Menu<>"3",Menu<>"4",Menu<>"5",
	write("Pilihan menu tidak tersedia"),nl,run;
	write("Pastikan Inputan berupa angka"),nl,run.
goal
consult("listangka.lol"),
run.
