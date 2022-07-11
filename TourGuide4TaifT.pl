%//taif location.
location('AL rudaf park', _ ,_ , _ , 'Relax').
location('AL rudaf park', 2 ,2 , _ , 'Relax').
location('AL Faisaliah garden', 1 ,2 , _ , 'Relax').
location('Shafa Mountins' , 2 , _ , _ , 'Entertainment').
location('Taif Zoo' , 3 ,3 , _ , 'Entertainment').
location('Green Mountin Park' , 3 ,_ , _ , 'Entertainment').
location('Strawberry farm' , 2 ,_ , _ , 'Entertainment').
location('Strawberry farm' , 4 ,3 , 'Family' , 'Entertainment').
location('Shubra Place', 1 ,_ , _ , 'Cultural').
location('Sharif Museum ', 2 ,2 , _ , 'Cultural').
location('SOuq Okaz ', 2 ,_ , _ , 'Cultural').
location('Jouri Mall', 2 ,1 , _ , 'Shopping').
location('Taif Heart Mall', 2 ,2 , _ , 'Shopping').
location('Taif Heart Mall', 3 ,_ , _ , 'Shopping').
location('BOHOO', 2 ,2 , _ , 'Food/drinks').
location('Starbuks', _ ,_ , _ , 'Food/drinks').
location('THE HAT', 2 ,2 , _ , 'Food/drinks').
location('THE HAT', 4 , _, _ , 'Food/drinks').




start:-
    write('Welcome to the Tourists guide in Tif:)'),nl,write('Please answer questions below by writing the number of choice,and end it up with (.) ,
thank you'),nl,nl,tourist.

tourist:-
 write(' What is your name? ')
 ,read_string(user_input, ".", "\r ",_, Namer)
 ,string_lower(Namer,Names) %//convert name to lower case
 ,write('Hello '),write(Names),nl,nl,read_input(' Enter your budget',Budget,check_negativity,'Invalid budget, budget must be greater than 0'),read_input('\n Enter number of people ',NumberOfPeople,check_negativity,'Ivalid number of people, the number of people must be greater than 0')
 ,BudgetPerPerson is Budget//NumberOfPeople
 ,(BudgetPerPerson<80.0 ->RealBudget=1; true)
 ,(BudgetPerPerson>=80.0 , BudgetPerPerson<500.0 ->RealBudget=2; true)
 ,(BudgetPerPerson>=500.0, BudgetPerPerson<1500 ->RealBudget=3; true)
 ,(BudgetPerPerson>=1500.0,BudgetPerPerson<2500 ->RealBudget=4;true)
 ,(BudgetPerPerson>=2500.0 ->RealBudget=5;true),(NumberOfPeople =:= 1 -> RealType='Alone',RealNumberOfPeople='1';true)
 ,(NumberOfPeople =:= 2 ->read_input('\n What is the relation?\n1. Couples\n2. Friends\n3.
Family',Type,three_options,'Wrong choice!..please select again')
 ,RealNumberOfPeople='2',(Type =:= 1 ,RealType='Couples'
 ;Type =:= 2 , RealType='Friends'
 ;Type =:= 3 , RealType='Family'); true)
 ,(NumberOfPeople > 2 -> read_input('\n What is the relation?\n1. Friends\n2. Family',
Type,two_options,'Wrong choice!..please select again')
 ,RealNumberOfPeople='Group'
 ,(Type =:= 1 , RealType='Friends'
 ;Type =:= 2 , RealType='Family'); true)
 %//type of vacation
 ,read_input('\nChoose vacation type\n1.Relax\n2.Entertainment\n3.Food/drink\n4.Shopping\n5.Cultural',
 VcTypeChoice,five_options,'w')
 ,(VcTypeChoice =:= 1 , VcType='Relax'
 ;VcTypeChoice =:= 2 , VcType='Entertainment'
 ;VcTypeChoice =:= 3 , VcType='Food/drinks'
 ;VcTypeChoice =:= 4 , VcType='Shopping'
 ;VcTypeChoice =:= 5 , VcType='Cultural'),printingSuggestedSites(RealBudget,RealNumberOfPeople,RealType,VcType),exit.

printingSuggestedSites(Budget,Num,Typep,Typev):-
 writeln('\nI suggest you to visit those locations: '),
 (location(Name,B,Num,Typep,Typev),B=<Budget,
 write("-"),write(Name),nl,fail;true),nl.

%//___________FUNCTIONS_______________________
exit:-
 writeln('\nEnd of program').
read_input(Prompt, Value, CheckPred, ErrorMsg) :-
 repeat,
 format('~w~n', [Prompt]),
 read(Value),
 ( call(CheckPred, Value)
 -> true, !
 ; format('ERROR: ~w.~n', [ErrorMsg]),
 fail).

check_negativity(X):-integer(X), X>0.
two_options(X):- X==1 ; X==2.
three_options(X):- two_options(X); X==3.
four_options(X):- three_options(X); X==4.
five_options(X):- four_options(X); X==5.
six_options(X):- five_options(X); X==6.

