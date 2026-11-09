BITS 32
GLOBAL _start

%define SYS_EXIT 1
%define SYS_READ 3
%define SYS_WRITE 4
%define SYS_OPEN 5
%define SYS_CLOSE 6
%define STDIN 0
%define STDOUT 1
%define O_RDONLY 0
%define O_WRONLY 1
%define O_CREAT 64
%define O_APPEND 1024

%macro PRINT 1
    push %1
    call print_string
    add esp,4
%endmacro

%macro READ 2
    push %2
    push %1
    call read_line
    add esp,8
%endmacro

section .data
clear db 27,'[2J',27,'[H',0
reset db 27,'[0m',0
sparkles db 27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',10,27,'[38;5;229m','               <3  PAWS & HEARTS WELCOMES YOU  <3               ',10,27,'[0m',0
footer db 27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',10,27,'[0m',0
shelter db 27,'[38;5;231m','                 _ _.-',39,'`-._ _',10,'                ;.',39,'________',39,'.;',10,'     _________n.[____________].n_________',10,'    |""_""_""_""||==||==||==||""_""_""_""',']',10,'    |"""""""""""||..||..||..||"""""""""""|',10,'    |LI LI LI LI||LI||LI||LI||LI LI LI LI|',10,'    |.. .. .. ..||..||..||..||.. .. .. ..|',10,'    |LI LI LI LI||LI||LI||LI||LI LI LI LI|',10,' ,,;;,;;;,;;;,;;;,;;;,;;;,;;;,;;;,;;,;;;,;;;,;;,,',10,';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;',10,27,'[0m',0
welcome db 10,27,'[38;5;229m','+--------------------------------------------------+',10,'|          PAWS & HEARTS PET ADOPTION CENTER       |',10,'|                WELCOME TO OUR HOME               |',10,'+--------------------------------------------------+',10,27,'[0m',0
main_menu db 10,27,'[38;5;229m','+--------------------------------------------------+',10,'|',27,'[38;5;157m','                    MAIN MENU                     ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,'|  ',27,'[38;5;157m','1. View Available Pets                          ',27,'[38;5;229m','|',10,'|  ',27,'[38;5;157m','2. Adopt a Pet                                  ',27,'[38;5;229m','|',10,'|  ',27,'[38;5;157m','3. Return a Pet                                 ',27,'[38;5;229m','|',10,'|  ',27,'[38;5;157m','4. View Adoption History                        ',27,'[38;5;229m','|',10,'|  ',27,'[38;5;157m','5. Exit                                         ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,27,'[38;5;229m','Enter Choice: ',27,'[0m',0
category_menu db 10,27,'[38;5;229m','+--------------------------------------------------+',10,'|',27,'[38;5;157m','                 PET CATEGORIES                   ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,'|  ',27,'[38;5;157m','1. Dogs                    ',27,'[38;5;229m','|',27,'[38;5;157m','  3. Birds          ',27,'[38;5;229m','|',10,'|  ',27,'[38;5;157m','2. Cats                    ',27,'[38;5;229m','|',27,'[38;5;157m','  4. Fish           ',27,'[38;5;229m','|',10,'|  ',27,'[38;5;157m','5. Back to Main Menu                            ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,27,'[38;5;229m','Select a Pet Category: ',27,'[0m',0
actions db 10,27,'[38;5;229m','+--------------------------------------------------+',10,'|  ',27,'[38;5;157m','1. Adopt a Pet                                  ',27,'[38;5;229m','|',10,'|  ',27,'[38;5;157m','2. View Other Pets                              ',27,'[38;5;229m','|',10,'|  ',27,'[38;5;157m','3. Back to Main Menu                            ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,27,'[38;5;229m','Choose an action: ',27,'[0m',0
available_title db 10,27,'[38;5;229m','+--------------------------------------------------+',10,'|',27,'[38;5;157m','                 AVAILABLE PETS                   ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,27,'[0m',0
history_title db 10,27,'[38;5;229m','+--------------------------------------------------+',10,'|',27,'[38;5;157m','                ADOPTION HISTORY                  ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,27,'[0m',0
card_line db 27,'[38;5;229m','+--------------------------------------------------+',27,'[0m',10,0

adopt_prompt db 10,27,'[38;5;229m','Enter Pet Name to Adopt: ',27,'[0m',0
return_prompt db 10,27,'[38;5;229m','Enter Pet Name to Return: ',27,'[0m',0
invalid_choice db 10,27,'[38;5;210m','[!] Invalid choice. Please try again.',27,'[0m',10,0
invalid_pet db 10,27,'[38;5;210m','[!] Pet not found. Use the exact pet name.',27,'[0m',10,0
already_adopted db 10,27,'[38;5;210m','[!] This pet is already adopted.',27,'[0m',10,0
not_adopted db 10,27,'[38;5;210m','[!] This pet is currently available.',27,'[0m',10,0
adoption_success db 10,27,'[38;5;157m','[OK] Pet Successfully Adopted!',27,'[0m',10,0
return_success db 10,27,'[38;5;157m','[OK] Pet Successfully Returned!',27,'[0m',10,0
file_error db 10,27,'[38;5;210m','[!] File operation failed.',27,'[0m',10,0
loaded db 10,27,'[38;5;157m','[OK] pets.txt loaded successfully.',27,'[0m',10,0
celebrate db 10,27,'[38;5;229m','+--------------------------------------------------+',10,'|',27,'[38;5;157m','              <3  NEW FAMILY CREATED  <3          ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,27,'[0m',0
congrats db 10,27,'[38;5;157m','Congratulations! This pet now has a loving home.',27,'[0m',10,0
no_records db 27,'[90m','(No records yet.)',27,'[0m',10,0
adoption_label db 27,'[38;5;229m','+--------------------------------------------------+',10,'|',27,'[38;5;157m','                 ADOPTION RECORDS                 ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,27,'[0m',0
return_label db 27,'[38;5;229m','+--------------------------------------------------+',10,'|',27,'[38;5;157m','                  RETURN RECORDS                  ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,27,'[0m',0
history_columns db '|',27,'[38;5;157m',' STATUS   | PET NAME      | TYPE     | FEE        ',27,'[38;5;229m','|',10,27,'[0m',0
row_start db '| ',0
history_tail db '       |',10,0
goodbye db 10,27,'[38;5;229m','+--------------------------------------------------+',10,'|',27,'[38;5;157m','             THANK YOU FOR VISITING               ',27,'[38;5;229m','|',10,'|',27,'[38;5;157m','          PAWS & HEARTS PET CENTER                ',27,'[38;5;229m','|',10,'+--------------------------------------------------+',10,27,'[0m',0
pastel_border db 27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',27,'[38;5;229m','★',27,'[38;5;218m','✿',27,'[38;5;222m','✦',27,'[38;5;183m','❀',27,'[38;5;217m','♡',27,'[38;5;153m','✧',27,'[38;5;157m','❋',27,'[38;5;229m','✰',10,27,'[0m',0
main_title db 27,'[38;5;218m','                        ✿  MAIN MENU  ✿                         ',27,'[0m',10,0
main_options db 27,'[38;5;157m','✿ 1. View Available Pets                                       ✿',27,'[0m',10,0,27,'[38;5;157m','✿ 2. Adopt a Pet                                               ✿',27,'[0m',10,0,27,'[38;5;157m','✿ 3. Return a Pet                                              ✿',27,'[0m',10,0,27,'[38;5;157m','✿ 4. View Adoption History                                     ✿',27,'[0m',10,0,27,'[38;5;157m','✿ 5. Exit                                                      ✿',27,'[0m',10,0
category_title db 27,'[38;5;218m','                      ✿  PET CATEGORIES  ✿                      ',27,'[0m',10,0
category_options db 27,'[38;5;157m','✿ 1. Dogs                 3. Birds                             ✿',27,'[0m',10,0,27,'[38;5;157m','✿ 2. Cats                 4. Fish                              ✿',27,'[0m',10,0,27,'[38;5;157m','✿ 5. Back to Main Menu                                         ✿',27,'[0m',10,0
action_options db 27,'[38;5;157m','✿ 1. Adopt a Pet                                               ✿',27,'[0m',10,0,27,'[38;5;157m','✿ 2. View Other Pets                                           ✿',27,'[0m',10,0,27,'[38;5;157m','✿ 3. Back to Main Menu                                         ✿',27,'[0m',10,0
available_title2 db 27,'[38;5;218m','                      ✿  AVAILABLE PETS  ✿                      ',27,'[0m',10,0
history_title2 db 27,'[38;5;218m','                     ✿  ADOPTION HISTORY  ✿                     ',27,'[0m',10,0
celebrate2 db 27,'[38;5;229m','                   <3  NEW FAMILY CREATED  <3                   ',27,'[0m',10,0
goodbye2 db 27,'[38;5;229m','                 <3  THANK YOU FOR VISITING  <3                 ',27,'[0m',10,'                    PAWS & HEARTS PET CENTER                    ',10,0

name_label db 27,'[38;5;153m','Name   : ',27,'[0m',0
breed_label db 27,'[38;5;153m','Breed  : ',27,'[0m',0
age_label db 27,'[38;5;153m','Age    : ',27,'[0m',0
fee_label db 27,'[38;5;153m','Fee    : ',27,'[0m',0
status_label db 27,'[38;5;153m','Status : ',27,'[0m',0
available db 27,'[38;5;157m','Available <3',27,'[0m',10,0
adopted db 27,'[38;5;210m','Adopted <3',27,'[0m',10,0
newline db 10,0
spacebuf db ' ',0
separator db ' | ',0
blank db 0
adopted_prefix db 'ADOPTED | ',0
returned_prefix db 'RETURNED | ',0

pets_file db 'pets.txt',0
adoption_file db 'adoption_history.txt',0
return_file db 'returns.txt',0

pet_names dd buddy,max,rocky,luna,milo,oliver,coco,sunny,kiwi,bubbles,goldie,nemo
pet_breeds dd golden,lab,husky,siamese,tabby,persian,cockatiel,canary,parakeet,betta,goldfish,clownfish
pet_ages dd age2,age4,age3,age1,age2,age3,age2,age1,age2,age1,age2,age1
pet_fees dd fee50,fee60,fee75,fee40,fee45,fee55,fee20,fee25,fee30,fee10,fee12,fee15
pet_types dd dog,dog,dog,cat,cat,cat,bird,bird,bird,fish,fish,fish
pet_heads dd dog1,dog2,dog3,cat1,cat2,cat3,bird1,bird2,bird3,fish1,fish2,fish3
pet_art dd exact_buddy,exact_max,exact_rocky,exact_luna,exact_milo,exact_oliver,exact_coco,exact_sunny,exact_kiwi,exact_bubbles,exact_goldie,exact_nemo
pet_indents db 16,18,17,13,19,13,12,19,10,12,16,2
pet_categories db 1,1,1,2,2,2,3,3,3,4,4,4

buddy db 'Buddy',0
max db 'Max',0
rocky db 'Rocky',0
luna db 'Luna',0
milo db 'Milo',0
oliver db 'Oliver',0
coco db 'Coco',0
sunny db 'Sunny',0
kiwi db 'Kiwi',0
bubbles db 'Bubbles',0
goldie db 'Goldie',0
nemo db 'Nemo',0

golden db 'Golden Retriever',0
lab db 'Labrador Retriever',0
husky db 'Siberian Husky',0
siamese db 'Siamese Cat',0
tabby db 'Tabby Cat',0
persian db 'Persian Cat',0
cockatiel db 'Cockatiel',0
canary db 'Canary',0
parakeet db 'Parakeet',0
betta db 'Betta Fish',0
goldfish db 'Goldfish',0
clownfish db 'Clownfish',0

age1 db '1 Year',0
age2 db '2 Years',0
age3 db '3 Years',0
age4 db '4 Years',0
fee10 db '$10',0
fee12 db '$12',0
fee15 db '$15',0
fee20 db '$20',0
fee25 db '$25',0
fee30 db '$30',0
fee40 db '$40',0
fee45 db '$45',0
fee50 db '$50',0
fee55 db '$55',0
fee60 db '$60',0
fee75 db '$75',0
dog db 'Dog',0
cat db 'Cat',0
bird db 'Bird',0
fish db 'Fish',0

dog1 db 'DOG #1',10,0
dog2 db 'DOG #2',10,0
dog3 db 'DOG #3',10,0
cat1 db 'CAT #1',10,0
cat2 db 'CAT #2',10,0
cat3 db 'CAT #3',10,0
bird1 db 'BIRD #1',10,0
bird2 db 'BIRD #2',10,0
bird3 db 'BIRD #3',10,0
fish1 db 'FISH #1',10,0
fish2 db 'FISH #2',10,0
fish3 db 'FISH #3',10,0

big_dog1 db 27,'[38;5;229m','                               .::=:..',10,'                         .=%@#*#+:--=*%%%@*.',10,'                      .:#@-.            ..+@=',10,'                    =@*.                -: .%%:',10,'                   +@-              :@@@+:=  .*@#:',10,'                  -@-  .= .*@@+  .:==.   .*=   .*@%.',10,'                 =@:   :#.@-    *=%@@%. -..%.    =@.',10,'               -@*=.   .#:      .=#@+.  *..%:  .+=@.',10,'               +%.      -%..#*.   :@@@@@.  *+  :@@.',10,'               +%.--.   :@.   =@@*..: -#   *@= -@.',10,'                +@@*+   -%.     =@.    #: ..=@#*.',10,'         .+%@%==-.:%%  :@-.      -%.. .@.  :+@:',10,'       +@+.*#-..:%%.-%@@@:* ...    =*#-. -:%@*.',10,'    :%@*..=.  .#%:  :%*..*#%-@+=*=..:++:#@@-#%.',10,'   +@.%.     .@@@. .%@*..   .=@@*-+#@=%@+   -=@.',10,'  :@: -      .#%..=@=:+*#..       .%. .%.   .#@.',10,' :%%.        :@.*@=.   .=%:=.     .#=.-%.  .+=%.',10,'.@-%:        :@@.        .*@#-:.           .%@:',10,'.@:.*. =:   -@:.=++##:       ==@*:+     .-:@@.',10,' #%.    *=.*#.       =%=-       .@*=    =@#*#',10,' .%%.    .@@+         #@%=.      =*   .#%  **.',10,' .%%#%=. .*+.         =%+@:      :@-:%%:   +#',10,'  .#%:    ##*.    .+#%@#.=#.     .%@@#   .=*@*.',10,'    .+@@@=.@-   -#..  ..##@--*:. ..*@@.  .. ..%+',10,'       .-==%*:..-   + .=-@#%*. +: #:*@+   #..###',10,'            :=+*#@@@@@@@#:.+@%%@%%@@#.-%@@@@@#-.',10,27,'[0m',10,0
big_dog2 db 27,'[38;5;229m','                                 ..',10,'                       .=#%@@@@@#+*%@%+.',10,'                   .+%@#=:        .:.:*@@%*=',10,'                 :%@+.        -+:. .#+..=:.=%@-',10,'               .:%@-             :@@@==@.     +@-',10,'             .@@=.  .=%=.       .%@%@:*.@.    .@+',10,'            .@+.  :  .  .        -@@@==.+@.   -@=',10,'           .@#.  :%  .*@%+@:      .-++*:.%*  .#@:',10,'          .%%.   .@- ++@@@@*.  -#+-=%@..%:%+. +@.',10,'         -@+.     :#.:*=@@%:  :%@@@@@%  .@+@@+%%.  .:',10,'        .@=        +@.  .      .=#@@=.  .@+@+:.     :',10,'        *%.        .#+.           .#@##%@-=@-',10,'        :@*=        .@:   .#*.  .=#:.. .*#%%.',10,'         -@@*: .    .%+     :*%%#@+.    -@@+.       :',10,'      :#@%=.-%@@=.  .@*=..       .+%-..:#@-@%.    .+#',10,'    :@@=.     ..#@#*@*@%%@@#+*.   ..=@@=*% .+@+   .=#',10,'  =@=     .#-   .::. .-@#:.:=*%@*%**.+@=   :%@+.  .+',10,'.+@-       .#..-:       .=#@%#*%+*-@+:      .%.',10,':@+         =%-%-             .-@++*. .= .   -@+',10,'+@.        .+%#-   .:---*+. -        :%#@-==-:.@%.',10,'+@.     .:==@%@. .=.    .=@@@*      .+@@*.     .*@.',10,'-@+  .#%-:..+@-           -+*#@@%= .#@@%#+.     .#%.',10,'%*. :#.  =..*@.        :        .+@#:.    ..+.   +@:',10,'+@*=*+.  :+ =@*-     .*.   .=. --.*%.=.  -. .%. :%#.',10,'  :=+*%@@@@@@%%%@@@%%%@#:   ==.:*:@#.*.  +  :@@@%-',10,'                       -%@@@@@@@@@*%@@@@@@@@@-',10,27,'[0m',10,0
big_dog3 db 27,'[38;5;229m','          :*+.',10,'        :%%=+@#.          -%@@*.',10,'       -@*+##:*@:       .#@--:#@.',10,'      :@++= :@-#%:.    :@#-%-#=%#.',10,'      .%#++.  :%:#%%#@#+@+-#.  *:@-',10,'      =@=#  .-+%-+=-=-+*+:%:   =+*@.',10,'     .@%=+:#%:... .#..=. ..=%- :%=@:',10,'    -@@:-%=..+-..++%.*+*++*-.+%=#-@=',10,'    -@**=..=*=..  +*%#=.   *= .#--%%:',10,'    :@%. .*-%+%@+ .-:   .=-.== .+%@#.',10,'  .*@#-=+*+*.%@%@.... .@@-*+*+-. +@=',10,'  -@#-.   :**@#=+*#+++@@@%-%-#=:-%%:',10,'.*@#.       .  .%@@@#  :=-.   ..#*@=.',10,'.+@%*.     :*:   -=.   -*       .+@*',10,' =@+.       .+@@@@@%+=#*.      ..-%#',10,'  .%@-.      .**.  .@#.        .*@@=',10,'.  .=@@+.     -%. .#*.       .*%@%.',10,'     -#@%+=.   .+#*.     ..:%@@#. ..--=+@%*-.',10,'     .%%:-@@*:       ..:@@@**@=  *@@=..-#@==@@-',10,'     =@-  :%%+#%*%@%#*%@%-.  =@=%%-.      :: -%%.',10,'    .@=-.   .-#*##%##+:.   =-.*@#.            .%@#.',10,':   .@@#-    .*:.=*      .#*+. .@@.    .       :%@#.',10,'-    :@@%::   .=+.     :+++.    .=@+.#@@@*.     .+%:',10,'     :@*-@@::.    . .=*@+-  ..    .#@#. .=%.     +@:',10,'     .%#. .%@+.  +*#@=.    .=*      -@*  .#*    .%%:',10,'     .%%:  .*-. .-=*.      .**=%%++##=@+..%=    +*@-',10,'    -@+%-   -%=  .%=       =#@=.     .=@=*#.    .##.',10,'   :@+.#+.   .@%..@-      .@@.         *@+.    .*@:',10,'   -@=.*+.    :%@#%:      *@*.         -@-    -+%%.',10,' .=#@@+%-     -%:#%.     :%+%--.       -@=   .+@*. ',10,'-@*. :%#.     =@-%+      =@#-::=%*.   .#%. -%@#.',10,'%*.=.%:-..-  .*@@-.: .. .@--: :. .=.  .%#%@@#-.',10,':%@%#@=*.:+..=@@%:+: +. .@=%..*...--=+%%=:.',10,'    .:*%@@@@%#:.*@@@@@@@@##@@@@@@%*+=:.',10,27,'[0m',10,0

cat_art1 db 27,'[38;5;218m','       /\\_/\\',10,'      /  o o  \\',10,'     (    ^    )',10,'      \\  =  /',10,'       \\___/',10,'      /|   |\\',10,'     /_|___|_\\',10,27,'[0m',10,0
cat_art2 db 27,'[38;5;218m','       /\\_/\\',10,'      ( =^.^= )',10,'       )     (',10,'      (  ___  )',10,'       \\___/',10,'      /     \\',10,'     /_______\\',10,27,'[0m',10,0
cat_art3 db 27,'[38;5;218m','      |\\__/,|',10,'      |o . o |',10,'      |  >  |',10,'      | \\_/ |',10,'       \\___/',10,'      /|   |\\',10,'     /_|___|_\\',10,27,'[0m',10,0
bird_art1 db 27,'[38;5;157m','         .-.',10,'        (o o)',10,'        |=|=|',10,'       __| |__',10,'      /   V   \\',10,'     /___/ \\___\\',10,'        /  \\',10,27,'[0m',10,0
bird_art2 db 27,'[38;5;157m','         __',10,'      __/o )',10,'     /  \\_/',10,'    /|   |',10,'     /   \\',10,'    /_____\\',10,'      /  \\',10,27,'[0m',10,0
bird_art3 db 27,'[38;5;157m','        .--.',10,'       /  o \\',10,'      <   __ )',10,'       \\_/_/',10,'        /|',10,'       /_|_',10,'      /_____',10,27,'[0m',10,0
fish_art1 db 27,'[38;5;153m','         /\\',10,'    ____/  \\__',10,'  /     o     )><',10,'  \\____    __/',10,'       \\__/',10,'       /  \\',10,'      /____\\',10,27,'[0m',10,0
fish_art2 db 27,'[38;5;153m','       __',10,'      /  \\',10,'  ___/ o  )><',10,' /   \\___/',10,' \\___/',10,'    /  \\',10,'   /____\\',10,27,'[0m',10,0
fish_art3 db 27,'[38;5;153m','       .-.',10,'     _(o o)_',10,'    (  \\_/  )><',10,'     \\___/',10,'      /|\\',10,'     /_|_\\',10,'      /  \\',10,27,'[0m',10,0

exact_buddy db 27,'[38;5;231m','    _=,_',10,' o_/6 /#\',10,' \__ |##/',10,'  =',39,'|--\',10,'    /   #',39,'-.',10,'    \#|_   _',39,'-. /',10,'     |/ \_( # |" ',10,'    C/ ,--___/',10,10,27,'[0m',10,0
exact_max db 27,'[38;5;231m','     .-"-.',10,'    /|6 6|\',10,'   {/(_0_)\}',10,'    _/ ^ \_',10,'   (/ /^\ \)-',39,10,'    ""',39,' ',39,'""',10,27,'[0m',10,0
exact_rocky db 27,'[38;5;231m','   __',10,'o-',39,39,'|\_____/)',10,' \_/|_)     )',10,'    \  __  /',10,'    (_/ (_/    ',10,10,27,'[0m',10,0
exact_luna db 27,'[38;5;231m',' _._     _,-',39,'""`-._',10,'(,-.`._,',39,'(       |\`-/|',10,'    `-.-',39,' \ )-`( , o o)',10,'          `-    \`_`"',39,'-',10,27,'[0m',10,0
exact_milo db 27,'[38;5;231m',' .       .',10,' \`-"',39,'"-',39,'/',10,'  } 6 6 {',10,' =.  Y  ,=',10,'   /^^^\  .',10,'  /     \  )',10,' (  )-(  )/',10,'  ""   ""',10,27,'[0m',10,0
exact_oliver db 27,'[38;5;231m','                _ |\_',10,'                \` ..\',10,'           __,.-" =__Y=',10,'         ."        )',10,'   _    /   ,    \/\_',10,'  ((____|    )_-\ \_-`',10,'  `-----',39,'`-----` `--`',10,27,'[0m',10,0
exact_coco db 27,'[38;5;231m','     _\|      __     |/_',10,'   _-  \_   _/"->   _/  -_',10,'   -_    `-',39,'(   )`-',39,'    _-',10,'    `=.__.=-(   )-=.__.=',39,10,'            |/-\|',10,'            Y   Y',10,27,'[0m',10,0
exact_sunny db 27,'[38;5;231m','     (',10,'    `-`-.',10,'    ',39,'( @ >',10,'     _) (',10,'    /    )',10,'   /_,',39,'  /',10,'     \  /',10,'  ===m""m===',10,10,27,'[0m',10,0
exact_kiwi db 27,'[38;5;231m','            _.-.',10,'        .-.  `) |  .-.',10,'    _.',39,'`. .~./  \.~. .`',39,'._',10,'.-',39,'`.',39,'-',39,'.',39,'.-:    ;-.',39,'.',39,'-',39,'.`',39,'-.',10,' `',39,'`',39,'`',39,'`',39,'`   \  /   `',39,'`',39,'`',39,'`',39,'`',10,'             /||\',10,'            / ^^ \',10,'            `',39,'``',39,'`',10,27,'[0m',10,0
exact_bubbles db 27,'[38;5;231m','          /"*._         _',10,'      .-*',39,'`    `*-.._.-',39,'/',10,'    < * ))     ,       (',10,'      `*-._`._(__.--*"`.\',10,27,'[0m',10,0
exact_goldie db 27,'[38;5;231m','|\   \\\\__     o',10,'| \_/    o \    o',10,'> _   (( <_  oo',10,'| / \__+___/',10,'|/     |/',10,27,'[0m',10,0
exact_nemo db 27,'[38;5;231m','      /`·.¸',10,'     /¸...¸`:·',10,' ¸.·´  ¸   `·.¸.·´)',10,': © ):´;      ¸  {',10,' `·.¸ `·  ¸.·´\`·¸)',10,'     `\\´´\¸.·´',10,10,27,'[0m',10,0

section .bss
input resb 128
buffer resb 8192
record resb 256
charbuf resb 2
fieldbuf resb 64
art_base_indent resd 1
art_indent_count resd 1
record_ptr resd 1
fd resd 1
category resb 1
status resb 12
history_len resd 1

section .text
_start:
    call init_files
    call read_pets
    PRINT clear
    PRINT welcome
    PRINT shelter

main_loop:
    call main_menu_proc
    cmp eax,1
    je view_option
    cmp eax,2
    je adopt_option
    cmp eax,3
    je return_option
    cmp eax,4
    je history_option
    cmp eax,5
    je exit_option
    PRINT invalid_choice
    jmp main_loop

view_option:
    call category_proc
    jmp main_loop
adopt_option:
    call adopt_pet
    jmp main_loop
return_option:
    call return_pet
    jmp main_loop
history_option:
    call view_history
    jmp main_loop
exit_option:
    PRINT clear
    PRINT goodbye
    PRINT shelter
    mov eax,SYS_EXIT
    xor ebx,ebx
    int 80h

main_menu_proc:
    PRINT main_menu
    READ input,128
    cmp byte [input+1],0
    jne bad_main
    mov al,[input]
    sub al,'0'
    cmp al,1
    jb bad_main
    cmp al,5
    ja bad_main
    movzx eax,al
    ret
bad_main:
    xor eax,eax
    ret

category_proc:
category_loop:
    PRINT category_menu
    READ input,128
    cmp byte [input+1],0
    jne bad_category
    mov al,[input]
    sub al,'0'
    cmp al,1
    jb bad_category
    cmp al,5
    ja bad_category
    cmp al,5
    je category_done
    mov [category],al
    call show_category
action_loop:
    PRINT actions
    READ input,128
    cmp byte [input+1],0
    jne bad_action
    cmp byte [input],'1'
    je action_adopt
    cmp byte [input],'2'
    je category_loop
    cmp byte [input],'3'
    je category_done
bad_action:
    PRINT invalid_choice
    jmp action_loop
action_adopt:
    call adopt_pet
    jmp action_loop
bad_category:
    PRINT invalid_choice
    jmp category_loop
category_done:
    ret

show_category:
    PRINT clear
    PRINT available_title
    xor esi,esi
show_loop:
    cmp esi,12
    je show_done
    mov al,[pet_categories+esi]
    cmp al,[category]
    jne show_next
    push esi
    call show_pet
    add esp,4
show_next:
    inc esi
    jmp show_loop
show_done:
    ret

show_pet:
    push ebp
    mov ebp,esp
    push esi
    mov esi,[ebp+8]
    PRINT card_line
    mov eax,[pet_heads+esi*4]
    PRINT eax
    PRINT name_label
    mov eax,[pet_names+esi*4]
    PRINT eax
    PRINT newline
    PRINT breed_label
    mov eax,[pet_breeds+esi*4]
    PRINT eax
    PRINT newline
    PRINT age_label
    mov eax,[pet_ages+esi*4]
    PRINT eax
    PRINT newline
    PRINT fee_label
    mov eax,[pet_fees+esi*4]
    PRINT eax
    PRINT newline
    PRINT status_label
    cmp byte [status+esi],1
    je show_adopted
    PRINT available
    jmp show_art
show_adopted:
    PRINT adopted
show_art:
    mov eax,[pet_art+esi*4]
    movzx edx,byte [pet_indents+esi]
    push edx
    push eax
    call print_art_indented
    add esp,8
    PRINT card_line
    pop esi
    pop ebp
    ret

adopt_pet:
    PRINT adopt_prompt
    READ input,128
    call find_pet
    cmp eax,-1
    je adopt_bad_name
    mov esi,eax
    cmp byte [status+esi],1
    je adopt_already
    mov byte [status+esi],1
    call build_adoption
    push record
    push adoption_file
    call append_file
    add esp,8
    cmp eax,1
    jne adopt_write_bad
    PRINT clear
    PRINT celebrate
    push esi
    call show_pet
    add esp,4
    PRINT congrats
    PRINT adoption_success
    ret
adopt_write_bad:
    mov byte [status+esi],0
    PRINT file_error
    ret
adopt_bad_name:
    PRINT invalid_pet
    ret
adopt_already:
    PRINT already_adopted
    ret

return_pet:
    PRINT return_prompt
    READ input,128
    call find_pet
    cmp eax,-1
    je return_bad_name
    mov esi,eax
    cmp byte [status+esi],0
    je return_not_adopted
    mov byte [status+esi],0
    call build_return
    push record
    push return_file
    call append_file
    add esp,8
    cmp eax,1
    jne return_write_bad
    PRINT return_success
    ret
return_write_bad:
    mov byte [status+esi],1
    PRINT file_error
    ret
return_bad_name:
    PRINT invalid_pet
    ret
return_not_adopted:
    PRINT not_adopted
    ret

find_pet:
    xor esi,esi
find_loop:
    cmp esi,12
    je find_none
    mov eax,[pet_names+esi*4]
    push input
    push eax
    call same_text
    add esp,8
    cmp eax,1
    je find_yes
    inc esi
    jmp find_loop
find_yes:
    mov eax,esi
    ret
find_none:
    mov eax,-1
    ret

same_text:
    push ebp
    mov ebp,esp
    push esi
    push edi
    mov esi,[ebp+8]
    mov edi,[ebp+12]
same_loop:
    mov al,[esi]
    cmp al,[edi]
    jne same_no
    cmp al,0
    je same_yes
    inc esi
    inc edi
    jmp same_loop
same_yes:
    mov eax,1
    jmp same_done
same_no:
    xor eax,eax
same_done:
    pop edi
    pop esi
    pop ebp
    ret

build_adoption:
    mov dword [record_ptr],record
    push adopted_prefix
    call add_text
    add esp,4
    mov eax,[pet_names+esi*4]
    push dword 13
    push eax
    call add_field
    add esp,8
    push separator
    call add_text
    add esp,4
    mov eax,[pet_types+esi*4]
    push dword 8
    push eax
    call add_field
    add esp,8
    push separator
    call add_text
    add esp,4
    mov eax,[pet_fees+esi*4]
    push eax
    call add_text
    add esp,4
    push newline
    call add_text
    add esp,4
    mov edi,[record_ptr]
    mov byte [edi],0
    ret

build_return:
    mov dword [record_ptr],record
    push returned_prefix
    call add_text
    add esp,4
    mov eax,[pet_names+esi*4]
    push dword 13
    push eax
    call add_field
    add esp,8
    push separator
    call add_text
    add esp,4
    mov eax,[pet_types+esi*4]
    push dword 8
    push eax
    call add_field
    add esp,8
    push separator
    call add_text
    add esp,4
    push dword 4
    push blank
    call add_field
    add esp,8
    push newline
    call add_text
    add esp,4
    mov edi,[record_ptr]
    mov byte [edi],0
    ret

add_text:
    push ebp
    mov ebp,esp
    push esi
    push edi
    mov esi,[ebp+8]
    mov edi,[record_ptr]
add_loop:
    mov al,[esi]
    cmp al,0
    je add_done
    mov [edi],al
    inc esi
    inc edi
    jmp add_loop
add_done:
    mov [record_ptr],edi
    pop edi
    pop esi
    pop ebp
    ret

add_field:
    push ebp
    mov ebp,esp
    push esi
    push edi
    mov esi,[ebp+8]
    mov ecx,[ebp+12]
    mov edi,[record_ptr]
field_copy:
    cmp byte [esi],0
    je field_pad
    mov al,[esi]
    mov [edi],al
    inc esi
    inc edi
    dec ecx
    cmp ecx,0
    je field_done
    jmp field_copy
field_pad:
    cmp ecx,0
    je field_done
    mov byte [edi],' '
    inc edi
    dec ecx
    jmp field_pad
field_done:
    mov [record_ptr],edi
    pop edi
    pop esi
    pop ebp
    ret

view_history:
    PRINT clear
    PRINT history_title
    PRINT adoption_label
    PRINT history_columns
    push adoption_file
    call display_history_file
    add esp,4
    PRINT return_label
    PRINT history_columns
    push return_file
    call display_history_file
    add esp,4
    PRINT card_line
    ret

init_files:
    push adoption_file
    call make_file
    add esp,4
    push return_file
    call make_file
    add esp,4
    ret

make_file:
    mov eax,SYS_OPEN
    mov ebx,[esp+4]
    mov ecx,O_WRONLY | O_CREAT | O_APPEND
    mov edx,0644o
    int 80h
    cmp eax,0
    jl make_done
    mov [fd],eax
    mov eax,SYS_CLOSE
    mov ebx,[fd]
    int 80h
make_done:
    ret

read_pets:
    mov eax,SYS_OPEN
    mov ebx,pets_file
    mov ecx,O_RDONLY
    xor edx,edx
    int 80h
    cmp eax,0
    jl read_bad
    mov [fd],eax
    mov eax,SYS_READ
    mov ebx,[fd]
    mov ecx,buffer
    mov edx,8192
    int 80h
    mov eax,SYS_CLOSE
    mov ebx,[fd]
    int 80h
    ret
read_bad:
    ret

append_file:
    mov eax,SYS_OPEN
    mov ebx,[esp+4]
    mov ecx,O_WRONLY | O_CREAT | O_APPEND
    mov edx,0644o
    int 80h
    cmp eax,0
    jl append_bad
    mov [fd],eax
    push dword [esp+8]
    call text_length
    add esp,4
    mov edx,eax
    mov eax,SYS_WRITE
    mov ebx,[fd]
    mov ecx,[esp+8]
    int 80h
    cmp eax,edx
    jne append_close_bad
    mov eax,SYS_CLOSE
    mov ebx,[fd]
    int 80h
    mov eax,1
    ret
append_close_bad:
    mov eax,SYS_CLOSE
    mov ebx,[fd]
    int 80h
append_bad:
    xor eax,eax
    ret

display_file:
    mov eax,SYS_OPEN
    mov ebx,[esp+4]
    mov ecx,O_RDONLY
    xor edx,edx
    int 80h
    cmp eax,0
    jl display_empty
    mov [fd],eax
    mov eax,SYS_READ
    mov ebx,[fd]
    mov ecx,buffer
    mov edx,8192
    int 80h
    cmp eax,0
    jle display_close
    mov edx,eax
    mov eax,SYS_WRITE
    mov ebx,STDOUT
    mov ecx,buffer
    int 80h
display_close:
    mov eax,SYS_CLOSE
    mov ebx,[fd]
    int 80h
    ret

display_history_file:
    mov eax,SYS_OPEN
    mov ebx,[esp+4]
    mov ecx,O_RDONLY
    xor edx,edx
    int 80h
    cmp eax,0
    jl history_empty
    mov [fd],eax
    mov eax,SYS_READ
    mov ebx,[fd]
    mov ecx,buffer
    mov edx,8192
    int 80h
    mov [history_len],eax
    mov eax,SYS_CLOSE
    mov ebx,[fd]
    int 80h
    cmp dword [history_len],0
    jle history_empty
    mov esi,buffer
history_line:
    mov edi,buffer
    add edi,[history_len]
    cmp esi,edi
    jae history_done
    cmp byte [esi],10
    je history_skip
    mov dword [record_ptr],record
    push row_start
    call add_text
    add esp,4
    push esi
    call parse_field
    add esp,4
    mov esi,eax
    push dword 8
    push fieldbuf
    call add_field
    add esp,8
    push separator
    call add_text
    add esp,4
    push esi
    call parse_field
    add esp,4
    mov esi,eax
    push dword 13
    push fieldbuf
    call add_field
    add esp,8
    push separator
    call add_text
    add esp,4
    push esi
    call parse_field
    add esp,4
    mov esi,eax
    push dword 8
    push fieldbuf
    call add_field
    add esp,8
    push separator
    call add_text
    add esp,4
    push esi
    call parse_field
    add esp,4
    mov esi,eax
    push dword 4
    push fieldbuf
    call add_field
    add esp,8
    push history_tail
    call add_text
    add esp,4
    mov edi,[record_ptr]
    mov byte [edi],0
    PRINT record
history_skip:
    cmp byte [esi],0
    je history_done
    inc esi
    jmp history_line
history_done:
    ret
history_empty:
    PRINT no_records
    ret

parse_field:
    push ebp
    mov ebp,esp
    push esi
    push edi
    mov esi,[ebp+8]
parse_leading:
    cmp byte [esi],' '
    jne parse_copy_start
    inc esi
    jmp parse_leading
parse_copy_start:
    mov edi,fieldbuf
parse_copy:
    mov al,[esi]
    cmp al,'|'
    je parse_finish
    cmp al,10
    je parse_finish
    cmp al,0
    je parse_finish
    mov [edi],al
    inc edi
    inc esi
    jmp parse_copy
parse_finish:
    cmp edi,fieldbuf
    je parse_terminate
    cmp byte [edi-1],' '
    jne parse_terminate
    dec edi
    jmp parse_finish
parse_terminate:
    mov byte [edi],0
    cmp byte [esi],'|'
    jne parse_return
    inc esi
parse_return:
    mov eax,esi
    pop edi
    pop esi
    pop ebp
    ret

display_empty:
    PRINT no_records
    ret

print_art_indented:
    push ebp
    mov ebp,esp
    push ebx
    push esi
    push edi
    mov esi,[ebp+8]
    mov eax,[ebp+12]
    mov [art_base_indent],eax
    mov edi,1
    mov ebx,1
art_loop:
    mov al,[esi]
    cmp al,0
    je art_done
    cmp edi,1
    jne art_output
    cmp ebx,1
    je art_add_indent
    cmp al,27
    je art_skip_indent
art_add_indent:
    mov eax,[art_base_indent]
    mov [art_indent_count],eax
art_indent_loop:
    cmp dword [art_indent_count],0
    je art_skip_indent
    PRINT spacebuf
    dec dword [art_indent_count]
    jmp art_indent_loop
art_skip_indent:
    mov al,[esi]
    mov edi,0
    xor ebx,ebx
art_output:
    mov [charbuf],al
    mov byte [charbuf+1],0
    PRINT charbuf
    cmp byte [charbuf],10
    jne art_next
    mov edi,1
art_next:
    inc esi
    jmp art_loop
art_done:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret

print_string:
    push ebp
    mov ebp,esp
    push esi
    mov esi,[ebp+8]
    xor edx,edx
print_len:
    cmp byte [esi+edx],0
    je print_now
    inc edx
    jmp print_len
print_now:
    mov eax,SYS_WRITE
    mov ebx,STDOUT
    mov ecx,esi
    int 80h
    pop esi
    pop ebp
    ret

read_line:
    push ebp
    mov ebp,esp
    push edi
    mov edi,[ebp+8]
    mov edx,[ebp+12]
    dec edx
    mov eax,SYS_READ
    mov ebx,STDIN
    mov ecx,edi
    int 80h
    cmp eax,0
    jle read_empty
    xor ecx,ecx
read_scan:
    cmp ecx,eax
    jae read_end
    cmp byte [edi+ecx],10
    je read_stop
    cmp byte [edi+ecx],13
    je read_stop
    inc ecx
    jmp read_scan
read_stop:
    mov byte [edi+ecx],0
    jmp read_done
read_end:
    mov byte [edi+eax],0
    jmp read_done
read_empty:
    mov byte [edi],0
read_done:
    pop edi
    pop ebp
    ret

text_length:
    push ebp
    mov ebp,esp
    mov ecx,[ebp+8]
    xor eax,eax
text_loop:
    cmp byte [ecx+eax],0
    je text_done
    inc eax
    jmp text_loop
text_done:
    pop ebp
    ret
