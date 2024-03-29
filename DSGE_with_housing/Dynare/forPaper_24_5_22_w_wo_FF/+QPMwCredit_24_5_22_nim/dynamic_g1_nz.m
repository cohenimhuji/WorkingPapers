function [nzij_pred, nzij_current, nzij_fwrd] = dynamic_g1_nz()
% Returns the coordinates of non-zero elements in the Jacobian, in column-major order, for each lead/lag (only for endogenous)
  nzij_pred = zeros(39, 2, 'int32');
  nzij_pred(1,1)=1; nzij_pred(1,2)=1;
  nzij_pred(2,1)=2; nzij_pred(2,2)=1;
  nzij_pred(3,1)=10; nzij_pred(3,2)=1;
  nzij_pred(4,1)=6; nzij_pred(4,2)=3;
  nzij_pred(5,1)=8; nzij_pred(5,2)=6;
  nzij_pred(6,1)=52; nzij_pred(6,2)=6;
  nzij_pred(7,1)=2; nzij_pred(7,2)=7;
  nzij_pred(8,1)=4; nzij_pred(8,2)=8;
  nzij_pred(9,1)=1; nzij_pred(9,2)=9;
  nzij_pred(10,1)=3; nzij_pred(10,2)=10;
  nzij_pred(11,1)=11; nzij_pred(11,2)=11;
  nzij_pred(12,1)=12; nzij_pred(12,2)=11;
  nzij_pred(13,1)=30; nzij_pred(13,2)=11;
  nzij_pred(14,1)=20; nzij_pred(14,2)=13;
  nzij_pred(15,1)=26; nzij_pred(15,2)=17;
  nzij_pred(16,1)=54; nzij_pred(16,2)=17;
  nzij_pred(17,1)=12; nzij_pred(17,2)=18;
  nzij_pred(18,1)=17; nzij_pred(18,2)=19;
  nzij_pred(19,1)=11; nzij_pred(19,2)=20;
  nzij_pred(20,1)=14; nzij_pred(20,2)=21;
  nzij_pred(21,1)=15; nzij_pred(21,2)=21;
  nzij_pred(22,1)=13; nzij_pred(22,2)=22;
  nzij_pred(23,1)=29; nzij_pred(23,2)=22;
  nzij_pred(24,1)=32; nzij_pred(24,2)=22;
  nzij_pred(25,1)=20; nzij_pred(25,2)=23;
  nzij_pred(26,1)=22; nzij_pred(26,2)=23;
  nzij_pred(27,1)=11; nzij_pred(27,2)=24;
  nzij_pred(28,1)=12; nzij_pred(28,2)=28;
  nzij_pred(29,1)=24; nzij_pred(29,2)=28;
  nzij_pred(30,1)=23; nzij_pred(30,2)=30;
  nzij_pred(31,1)=37; nzij_pred(31,2)=33;
  nzij_pred(32,1)=38; nzij_pred(32,2)=34;
  nzij_pred(33,1)=34; nzij_pred(33,2)=36;
  nzij_pred(34,1)=8; nzij_pred(34,2)=52;
  nzij_pred(35,1)=53; nzij_pred(35,2)=52;
  nzij_pred(36,1)=8; nzij_pred(36,2)=53;
  nzij_pred(37,1)=26; nzij_pred(37,2)=54;
  nzij_pred(38,1)=55; nzij_pred(38,2)=54;
  nzij_pred(39,1)=26; nzij_pred(39,2)=55;
  nzij_current = zeros(111, 2, 'int32');
  nzij_current(1,1)=1; nzij_current(1,2)=1;
  nzij_current(2,1)=3; nzij_current(2,2)=1;
  nzij_current(3,1)=10; nzij_current(3,2)=1;
  nzij_current(4,1)=11; nzij_current(4,2)=1;
  nzij_current(5,1)=10; nzij_current(5,2)=2;
  nzij_current(6,1)=20; nzij_current(6,2)=2;
  nzij_current(7,1)=6; nzij_current(7,2)=3;
  nzij_current(8,1)=10; nzij_current(8,2)=3;
  nzij_current(9,1)=7; nzij_current(9,2)=4;
  nzij_current(10,1)=9; nzij_current(10,2)=4;
  nzij_current(11,1)=13; nzij_current(11,2)=4;
  nzij_current(12,1)=3; nzij_current(12,2)=5;
  nzij_current(13,1)=5; nzij_current(13,2)=5;
  nzij_current(14,1)=7; nzij_current(14,2)=5;
  nzij_current(15,1)=21; nzij_current(15,2)=5;
  nzij_current(16,1)=2; nzij_current(16,2)=6;
  nzij_current(17,1)=8; nzij_current(17,2)=6;
  nzij_current(18,1)=29; nzij_current(18,2)=6;
  nzij_current(19,1)=8; nzij_current(19,2)=7;
  nzij_current(20,1)=4; nzij_current(20,2)=8;
  nzij_current(21,1)=7; nzij_current(21,2)=9;
  nzij_current(22,1)=3; nzij_current(22,2)=10;
  nzij_current(23,1)=9; nzij_current(23,2)=10;
  nzij_current(24,1)=11; nzij_current(24,2)=11;
  nzij_current(25,1)=14; nzij_current(25,2)=11;
  nzij_current(26,1)=30; nzij_current(26,2)=11;
  nzij_current(27,1)=35; nzij_current(27,2)=11;
  nzij_current(28,1)=37; nzij_current(28,2)=11;
  nzij_current(29,1)=16; nzij_current(29,2)=12;
  nzij_current(30,1)=30; nzij_current(30,2)=12;
  nzij_current(31,1)=16; nzij_current(31,2)=13;
  nzij_current(32,1)=20; nzij_current(32,2)=13;
  nzij_current(33,1)=30; nzij_current(33,2)=13;
  nzij_current(34,1)=37; nzij_current(34,2)=13;
  nzij_current(35,1)=13; nzij_current(35,2)=14;
  nzij_current(36,1)=25; nzij_current(36,2)=14;
  nzij_current(37,1)=27; nzij_current(37,2)=14;
  nzij_current(38,1)=14; nzij_current(38,2)=15;
  nzij_current(39,1)=18; nzij_current(39,2)=15;
  nzij_current(40,1)=21; nzij_current(40,2)=15;
  nzij_current(41,1)=25; nzij_current(41,2)=15;
  nzij_current(42,1)=14; nzij_current(42,2)=16;
  nzij_current(43,1)=19; nzij_current(43,2)=16;
  nzij_current(44,1)=12; nzij_current(44,2)=17;
  nzij_current(45,1)=26; nzij_current(45,2)=17;
  nzij_current(46,1)=29; nzij_current(46,2)=17;
  nzij_current(47,1)=37; nzij_current(47,2)=17;
  nzij_current(48,1)=14; nzij_current(48,2)=18;
  nzij_current(49,1)=26; nzij_current(49,2)=18;
  nzij_current(50,1)=17; nzij_current(50,2)=19;
  nzij_current(51,1)=25; nzij_current(51,2)=20;
  nzij_current(52,1)=14; nzij_current(52,2)=21;
  nzij_current(53,1)=15; nzij_current(53,2)=21;
  nzij_current(54,1)=27; nzij_current(54,2)=21;
  nzij_current(55,1)=36; nzij_current(55,2)=21;
  nzij_current(56,1)=13; nzij_current(56,2)=22;
  nzij_current(57,1)=28; nzij_current(57,2)=22;
  nzij_current(58,1)=29; nzij_current(58,2)=22;
  nzij_current(59,1)=32; nzij_current(59,2)=22;
  nzij_current(60,1)=20; nzij_current(60,2)=23;
  nzij_current(61,1)=21; nzij_current(61,2)=23;
  nzij_current(62,1)=22; nzij_current(62,2)=23;
  nzij_current(63,1)=28; nzij_current(63,2)=23;
  nzij_current(64,1)=28; nzij_current(64,2)=24;
  nzij_current(65,1)=13; nzij_current(65,2)=25;
  nzij_current(66,1)=21; nzij_current(66,2)=25;
  nzij_current(67,1)=29; nzij_current(67,2)=26;
  nzij_current(68,1)=31; nzij_current(68,2)=27;
  nzij_current(69,1)=12; nzij_current(69,2)=28;
  nzij_current(70,1)=24; nzij_current(70,2)=28;
  nzij_current(71,1)=12; nzij_current(71,2)=29;
  nzij_current(72,1)=14; nzij_current(72,2)=29;
  nzij_current(73,1)=32; nzij_current(73,2)=29;
  nzij_current(74,1)=22; nzij_current(74,2)=30;
  nzij_current(75,1)=23; nzij_current(75,2)=30;
  nzij_current(76,1)=36; nzij_current(76,2)=31;
  nzij_current(77,1)=37; nzij_current(77,2)=31;
  nzij_current(78,1)=38; nzij_current(78,2)=31;
  nzij_current(79,1)=18; nzij_current(79,2)=32;
  nzij_current(80,1)=33; nzij_current(80,2)=32;
  nzij_current(81,1)=36; nzij_current(81,2)=32;
  nzij_current(82,1)=35; nzij_current(82,2)=33;
  nzij_current(83,1)=37; nzij_current(83,2)=33;
  nzij_current(84,1)=37; nzij_current(84,2)=34;
  nzij_current(85,1)=38; nzij_current(85,2)=34;
  nzij_current(86,1)=33; nzij_current(86,2)=35;
  nzij_current(87,1)=35; nzij_current(87,2)=35;
  nzij_current(88,1)=38; nzij_current(88,2)=35;
  nzij_current(89,1)=33; nzij_current(89,2)=36;
  nzij_current(90,1)=34; nzij_current(90,2)=36;
  nzij_current(91,1)=15; nzij_current(91,2)=37;
  nzij_current(92,1)=16; nzij_current(92,2)=38;
  nzij_current(93,1)=18; nzij_current(93,2)=39;
  nzij_current(94,1)=38; nzij_current(94,2)=39;
  nzij_current(95,1)=39; nzij_current(95,2)=39;
  nzij_current(96,1)=40; nzij_current(96,2)=40;
  nzij_current(97,1)=41; nzij_current(97,2)=41;
  nzij_current(98,1)=42; nzij_current(98,2)=42;
  nzij_current(99,1)=43; nzij_current(99,2)=43;
  nzij_current(100,1)=44; nzij_current(100,2)=44;
  nzij_current(101,1)=45; nzij_current(101,2)=45;
  nzij_current(102,1)=46; nzij_current(102,2)=46;
  nzij_current(103,1)=47; nzij_current(103,2)=47;
  nzij_current(104,1)=48; nzij_current(104,2)=48;
  nzij_current(105,1)=49; nzij_current(105,2)=49;
  nzij_current(106,1)=50; nzij_current(106,2)=50;
  nzij_current(107,1)=51; nzij_current(107,2)=51;
  nzij_current(108,1)=52; nzij_current(108,2)=52;
  nzij_current(109,1)=53; nzij_current(109,2)=53;
  nzij_current(110,1)=54; nzij_current(110,2)=54;
  nzij_current(111,1)=55; nzij_current(111,2)=55;
  nzij_fwrd = zeros(34, 2, 'int32');
  nzij_fwrd(1,1)=1; nzij_fwrd(1,2)=1;
  nzij_fwrd(2,1)=18; nzij_fwrd(2,2)=2;
  nzij_fwrd(3,1)=19; nzij_fwrd(3,2)=2;
  nzij_fwrd(4,1)=5; nzij_fwrd(4,2)=3;
  nzij_fwrd(5,1)=9; nzij_fwrd(5,2)=6;
  nzij_fwrd(6,1)=40; nzij_fwrd(6,2)=7;
  nzij_fwrd(7,1)=43; nzij_fwrd(7,2)=8;
  nzij_fwrd(8,1)=11; nzij_fwrd(8,2)=11;
  nzij_fwrd(9,1)=18; nzij_fwrd(9,2)=13;
  nzij_fwrd(10,1)=19; nzij_fwrd(10,2)=13;
  nzij_fwrd(11,1)=38; nzij_fwrd(11,2)=13;
  nzij_fwrd(12,1)=27; nzij_fwrd(12,2)=17;
  nzij_fwrd(13,1)=38; nzij_fwrd(13,2)=17;
  nzij_fwrd(14,1)=46; nzij_fwrd(14,2)=18;
  nzij_fwrd(15,1)=49; nzij_fwrd(15,2)=19;
  nzij_fwrd(16,1)=13; nzij_fwrd(16,2)=22;
  nzij_fwrd(17,1)=21; nzij_fwrd(17,2)=23;
  nzij_fwrd(18,1)=38; nzij_fwrd(18,2)=34;
  nzij_fwrd(19,1)=18; nzij_fwrd(19,2)=39;
  nzij_fwrd(20,1)=38; nzij_fwrd(20,2)=39;
  nzij_fwrd(21,1)=41; nzij_fwrd(21,2)=40;
  nzij_fwrd(22,1)=42; nzij_fwrd(22,2)=41;
  nzij_fwrd(23,1)=2; nzij_fwrd(23,2)=42;
  nzij_fwrd(24,1)=3; nzij_fwrd(24,2)=42;
  nzij_fwrd(25,1)=44; nzij_fwrd(25,2)=43;
  nzij_fwrd(26,1)=45; nzij_fwrd(26,2)=44;
  nzij_fwrd(27,1)=3; nzij_fwrd(27,2)=45;
  nzij_fwrd(28,1)=47; nzij_fwrd(28,2)=46;
  nzij_fwrd(29,1)=48; nzij_fwrd(29,2)=47;
  nzij_fwrd(30,1)=12; nzij_fwrd(30,2)=48;
  nzij_fwrd(31,1)=14; nzij_fwrd(31,2)=48;
  nzij_fwrd(32,1)=50; nzij_fwrd(32,2)=49;
  nzij_fwrd(33,1)=51; nzij_fwrd(33,2)=50;
  nzij_fwrd(34,1)=14; nzij_fwrd(34,2)=51;
end
