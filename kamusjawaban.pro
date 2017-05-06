domains
lis=integer*
facts
nondeterm list(lis, integer)
nondeterm list_angka(integer,integer,string)

clauses
list([0,0,0,0,0],0).
list([1,0,0,0,0],1).
list([0,1,0,0,0],2).
list([1,1,0,0,0],3).
list([0,0,1,0,0],4).
list([1,0,1,0,0],5).
list([0,1,1,0,0],6). 
list([1,1,1,0,0],7).
list([0,0,0,1,0],8).
list([1,0,0,1,0],9).
list([0,1,0,1,0],10).
list([1,1,0,1,0],11).
list([0,0,1,1,0],12).
list([1,0,1,1,0],13).
list([0,1,1,1,0],14).
list([1,1,1,1,0],15).
list([0,0,0,0,1],16).
list([1,0,0,0,1],17).
list([0,1,0,0,1],18).
list([1,1,0,0,1],19).
list([0,0,1,0,1],20).
list([1,0,1,0,1],21).
list([0,1,1,0,1],22).
list([1,1,1,0,1],23).
list([0,0,0,1,1],24).
list([1,0,0,1,1],25).
list([0,1,0,1,1],26).
list([1,1,0,1,1],27).
list([0,0,1,1,1],28).
list([1,0,1,1,1],29).
list([0,1,1,1,1],30).
list([1,1,1,1,1],31).

list_angka(1,1,"1   3   5   7").
list_angka(1,2,"9   11 13 15").
list_angka(1,3,"17 19 21 23").
list_angka(1,4,"25 27 29 31").

list_angka(2,1,"2   3   6   7").
list_angka(2,2,"10 11 14 15").
list_angka(2,3,"18 19 22 23").
list_angka(2,4,"26 27 230 31").

list_angka(3,1,"4   5   6   7").
list_angka(3,2,"12 13 14 15").
list_angka(3,3,"20 21 22 23").
list_angka(3,4,"28 29 30 31").

list_angka(4,1,"8   9   10 11").
list_angka(4,2,"12 13 14 15").
list_angka(4,3,"24 25 26 27").
list_angka(4,4,"28 29 30 31").

list_angka(5,1,"16 17 18 19").
list_angka(5,2,"20 21 22 23").
list_angka(5,3,"24 25 26 27").
list_angka(5,4,"28 29 30 31").
goal
save("listangka.lol").