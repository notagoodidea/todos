enum A <mk rm tg ls mv cp>; multi MAIN(A $a,:$ws?='default',:$st?="TODO",*@a){
say "$a $ws $st @a[]"};

