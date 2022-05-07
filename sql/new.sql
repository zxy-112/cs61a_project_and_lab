create table parents as
  select 'zhanghaojun' as parent, 'zhangxingyu'as son union
  select 'wangxinge' as parent, 'zhangxingyu' as son union
  select 'zhangjianguo' as parent, 'zhanghaojun' as son union
  select 'zhanyanxiao' as parent, 'zhanghaojun' as son union
  select 'zhanglijun' as parent, 'zhangpinzheng' as son union
  select 'zhangjianguo' as parent, 'zhanglijun' as son union
  select 'zhangjianguo' as parent, 'zhangliying' as son union
  select 'zhangliying' as parent, 'guojinwen' as son union
  select 'guojunlei' as parent, 'guojinwen' as son;

create table persons as
  select 'zhanghaojun' as name, 'noodle' as favourite union
  select 'zhangxingyu'        , 'pizza'               union
  select 'wangxinge'          , 'vegetable'           union
  select 'zhangjianguo'       , 'chicken';

create table birthday as
  select 'zhanghaojun' as name, '1975' as year union
  select 'zhangxinyu'         , '1999'         union
  select 'wangxinge'          , '1976'         union
  select 'zhangjianguo'       , '1955';

create table grandparents as
  select a.parent as grandog, b.son as grandpup from parents as a, parents as b where a.son = b.parent;
