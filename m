From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 11 Jun 2023 09:38:56 +0530
Subject: [PATCH 1/2] docs: Add OpenSBI logo and use it in the top-level README.md
In-Reply-To: <20230611040857.51858-1-apatel@ventanamicro.com>
References: <20230611040857.51858-1-apatel@ventanamicro.com>
Message-ID: <20230611040857.51858-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org

We do have an official OpenSBI logo which was designed few months ago
and was also approved by RISC-V International. Lets add this logo
under docs and also use it in the top-level README.md

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 README.md                               |   2 ++
 docs/riscv_opensbi_logo_final_color.png | Bin 0 -> 7758 bytes
 docs/riscv_opensbi_logo_final_grey.png  | Bin 0 -> 9159 bytes
 3 files changed, 2 insertions(+)
 create mode 100644 docs/riscv_opensbi_logo_final_color.png
 create mode 100644 docs/riscv_opensbi_logo_final_grey.png

diff --git a/README.md b/README.md
index a6bcb0c..bb09fdf 100644
--- a/README.md
+++ b/README.md
@@ -1,6 +1,8 @@
 RISC-V Open Source Supervisor Binary Interface (OpenSBI)
 ========================================================
 
+![RISC-V OpenSBI](docs/riscv_opensbi_logo_final_color.png)
+
 Copyright and License
 ---------------------
 
diff --git a/docs/riscv_opensbi_logo_final_color.png b/docs/riscv_opensbi_logo_final_color.png
new file mode 100644
index 0000000000000000000000000000000000000000..111478119b5cdda1e9beddd5d779e54e7cb78d0d
GIT binary patch
literal 7758
zcma)>Wl$W=yY|tbfdvAKvp57x&>%sU#U;4A246x5?zW3tupkNU0fGj1hlda#1mDHo
zUCuuL^H#l8r_P7-VS1)(T59I*zWT1~2iH(nc#cnvkA{Z!TuBk4g@%R>Ks^uPK0}ot
zKnD_aL-){90Hak;(C(lrSoSh%GH7VE2?Y0+*r+-lRMF4_4UMSx-wS=vt<(k$jSi^<
zk<sxsJIKLHeKFHA=ypK}>gDI|m1G9>#DbV(Kw$*1XML<-7&YqvhkTqUEqZ{D<hY+Q
z>E!URY-Ha$OP0d#bX?5>VrvSh$V-8*-2AwhOm`i_Y-Aakhx$)h3;&p!8tdy{eAIsm
z+8WFBtJqR^(|x+_I0{^84+Vg68N>fy0TYeBr+YKO_hjiFXx3{&60P$dr$<@$pu9!I
z$pr^0F(|Ti?aY{np(XrLK0*VmVk;6Kd3(IACUjPAGY5#@y56MCQwv`|vamee2x&`0
zu+9rcAw`$N>tiRGFxWvwz4l8iUm`h at G-_v7P@|0&GX^G13ZvdA8~h0r{iaxGAWXLE
z9iOhIeNUU`f;AbTx!>6Z)7TubW1^ir5xy3a9L2RG3<o4raDc)Aa~jgPjMd+Q0bmnZ
zbjI-JNDMHp`*ZAY0D>AHm$6Ui1po|l`cFd}f6<`tr#t;TG<ySO%3iu0zpWq~FLvoE
zqLb6->cZ~Hz!-8YT0x~JAD4c at m>OXk%L~yQ{`S*Zc}J<l_AjV7L4Y{nwc`UODM4BC
zxa!kajG`*mvP;PtF|%hPl^J(+5~(CMslnNX{lhXcq>L at fEQ`&huNNJC*$h~z7(p+H
zz$O3^K9MVa_&6`fz(fvDM3ObN&Gl3RV}muSZxs=S*bNbfG+lcBt#yrHZ&(S(iVIL6
z=*u$AksFVnu<HC9=wS-?@5_KOxw`Vs6&qp~I{z7K*;UElY;~6g*{K`wjQG*z8zg4q
zFx7o6*QwN$>(5ZMJs24=tV<EjQj;EuobVkUvW4Rh&gnRX0Z0>y5(UFlrnymp-0v>h
zZFMm^l#DbihpJZn0r`ak1k5z#Yz~td>wqy at x~-?fQ*}sjpHr{DiD`pa^E1ISC#MfF
za{V`c8zf*DIgCK>e1WT6#0zMi<H(rcnEJx=JLN~Ho34=+lLI+`XY(7!w2eL{L*Mt}
z#}s!WaB`usWlpp2s=DTn3dMbKJy1e9hn0qAf@TEHl@4E$f<LnhZ>;bFDSU+t6LGR%
z-(-^jK%|Lpndbn2N`w2Ve;qB)5$G{U`xU{ZpeR5xR&(09UK=TVOg8 at W{w>&u8&E(6
zG@!4MKCfIhV at a!gtM4rS$LvLYIS_a?&*w^Y)3SRrBn4uL at _sDfKe-YL=-b3RkTbsU
zrJVQ56P~j8cmN7o|2sls^A2$~7JHOllxCZ?0uW($5?(m{ZM=bKA?8bL|8aisK~>^)
zk#g!MDW(Jfsekd)34ZNIZQ}VD`^$A(#BEID$g*Lqojo=6smi^w-_=sYl-6(S;1AUB
z!Jb|8NCbLg>F(W79v6g#i5Nf%-Q=csd`WL{nV)1em+oSF#NFI at ULE^LeNOsh4HBE%
z5KfUu*wWD+kFF|LIYXSH*C{AMMRoH^a`zr=Co`ZBlJ8Z!Tz)4Y5&@zM>T at m%L`Cqn
z2ub9HWvZo7Ye~Ty at 3w~h%(D{;y~~u<AMWNjBt#1eK*@y}rA9=zP;nF3XkFx1t919@
zUev-rB-L{#(s`UZ#5VSiaECq5^%Nm^cUtVoFTwBGQYHdkSGaK=dV?D)ceFp6G~(j%
zV*aEf`IZ>a<z_M2TlX0^S_28==nrgu-GQfQ78BWQ1gt<bS0C*4W&AR&v!A#oXd0zp
z>@L!ck>~O3#xE37rEZkFBn=@b$lIMUPcd8l63mfwZPijOmZv(2X?~~k(eaLNUS&OA
z#i_q$8OJ6e(c<hMp$cxNUiwb=%xzoi7VGCZ2Iq5yz-v7M?cV|Cf-@0REUi|%+j05k
z>DG1Wicz7{R%5|SR+Cf0Rtw)got6S}bTwOoOyZjT#>9NW6Bk$ip1S1g1{%<cxyQfp
zt^54mPd%&|+%6w at e(|o4yr^}<Jaf8Ox82)i#-|Pkj9ASrzo|pwb+9IXexBEY8JNBw
z-8t$1mXY828GhI&dRJzABVibUZy;v^DL9#tQ9u{IUuml8(B5X4d at Vvi#!TN;<{j*M
z@Gg2SfJj3EcNprQGr$@y$bcu}vZS^|@V{x>z?2|wGy<HY=nmni9u3u(c+7Vu0srbh
z9&}6M0YdsllM=n>9StEW=%PW#vC;o(FDt3CsILk-Bg;b}3#b;-Q{bdOUXk1`VDR(R
z4G&nQ9Y73LOe+Xaqb5gY;=>x_IT^zhWA%guJT1 at 5w#&dkwjXZ-%Oea7bYGg8FDdLx
z{*tG6q4##Zj<V+^e5Dw%#jP6ut6I0c*?!;X<Tkc5I^v3#q$%z%2LofD=q3iK9w`PJ
zO9tV#J4C{J{H2=eK-x{6w+J4_vn-33pyzQn9o!-E{OP%L9i;C9_n6gGai^^7J7dd&
z-`^=hdK?xuzSs~!?J1U<AoXuc%;*_gR3Ugr&ZQ!=7^9T9n*mPx6S_5nY{|;&mdTie
z+kucpu@7<kNhT1IBtx~ky$P;)os<krjC*5^_kSvzbuFnJu5zy&V`lPl>+IDgiP(iS
z(NJ=*_2*~v#SWeoGMA`si&#SBURH_#GfZ0eZ3sqke<8nIRM(CynI3#C;Bu6CU|%wu
z&-Hra#rzpgF3sawQ!tcTL?J}iebPfenjJ{|Ss`|3zD&kM+qL6XWY~oRBsvkgi;k#$
zYK2_JW(pSSHR8gfFu;B0QU}%!@Ypv;l=e0-#`t^2v@?6Q++xlO5Hoo#2{XNqZJ~jd
zbz7!K`SId$Lh1ww&c=Nj1@6d=O4Q_^Z;(EfG8oP<5d}95$QYhFOhub4%Yk4sxyt}>
z(unm!wO^{BTZ#s`p4>Wm5Fi&PCYm-BBZ;bV4q{ZZsM5~J*t4(o3FeiFiPd6P<Z^9z
z<u~p(DHMn90tA&d&xU7R>o%l at WHJq0JIlm|0fd4fKVGrKf7;4U;|Y>kqbHqL{AA4w
z;@+B6+UM79N7L>}Sgu+8I1pvS!M(+<XHbP*_n;BtTr}}{_bhgIt5bu-%~DjV*2a0>
zbza%#4BZWX_m(1nlOEyAY=}L21LuL7x>8!1oz;D^-^IX~+gRHx&z#9(t;v>J_5KVm
zuY!CUjVgW(pZr7~eRO|FJ?}xRCx-l6u at f=V+^4_ahk1_}x2)U99lbp&^u_|<D-vO*
zZ|od(IC0W*+^y6!73{ZQ@{V?z4~Ex*!033mH7p=3^}to-uh7F2rO^g=I}n%WBMzq4
zgnEFtRl~+v;(o;IL~gd(&VG8ntM~`i%eJ-tT}i}NOw}BIEwWKXI2wmNYw{=UcPGxj
z4eIYsjd&4Wgy9?ahOv1Vp%Ia}fk!>5l?kVa2Sk}$(0kFn)73oQnZ{($W1`mAoQ?aw
z=LRMmx+mLzZo{t=_Vf&+2d9so|DuRwqrxA(@rc5nDdPN|+hOIT??V2`fT3*QEnC{r
zEP}^wwIx?mF4_i<dy81Od3B3hDexyb5+ng-tr at BV8o!Z#bJ+f&YM(W9ylsoS)@&@(
zh91@O4Oio*DM%My4H~_<pw{B;0$$e4+Gj5G^o^1fsaKw+AcM)$>KGtc?ib<cO&D=F
zdM!2=l%!Kbx4cUFnNyd_AziE9`JQ8k?|f^yhGCVzd>w(uzYA+N^iL0ad140o-s)gV
z#pJ%u7I{jfYt5K&#LVkKI|l0HZdCNVypP|d8~(%tB$=-~#&2*d at vlC0-PT~d&e93{
zQFvn^8blOAaN#$ZFiqMpw*9-<?EbLzXvoZQEVtg|Bad@pJLHv6EamfINrQ>J0%?e=
zpKsfSDTC|SgMM}DTdzgW8>7*F7~pIF?^naT1``a>Y&$BmpeeoAey9BN0?!1P73ozd
zROj=n2MDno82qRH<{(<u7y?V`JSf<3Y8HNyE(%-<xH~+p>nR at nIt<Tv@bs_@-RR|9
zu#iO`CRqjl+3>ypup6bMJFZT5(PG=UW3G3#k?PX*EqEO;B-}ujgne}{*I1eP$~z`Q
zV$mNDVnF9=!jx>PA^jm%G$zX6neGC4czs6X%(-j&Cv&(0H~z-)6UkMLFFh$C>WliD
zd1fNN)E!GYC0%=a__?n<si(Gk*8q}cFvf<$)rvLZw<3dTvh%!&?BwZ<ZQ3>dft|%u
zMPtPq!f~wVO9|P~gHekq_R7%@&i-WiRsd54b7x1>qU9c%e^WW?K4U9WE at qmJ*7G4S
z- at dyJ-RLBT{K*ID=rT#!EDlHw)!Q`VEBE81?~d5GXF*SWT7VA;tOV$fJ<LX>-EE3x
zvauNwq4p+84ekEOZB-v8Mtx%0t|+`E7!_FiU~h?zZBi0Amn8I=3B}mYKX?E<G}PX=
z`>OS+I>z>yxdsohI1q+~iIN%>z at WER0N?x%oStsZg;i_aiK913s(3M9Uh#1gvp!FW
zz*UkeV at dv&Emg at OUPU@=F!4??7^N4CEY|-srysq+!+RB&erAl1(!n#M==8SIp`u_w
za-bGzq5;#|)Sn`m%L$8}9 at Jk0<XdV at xH*Qr-?-;wiQiEw!LB<S6}CFbTDF?sJpA|g
zNBjf#SZ6L5pM6l7Y8rKaz1HJ`i2k*7%Hcrtxb+ZXbx=L=*Q?(20sg^t3z^?^dlt85
zo_!PFakc-Z_Jc9deSGx*0p~ms=?QY(=6tzANqQxf%y{cxaC<<$@^jt8=Xb6Y&mLdk
z!=;7$=|@KuN)t(oChzwMWzEH@o6uSHlQ9hRa+QL2_9DQ<H32Ue43T+}M1&p!m3Ugi
zwsIeDiSN*X4gc1p>Gzav9ARdmTkW}fz`;a at FU4B66T@WMiQrP)JShs{rEM2sZ%#T7
znvngG?R2($LSju1>E5fm at 91*K%*?U at qY7@<kju7SZFEg0aVLG9w4q#i3p-0F@Tb$`
z3}S}-fp&!i`s-mXU!{-iyE%6Ppfj^}^~1@^6Xm9&1X^Xh!3kQR-Xp?uEj!o~vi};G
z$o+C_knUhgUtUy_^FsO~)QT)9L?fuCwq(C$E9N1hZl*6lzj|g7z;`p=8rJY7nf$5v
zCmlAA_DVJ_?-*TrReC$&fHaw^DJ7Qb=^4$ZA=i=Xjh<DNNbl_`BL7<b)I)fTXXX5q
zA@|CnTHCpMkZf%?Q1qyg*e1anPx4M&mq3%)B(>t%At1dhFF^2F at X-sf^=9<n%sby7
zONU49n7)3daJz#(44_wcfZLGS2Wf71>*yj;JEr!Jma)6<Re2JfIkptWkR{&}6yFR(
zMQ$$+j-0w14a{5G))W6t1y2TKzrz<4=0*zayOqR`;$l!U566s>>2u#beilM_d36+E
z^IBuVt|y?~eD{x}lRN~>$M at cJ%^|2sfj#MaSdH0FQ~EFKTXndH7ll^0dUWEj(+Jc}
zvj6eEzeyNTwSFm;TdzvcxE9}H<KkAkA>G<+L67kPcF2r-Jx=n)L}A|A{xeZ|n)bdk
zW^O^LOU^BAR09D>?^RW>#;!Gi=CSFT=+phlO;&#+61pIeCv*O`+fmVO0L-u*z7Y~L
zOXS}u032vdpPF2Xwc$zR2r^z$hzaVmx-zlD>c+tPC at Q6XOcUhZzAqG#a(6Yoth@^r
zy3H?O&t8fm=6VLqn5IIzH^2U=Zf;)pLmAC$-&j7-)yJL2l%uw*$&3Fjd at HNU%%Wz0
z{~rQH{zJsIsK`J|_N^i1TUTtXYC?>*S}Zkbg9*NFI>X6vW`vq0`)Xh4ao_3VGy94U
zYea`S5 at _nBJ3+M8G})NVLv9b_ST3>JCulY5P!f<E2FCicSg+G;?`nqo?)f{1>2jII
ztS-`M^?{I9UUM%t1GogBL{E=@wLx0&qM0PYgvkjTYtx?_fZivv2zBwfR|;*V^EbcV
zHiOJtcgsb6{XWx=Ifq99=I{B2gDwO6Ow!B|YbEX4<#d10dbwa=_F>s<-Vp<NEZX(C
zE=Hg$>vlCszd^iN63$HyssT8Tb#<%#3R=F+z*S;#GNo)c{4zoqO|~*Ov9GXiyNE5`
zFSM~RVITv*>yv+M`KHh_?6B!-8N0lNbM1#~`c$oeG}HfRx07?xA32+-xoO8OUn~rp
zu!=iuVn4jG*z9a>3j)uUkZA{<YR|F7#)Mu0<2KH<SCCz~QFJZx@`Z>ih3-2A(DH%P
zSAvwa?Gnq@`ihjQ_19u2Qga*B1|hAY7)>?7R at msp!n|hLu-kd8wntI1AQ}rjC1QW?
zG1_s;ybMOF9K)V7B-5<1DlG4fCwV@oiz=u8mlQ)~NJ+;-V9#0QvL=i1CdkanZffl;
z7!8phMi9YizQ|%hCtd$*JT;~h%0u50jx@|r<=XP1;SlIOe9ANgspkPV`K_pZRn`q>
z at Zq_o@-h-IvhZF`d5YN2o|~8IWyH~9IS)NsuZ$mPFGPW#y1+8reZyl3KnmQNAIp_P
zIs`17&ElP%tA(Fl8r7&CHVeK!M4Mw)9-ruIeS^{P1~2=OvPH_wCde0C5=V8#iVYjc
zAt}q=1rBLO^r!-BmOqHeiVn4&?Y(Qm95f!)JEhFLmQ^MiNfXVuP<qx(?MwFf!_*!V
zHpF}qqpAXn{^<oBw}`OZrJSW*WarZCHhpWD{_F|p74(ClIk4tDHW!FkpykyWAgN!v
zNg8`G`g1AAhRY{*Y=?B|NhDukO=<pvx>5-lO5XHKPHjicKV at L?37|Jap=uW6-C`l7
zZI at l<4Ti6p<$X1V_gG<PU1|`Gh4-8Ndt0M=7!Bf5b>h|`@V&;+(<7(bAw9BYGHjk;
zI}up~JIoJchXEw$%vmq#nt?xyx&R7w?Ac)Us&{!X=@kNbBp9^+>W0>fOKJ69d{vwn
z9;PDjcgzOW#&RyP8qc=1 at VYu+8AC~TON?rpHB+k($n29XmT5AVh93plJAF#-$L<E)
zZ06W7DHf(Y+Nz73eJ1CkT$8GP*wkUqWoHm5My8)3T|+=7+yD&7bq+?190R99Y>$J3
z&^^+oGB at wRrP(>h7J4#oK%m$6>n!6oFqynxRhD7FJ!^-?)`L`g*X*C_&rQQ&A&l=^
z&w_#$v%<f!AgB}#>I6iS(98G=F*BZ`-iTs9^{PWaXo@^@#thKURwb-cvpA=T-Vw3C
zoPkLOpz~{q>}Kq18gBj4L8aIc9(hse1EajOszp|4>lqRpWTosG3WGQaYE;qeaUpH`
z`s1-!3zT)P{|>L4Ktf<$O$zmrm*7E<UODh%l;+n<1rdL4WBcw8zP`tS$5O|Ei3#~Y
zvNk^2!87Cy)Ex{d&~BwncUV1>t}_tS<i33SEza7TFsNYCOfI%3fs$NO)?e?|12g|n
z;X$ntaJ_WnURU(9xytlqo9RoxI*Z8e%1<~<_BM1yVCNocUJaXWqm8Kd)r&<9?%zp}
z`^jCep5Of`v~}0ZmfYbcKmG}whP8iX{9VRf?i at AmwbAc`13k1w<d2A=)`dD#VaOh4
zzB)8nZTEBVD#mrUu23V@X8=h>gJLrJB$X)=i_%spi{!3dl&<7SqMa1Le1c|%pGsdr
zqw*41LSI5PKAayER~hjdot=F1<V0>2;(?)R$wJcdfH*dh_rbSYwdsr4XQ89<lK5R<
z5o>%bY9aBMz~CiP(l;TvCd5b}G=D|@u>WgAdDWAtWy~eSt~!xD$WL7}A$rhO8 at XJY
zH=Gt!?-qyuYsu<9VnJ>&RGWzw4?Z2|lYe+VZ^L79%zR6)Q57s?H7iunAAG2=&OGbi
z(G=$0BrHjCq^FDfh`c37gwmVi%V|Q)I4X^#?FFpX#F4cXI0pcM!S57aCVCa^@+BX+
zDyQwTUfv$)4(3qYe1pADVxUmiGaBxEkHLQDV;T=<y0{rAJqmK3=Y8E^Rgm%4r$w0l
zi9PM?Cp~#<hqIHzDKcm|pkM5D<s`aKp~Is5g?i^!sgE>}cMNmaFD at XjXxF|*+0*ZM
zel<v)zC-jdAg6rLp|mgH9f#!p+(pLa{KGoU3}Q3si>j3P3$5yvY0fndrL^rUA%{P9
zCpEY2 at tyzpDy@Pq8or|(#oZYX)Cm!PRiWp=zZI#S>%$jV77^xGZZ}%Yjx`W*Lc<Ik
zP{I>u9LF=I1S<|8yeZh`ytYcP!F5Tg811NBIlOs5MzpgCJ3qm?5G-s28dfi2!i`$5
z`8fUpU=@|FJ^uXp4XaV817R_RVsZLe2_}mNYf4lI?F)7SLbBvIta4P6n`{@VGm%G>
zyfll>ODOEi#-jf!F62G0Dt-f>Z(RUIWTJB)$|kY1JtuELjUt?SMh5<+usU*s$M}fK
z!`-Mb%S?s7<ClFWky|7 at lcQ$~Uq|EE8f@sa>~Bj(x%q_p95y_JjOdXKufh{!BmRf4
z{)h)7g>(I!_o|m}#ATETp}=LNnwSkc=#Q>4ZCDvjgig;c{ci7)LWhSVC{h=_#vTrD
z!q=Jpe6rr1M)s$gtG&3A at G82zTbPV(T8w8-6KefP<8@QBP?$iW*lZ*$xU6i&FdtO8
z!*dw;DVy>l<qM?$o!c*AWh0YmV@YMjW5c>j6Bp~Mzi&?#bSqbuG{xfw4@#$w?$gyM
z6d`c^)~p=4I@|F at R@uG;GrFQGgefXVFQEbdm6uQG;2(j;$bv)V!+e(~4JC9gV|}y&
z+Fm>7kTsfb^=yAv;yYH8rrtY4nsGOp*Ao=>oO*vN*SRFULH^R3A+6On1J`9X%>iS2
zg=q>cPs*EIDsM$R6ZZbQU%iz?&T#5#%8qw`ceVZZ>Nn;nbCgZJX}kVbyxse2np!9A
zH{dlTX2>Xcv at u4Nmgl=lgVyQ5rpty_v0;=WTKLsA%-K-;pArAs3T!bI`ihFt;*#r^
zpo`}|?tIj|s-gU(U<BpgyM5PSJqw^TGc=CT1`sndOIWsA5iD56N&4MiPj6@yQM`n#
zYOYCtSOFxD6Yl#MsB*8c`3;y<NSe*|dYjv|U#x9u(RSeD{`1}W8CM^-hS&yz&t{aC
zJxEruQNZsP|Lfw9>HGa*Nbf~l6Jy`K-pLv4fCUrrk+lE at I<8%_*NPlgi4rX39oxKY
z&zG3~=8_%t=Byl)Hpca2(G6&KthChYEeK{MekIci&v@nCx{Y#)>&J*=h_Flg<+kWw
zO!Jz5cj>F599spyp${}{f at U}dINyJq at Si`UU7>gpy>WlaK(VzoSCL$nt at LeA&s$5v
zZ*JkQ+uMxterFXy3;ZVRw83zKCZ_<fqD0O9(fxxiUKyzwAE=O>2Lq#~lecj=#We0T
zSr#$x;5JOp*vI2F(J9vL>0lK9Pu{A-ixtxhj;KqWDz4qv<r*`U0$-;8r4Z$v+l(j)
zQiIy#GG2BeG9G&}uue2K3O@9Xj402a#MR^BzG*J;g-g<7koY(Sz=biVt7_EgS;PO3
zcp3{I=^u^OLTZ9kHkRtPxEwqztvG2eSG6uo*_=~EoO&Elx)ruh0v_vfCfFSy)hu_^
zm&|NDFvyaV4xXRzg2gNrM-R<C8>o6FjjJh>O!=Ygyj$z}_^IOJ{qQ>!zmcA=$@G{>
zf2I8i`85&n3#$*q)26uR8%bHEsbS_NimB;J2T$$C(!&(zdQz-vUcTID2XHB6-?Fmc
zLa;Fipq9_+xWketL2*Uy=8)kphgZ%qR45Xq*|t3P1r;Ye5ne~armRDS&sEy|^3rIe
z6Q|&kTrIFq$~q$$7Ox73=b&N*)pj-D&CRKej=H^-p=V;TheN0 at 6{vg9dh%C^GeNYP
z{Cd*)T`%FV0wkpQ<RvT9?Pi1XTMbPk1JQ_Z8=ke}9p+s*D!iy(znRNHrqruOCj6CQ
zmMIu361(sDZCv~KtBU_-e=7IXd1}{Y6Yo%D;r}DN{|oEG-~>g({_s^=)fxi_J=&bJ
zkjQIirbLt%{bHeqxnew0G#6<*{X%Ncp3KmE%vyfum`XfVvDDxbSq+yB!aLq=;$$9d
zVGW8aiMT=3CDk01&!DhlU8W-SfIUHoh74DI5vlA40(gy9L|kNwp>YUOv_o`|>^}fC
z*|c!is+bz-cz9Cg+Mcz0?SHetQx?zuAG9hKejT*C;j<kCWqpfcz-UTx>X2%%Md*J4
D0r2r2

literal 0
HcmV?d00001

diff --git a/docs/riscv_opensbi_logo_final_grey.png b/docs/riscv_opensbi_logo_final_grey.png
new file mode 100644
index 0000000000000000000000000000000000000000..a370f4119d6b4b1b766df3ddf539a4b6c5853577
GIT binary patch
literal 9159
zcmZ8{byOTb)Hbrf;)}a1u0_k at EU>^*pcH7aQnXkpR-m}sV#Qrbf#U9z;tq=yE5*II
zYmsk%?|Z&~-Z^J7lT2>rCg<knd2$o+>ZJ-H9xWak8XBQ09Hxzih7Ll#4+61KDKn^j
z1NA_6(N<AFs~n@>MP&fi@*47JXf?6;_hwkAJgyVmzy%GBsOP^MeZaB!JsKLTkt$67
zwTJOxwrUc6U-|%My+B(@gR7mrTUi71L>NGUI+~FBU?*I2`*w8!Y3q>Ff<*S!$&6oF
z`OtptFFNh=lT8<rrWOPSLuc`7LAmeX7`Wh}KP14kdnN0n+FFsi+LZEA<lWP9)ZCjH
zisU!xG*36}0xa!<3P5lO=zkK1PKL*oyicimy0J2%#~xdqzk8;O+xMDk{T6gyqwih~
zfA!o#uW}*@jJht=^E*l&`570mSLVmNA4Pd?QDt;CtoN<k?!Jn&wCb*+T)+?*$>erw
zwB}!_hfuhD(~*4X(wF_X!gA_cWvbBM^(4r@@yd6`(b9L){K}jC#clAGXI1aFyGgeo
zrOS<yCcjE9b5JsVQdslK^1<B&yerpmx!s?7MpMP;!AJ{6#o@@7-l|aloHTAWA1o99
zmW{bW1%u^N6aWU)5+MbFVWV(p2<SO0I*Gz`^#3VLOx>+V&KmtqR(dpnc#C|X+*!Hx
z=Oww8ozV>6Q_*qs-Nwp3d&(h at c2N6c00rTs$kcrj;$lo<tO_U$jLKUJ>A}T~ZSwxk
zFOtzv7EsORRi_8X2 at imC!8kX1dmendc<s%S>+=KRYH-n=Ti8a at ge<~#kB<eCcc+RL
z=9WyrXZ@G^bECKCJBKTpvbViP%}!mik9%c<p=}5tM$nrxJ7XL6Ll)*{9!(D{HH$1q
zgbklz{UD!7yO9D|GANN#GlN+6rZY>@jYky at 0=*b9%KQuhg#-iYUqW9n)9=q#)UAVI
zML}r?ORaN@&CaYZ)IlK9=N8GL*}C|^%Hi0b+9~TA-QZpiP=ftJ<L&q`^TI#PwqLHP
zRzXiq6sB(X4SHg~t!1OA1jODpeiW*+9=|dnQGjY{#<u)BY90NqmWoW~)w|c at zo-vE
zckr?l5D<;h#RaAeX#T84%AOl^__gsTa%h~PghIY0eviqLaOwB&6Q1MUZ|k0LoHA#r
z0D;UIHhMR at aF|4UdU_s3z%Ww%zxr&=&(YJELfJp{3ZzecL|+?tDAF5VOc`MGMiLMa
z-HnHUY at twWY;5FYzRH6hpFRt#G5Fc1FI2S!^B89)#$6cPfm`5HP@Y)YEXXVZM3%mn
zT!E^QKr>1XT4%I$kw&-=+LPqTg5nTqKrqHSI34><COb3o_=c&<)Yt$B05dmqd)zR%
z*YB(QfJ=*Vyff0^Hm+8YdQO&pYstv+I4j&i;<mFL3*v#BtEP@axl$tc1a`(en`Z9}
zZ=a{f2dlZtcUI#$GTW<N!P}btcZul|E`{l0_8GpK<OpCTvf^#iz23)g4Z-Ikyafgr
z+E%`x>&}B0L5WT`CuS~xC%{tK*MA!98plF#M~N1IlhU$J_b%sWBLbOZoG;VHW&a`D
zullG=^!L{X<5>%vn&w>HRjT;=V!#~T<Tq&PhTu_~nCPEL=1fT8rFz at MC%%lSBF#+H
zUk#rtd2-*l!!jj2ojG42e%86{ygZ*&VY(gfSCpcrp@}$z@4mO?1oMWNe&Fc&F**oW
zKB))jOeaEZP5d9+&UcHx-c>DbZ;xhfH_RE=1+l;;O|gznHwGT8Cry*-r9LD5DG6)(
zCNk1%PvlvL455M)!+?TccPZ{GzL5KkfiCY5E?O!9;|nJCo=;C~HWtmof#Pe;p`|e_
zcIaKc+*_BXo8L*leJh41s7r%;o4?SW=JJbWm17lrOt#OMX=vt7cIsjWN5V`@zCLlK
z8`N3d#;zOGm at EBG5U`8-uMutorf1x**nj-^aj$YJn8gm8>^!8Vr9JzqBw{(7^g2=C
zwmgn5Q4O6tU88_WU6B at IJ(R%y$O?|^>yM$c&@o`fzFu-S*_+w>CYGv3Rro%zfFf?D
zOpkLLW6kBLWry)89n@#O-W&1RnfqFNiULGfPQ;hUnd8yTr(d1B&Kw;4ncTzithbDI
z$V<|CcR|FHF9sh|y>PzG`??v-&ll@`+%~74BR%i01SG-1%`oxWWq(Syk0OLnXK*lU
z%3LO04wVKvJ45RG2&C7!6cDZxemS1oG*9W@*A8Xus0v{X>*&*6 at AKi(AvSU-5e3Ay
zwp!6Uew4G5#8JSTNqR6g%WwKkk|m0vU at 2TIcbr@t%tir*`I(U?hgKJ;z~KEF;hLnN
zWp#F*rzX8&Z4x}NBzFC(KwA)4OF1Fn#EQqV7N`P@=bb>es!M4RamMJ*^r-7q1g=4;
zhQ-=q>8Px5WslV6GxyhU<Zc3=;PnZ(?tYe5FK-tQ{ErJH{+)Wd94$(?JlqkU-yQ-)
zHI%NE8t>0iJ1&@>1H>*Ky{nQMC#Jd7!%zEC-P6<{9GRg};iEq;>5!Oj8`B8sW;2(M
zDp$LC!Fi?wQm_J8R=`PNp?xf82C;e9kErEk**aH`Ug^8v8&(@_`=iq(Z0D5b^r>y#
z0WZ>@_2L2@*GFHIGISOUC5}$~BB}FRlAJm;U{wG>aeix^?OYiIuu+9UbW~Y>f#ZtZ
zhbFXJPio54B=kZ&yLdNsETN&l2gLc||2sS)=>^DZlD_XnMRVnb4ZqaW^WKbO1vBeC
z-%_nIh4+Suc<7`gS>^NmS=OhPX>s0AE?op|COXZRAiPiR$D|TBb`F%zmc4P1j}JK7
zJ70^jmZ;`QX+v#2yi)@<ldQk`ioJQ%hw>Q_QG6E5ggEBVFfdf4&F`IUsafswR;BGj
z`W<T~xm-=&tIc90ED}aEZtcyKiM6<9bTdk&3Yau*9n9BRt+e}Yx9sH9Em)Y^_D(J>
zStu)qjfUXOM*cN&wRYudmIDr+Zg7$+y&qfjwEA;#^PsO}&5FKjTK#g_%dSeoiP>*h
zGuArvqUg6WbQ1$*K;-;8R6}w8DH=#sf2zJ-)kO7`a at T*!i0*G&_j$qqi}_ob;bbt{
z!rVgYkf^&x_Bf$UV9I%v$M0%-J2rwCpMGR|PMm0ajk_E7xcwI>PJNaMEEt~*!YA$A
z4X6?oGn!p`K2`p%Zq}dUQ+M;$y|X)(V<ce~Vm;79aFGs67ydoMdZt@h)nyxb`8DF_
zuivc-o0J?GeHwfg93S$n@>yW`+r$}``T167<Q4a$Gz4?D5*^gU7~SO8T<!N~YUiPP
zwCI&l6tP33u~}Vz#8KUuM5c=jsAo&g_<yG3i?y4pOn=+7M-`_^#+i{^rkmk;j(x8O
zd-=br_6R?Ab#?s~A4o3K+xu*W$VV+XX`%R(&!ux%gcV0_m4wU37#JDF9v&Xz&xK`M
zJ*To{TxR`srOvlUh02b8jJ#AQ;}6C+(kN-plGD(GT83;oRKXb7N)Td2RaN7B?|z7W
z)}Fhhn>*}o^GXw3dnqC;Y<?b%FbBV_RW$3hG&Sw~xcqY-8ELQ|wD9Tfg4<>H)1mRf
z`(yDD6_wFECAG~T<e+zxM3`#9n+j#R6~c649|c9MddIQbJkNDp_NKXA_I2++EWNn6
z9v4>331y8`opn&=J}c}MirLcZxJzyT{hh%L`0QSkDT?$)U23>t>&>^jMW2(8{^1bc
zRlOd+*quW55X-#x5;jz0<;jnJ&qB({43Mv3Ls%4m?G<HjyKv91P-eF`WB15A(-p_>
z`9^Q4LGmiC$ziE>#pJz8Hl3P~Q#Xfp(jfE$EtT at f?E*cm%^z)C-AzA_yQKL#cgNB7
zF6XeYl(g?XJv9St-zFCvQL8AKeI&||_HIt5RnNzyjy(u}UP%{E6=^&lN#PgKDeAWt
zW^Gg;X+h(k`1HsUL<cR;%lW2TSZdPjw2Xo{10Ppvda^p4CZ9Afk!eCp<p!-BVn=}s
zZfo6G=gZ#52E4FMY**;WZPXwNwIKf;cR1>h>y9MzrjFL+hmRh;YemNQuu+sc4&QZS
z;UhacbDus+Bl^E7h96vb#7os at bri>GeY`$en$3W3mI;h*sZq5l-?z^{Zf9<Pr!o<h
zazCum9jFM|98T{1lP2Zfm~Ag<Iehc{d8fOS$4Tz(YA`X%%9d5hU=$Jo{hoIhwsd-M
z(s%(GbcyRzmF>f(>vS?>#rE6z8@~4qopFbMYbSp<<5Z5I@Zl(GfhDW!jA{&vr{>=g
z;OSMoI$GL~7_ at y#K3(+Ofr*Iz?B+|8lbb14r at hId7)j0Sy2ZcO>sMS1KBi2qhu6!f
ztIU3S%u~daaav`dqlyTgY2wwZ6s at zG=@7#@O%o|v;iI9A%$^FobYAbpZLLWjWH&-h
zoMV7ZIU9Vr#l<=gaWT3FxnAj*=eQ{ee|(g!`+WEVrJgRyg7Pa5zE7bk=k7es1jrqD
zWVoxF+X6sNr)V~XfneXF#M+asqV{1kQS(2z#*5>wB+_YJQD`IKU!>ru*?E at jPQ-R~
zuc+8#HB}h%Mw5GhkoKLJd6<f_#s2!s!<CK|Ls(u~0SPGH;tPY+hfuaJHGLlV$dg~}
zVvZ_?cV6Bf7g?Wy_5soHREs=X>TJwd;Sa|8E}xDTTYiT{BNlzfX)~Kx38$n}cXGUs
zgzBs=|5ZhYw=k+ZBzln3;lgn`zqlZPvrzi?swVB`p}YJ0s`SfBA5#eUh3a;YF}_T7
z8n_uB1{-hSP)R`VMn%)|i;vS&g&GjzkA9s5$f%VQ+qIxuD_7T+m_S%yUyl!QP;;&9
zAEIaQ=Sr>TQ9?FI1W<mIjU;`3#=b6DBS%{H_O#wsXY_1qq++7ic^gTy|13fwck6y#
z3;_(((CzNm;2cm&mvZb}Y_iRNXRvQtoC=U{e)f}-;OoQb0Mpxj#j=n1IEE+*^N+3}
zq3!^Q#BD2NHpC_@+|k;u$@>SN(R(J9z&DDEtRKStwSW`oC<kaE|Ar&o_hv2pk#_@Z
zy;u6CY;-tz<nZ<7bGzA$-Kl&sK~|U#W7I9|n>-cDUsGqs2FIrtTyi(_ at amR}W{Nqe
z8(Df^9T?b6+9ccW#BX*ZFcf>ND+pK;>aDQX{vJh)m%cPjiMDBA6CrI0HrO>B6L1K=
zbUIlDKN+~0I>)_>2EWzv5PZ{+Ws;=$>hfewaeK*qrGf`-*gKX%%Ial~H22*1n_Ntk
zTwYhU834<Ujh`<r|BLQCWk%%4?Zyt@N|@>1^@BELU<I~4A3N-P$jkbNsQhbG-xOeZ
zTGaoS=pn|yANqW>CqMb2zSu}~fbtwBF#fANO(2OHIt4_AJk>BqV!y_f`7HO5+Ng+T
zkEja=kEg_thI~7Ip;0S=0iWhq8Sh3EVT1fffP8&@uiPememh0l^?op}jDI^S<$LEk
zwXk4UHNLu<n=Wh_Ihv~+=5B0KXQeUkX2D)FqNJ@RoS!aY{bzhjKZ=sS*7Mab=w82!
z_to!>I`Ujy@$DaO`^adT$rjx`c2TkhWBvCd1;0!dtQjZMod-fTNUD0R=PD9fkF8kj
z8ky-A)ulckRJTr>w0Sjr)M0-n>M7Xlxs=1cSZ(l5S||sl<DdF)|N9LldpuaBijxo{
z3p9W8u0|}}4k3O*8{48QBO~*@U<`=g0{@`F36=SjH!)u=9;Z=@Ldxce%2LMOhYeu|
zmm}73JZ49We_zL6DiAGVpOxx?VzqxQG&^RMZQVaB8I2NXxA86$l_7!fLkJ-lkZ*&G
zuzxX-<!VA%+a_ro^PbDistpu9NUwNg=ijJ&*LpDg{tN3clz)JKCpOW5-0GViB6zyd
z`2(Vy57Zl+z4CMtE;sEu*+NqT{~LiKb@zHo`SRtqX{pcNotc!x*iIE1KwS5xYes+8
zFgt72yr*ptPAfmtm(XW%)<u6}C4SKsk>q5iTV-tju7S at c4r@K-{0Yfx8N+AWMTb7k
z<oO-UDrC?L1ra|J(}hj!b+T;+5fBolv#X`(e@(ysbZ%ZUQ5Gr^u9+b^6dfI{@Bdnq
z((Ch80j^`st~tZ`&bUAeVKa9xl@n*Rba!60)0#pnFC(FJ<jT|IwPlNO%j3_l`YPnj
zTJ-o3ZZ2$}CLAW83BRfjYma!=w*Qu|+pYVm=BH^e%_QWWjfju*#BaKOleBM>k`szO
zTxg0VBlar(kJd&8;y0g4Li!>pc#-by=L{}$@3s>6ZwMUNJ||GcV8s(VR>w3?L0gE7
zsHj|WzX`l;L`t6xvZCCMsN1VLU4+b{|I@=&JJ1l_$3!wKXiEyWGD%a1=V)v^v$lXd
z$DtmpJCq&or8XVTHiyGt53$@q2Pv_v`0mXh?w%7%&*+GSY-SGIut|~ipP!y}hq$|a
zz&o>FKf)A(nODODNY;u{E4~YzNVUZ8f+dJ#M7wbT_kwG;L at 3BpH=s%eDzqM`-xBGm
zE+IeSaA2sx`!aOubXooDW{EyLr>#{g+sx}^Rerx+ye!t`=jTJie-f%EZ{3fV?Pc%&
zvOZB*V1<uXWZ{z)8shiLLm43A)YNU)%ig2EzN;O2R)&c+LTQ(m6BS1<gSX6WT?u*(
zn22blAs33oGD&+utYV_lz2LMdGQIGyF~YmM{i=a0C_QF8GyvHBiz`^F{Zyj&z0ExW
zKPLX#g|&5A4EM{3#^{cYQ`^aT@GRx=8npvCI#u8Xn8z8yyAy-0vB-tz2O0R&<oH!a
zHYQ*NgPxeAGmkkLT;)Q<`@krRBmYSudhk1mR3+vdhYjwlShJgEi?h}s)jSg3-i8E^
z*2x^xe3gq`v{D9!wWd#Bg1VMbXu}ZQLF^kfkWop|_P$w*Y_*^8O1P6y>DWL+Ffubz
zva4SiGiEQnX9Bcq*<I*KFY33B2D=T0c#s20WUgi_-j at A&7MRIIB7gH2Ybx3`ME<~O
zi-#fccyM&6+EYA-Jj{;lV at Q?=j7MXF4j&^m=?;POol at -?E`YiV1`A?-J!8m}tqcYL
z_Jea6I(``br3kwGySumu;NX9LhMgxr1x<v7SWI!Hb81DQ1&}orui2K91@+-m@|~EJ
zFpQCO;6ONW%ad~P<z)awR7nB06Qy{Hto`48?skht=Q<uQYgON02K+YXX5JI%xUcm+
z;NyoD*V58(leR<$I$_HGJE&{?hSoN9a#B6t?40jwOz1<|CjD3ytlVfhLb-5`PMDsP
z9ma&kqIiG>X5msHR%P%q*jwwt=?h>?$3|WgUKK7*1Dsn*f=~R~@mVQFxsac7*CsPr
z3q?1pxh9=xSPG2EMQKAKk7+_SMl+s|5DA(0xAtplYAgb;+5c8LA4$ASP+JG^5AUtg
zH+zr_YzZ9M at N@W!V{79ZX|BJ$zxuF5#Wlf2fXNx%{i>8P)VY4^lOHEz0G9TC-?y6o
z$b-Kawl16<(i8am<DdE=pF=y7I>qRhpk`bWTnAX*{Td at RlZ5oTB0bg|JCHEqZsn#Q
zQogm?i)mx(<BpNAa=#6!km^5n21(`CSj-fJ9!G5T9fS30?w5V2zJ!_rV#x>&`sEqM
zG+zf7d^=r`U_ywJVfg=BSTUp`nk>1Pj|n^8TP!3}8M(DX*AW{k|IBO{jkj7fAg`zh
zpRF=6*(M@^<QBP}Vm_LW;dt9X3`wlz0c)+GVheF$Ams~oDpsJbiU(W-*nw^bzVQc?
zYO`{Rk4UUuzsAeK*a<xEs=uZ(_UP*8%3x;$q&rt-@Eh3^7=l`|<hXqvsf=&ws-|Tk
z2xukn6fp;2t`j;FWE-;67&6R|m|*2@>$PWSlo2iz^har;kuOZaX8b1-(Qt7Pm6sbH
z#LfeN4ne<;G_}kK+Ksj(3t0(E4v}CCvtW59j~}}7+E)45EXIH{OVmssTxCKsGRQ@F
z{0n=KW$@bp)O_W07LSTKj(AH63Bg};(dX57^dVY-{Ix3l7NcUe7swba<gl0#X=nDw
zPeLxHJ23Y(EiNKBGZmX8BrHZC2OuN+Ov%tgE(Jb;_w5wrqiHQX$aA%vvP_YAGp2#7
zj52qB^S4`99xC0&LFVRg#H$l}Ebv%xrp{<XzvL!$?`qy~Q~M>q)JpIe%R%jg8S`qE
zoEc41mfTCIhtBQmQL!M#?3}^CfZV$Vr~t|GLNZ;6wtDC_+hvHB`1wkp$Bg7JZNkbT
z$LCrd$u5Y?pas~^zeAi~>(Nz|jX+7&yh^Vm`ED+uDqYcfU#OlF22iV4Wb1IoEpTZG
zo<sypc)Pf~!I$x`X6%NtYHk$mV3j{#EYJ<GS#@~ahI9yx%RT*+nUkNA#Z&hU(;^|a
zipQ?Psv%j7QpRU-z#Hgp!!v~HJ2VR?FP0MpHp|Z^q!dsCb>ZnP+Qc!@fu?~ITtUwG
zun>HWPN6XXQIE!8R at AB>2ZXdTBFY~PqA8BOzD|3QW1Bk(auolxiFg{;KaP5<C;;#2
zjKu3_wSlGGrd?-s7^=O#$IKwXG}C5O!vJ}VL3YrE@PFj03cBSqYdJ+qIOC2POuJRO
zag+v+Z)O3oB0Z=n9e?*l<mU>3o^=ZRJnOhh*IcBLx25)N at tyfYU_?OqP9iG+B%_Hb
z!y1$BNl3)0uA0w-a`|nx83tw0D%Cg<Af&;i50sc|gAQS7bI&08_8IG3PP{gR8bIg4
zUc5j684nC7pok>GVBnfPx;NUaF16qWUED1l`|07qmD6)X;j~sxV1|j@)9|S=Xu*zE
znvg0?TvmoQsvAUt6KLqAvJ(kLT-<kANL@#Qk<w9ckk{vsq}{V*Ke8iCA%s(Oq)XE5
za5?2sX0@p^pJXag!TQm?Dr%!_!AnA}T_|cNh-Dq4RG{r5A$xL{mcMEv%t=x9deOzQ
zr?b<#`Yb^eHq%LXy`AZpf!cVV_rxE&*y8Bjns0F_%4VRUZ^yEF8>WND%mvg3(bA-l
z<_)rm(CSpLol>U;S*-C0l0=ovk4v9NXNSTU(Y5S3n~9M3mU-0X-7eNg=iY)(BpQ`q
zO7n^A&IeW6k`jta;<`_}prCWPYJwKst_T+iY>M(ia(9UiOta48 at 8MO``F&lZ2r2SZ
zb)ZluDI#;&n7^5yK8jj}x}28w%|t^fm67l|mnb$ZkNHL~7alGC3Spp2&wLi<n8*tM
z7}hsuo$w)>%C6AVvpLMKs<~wG?m~p^YBH+Hyj|qJVOc%8+}TP*i9C>>Z9B{JJ at o~F
zf|oyjP1unyA{LWI2Vwp0>}Z3uX<Vmh4s1pu4u6y{YMZ_E^^WSQb*pXGdoe*Y+eUzQ
zB3?EyQEor^+$l>^J5jB5bo$r^Wdj6Gm-QE_tzYIPC*J!c#HJ<aEOZ3T+Yt(|D4R6c
zA143%)9FbE2e<>sDEH*zSd>{;^sG2OoXbOwm4!_Tk4Ro65K+yz6^O%Fe6uVLB5J48
z8IW+u*LbWyX?=&enKhMvo?WU+F(~0==MuCYPm#rY6oCqT2#Ad2a=kzNZJF|l3ooRn
zBGN6Y^VMf6 at _a345#i}5)!5$!E%JF`&e_bSwH9wC#Q(-DMr-Cw!Ea>gapX-0Q|6{R
z-TT;ATYs$bR5?eRI*!;y)2~qqMJm#Vi{lNrtnhO&`Vj5l>T!=%tV*4|qZ#|G%Wy=j
z5Q9Y;tqNHC_iK>ErJc&jPvYrfR{xz3WZUqhb at 4#ck8ExT>*uXZFN5H5%S-i>^}2kF
z^q;9KUB?l4X+ at zcI~>W*>g^`lD!mPTkx^1qwrdbEp^{HMWO!S$*uMz!%$XOV>aKXi
zZFrL}|A#WY`TxY}a7-Yin8r0g!pt%;b={o#C+<|JMkAfVvN<zgAfeF>s3;hR#;?|c
zdxJYkghIQxis~UyJ|PmdEUaI%Be$98`P|4bbymhsAez?gDux_5@?{2dDM+F7zwJNN
ztTEr|aK}L67hAo>F{0ik5hPYXV08Zx$9_HR3bthg(%F&W*di3a?szgQY$jv(K^H$g
ze!YuTV`~w#Z_6?P#!K`W|ED3I^p_7W`nK+EgNk1(!}XD*ZgB-HAzXsAp{VGe`V;`x
z>VvB#{XP(=^(tf1)|#LBdvOIH2%MoNPV7i2ssa7=nC7L^i>u}Ot1<pnQTC8)bh$`E
zP2Sv*hX#*it-u?WEVsz}3^r<xSWY@<d<#!=#dnZWDBmet4U4CUeL%U#`#&xQ>pWdV
zfI#}jk7=R~CaGSi5D4RG<kHd?C0kpU*t}{WZq$6E<BG%7eVq(u)C^o<#N{l#k!QRJ
zWS}rStY_ at mXVvA-O|~m;i|Jah`9q^_J=0zTBTD{hoOe80<|Dm9s~|GFDXvb~o*r;&
z`Y+&QnV*O+9<uDw<Ie%BF^x(n7+rTi_^l;G#mm5d$iI5@UYMlb76ZdJ^~ZVs{5~r#
zEF_T)7N0wr=nui|4L;;cFcqnJC7xT(FBVyj1t7~K|EapLI*%tjD$CTRQ4`9AVS7ET
z`ezQu#tyvC`dQLTM%02l3`>G?F-??3dq~;^0I{c3h$flrA7oA$;!>Z*z+ij-Oy0DJ
z)Il@#MS<^EkZ0h7)34P=`k0`1=L$z^+*oG$wqXGuuU~NI#`oi`v2kQGt7Mp&fzJSR
zmNi0#q#qS1nsBA<d09L%BK~2Ff<Wq=r143ecqO7NJy+qX)o%@G<4IT?<I*x2ur^Fb
zMw{QAH`*_3%kgN<UeRjIo<r$Xex4=i9TW&-6ns=kdoRD56StMcPZIoAQ207nBW0dQ
zP<mG#A-%CJSJO~jCkQ{%PzRL-Uv)bmTz39gi4yg)*569Z4w!hd*O{7$yk)M_9&*yn
zK<{BJu;oZ4aqhn~6XVTWzj{ZZ5ZzU-W6lK5xq4xBN^FyYg`p2lqo+F%i50OP`)#|M
zTv#aLmU?ZPJh%tSqhDuKe}*6EB<dq_D2NI~B8z*B<)JUy@#S)sc5oSS!KJ}8WmWBW
zrBCI6#QxuJ&a!+{z^HnwIN4{zUR6o-E%_?3g|)B{P}8^b7!dI~qyIjIvYbfKJO)Oy
zFmTAKDv3NeQU1LI_Z?pdb#R(W$U^r$us44#YJ1%#G$0^zU3NV=fn7m8M2l+l7{o$b
zD921svOioc{n*FbQ9YgkD+2(4G!_wj7cW$W^lN|mKl!zYDui^tu%?jAPY8 at Kha&TL
z*U=9J3r<7ysMjCbeJM@*qiL*`ez?`bVJg8+g0K;v;y9<~1}io^o(c&&jzeJ%uT(t{
zC{hDTZgslerweD}$Rq1~10HkUn=Uz-cEx#yuh@`;EG*T_TjF at b%nZ=0dBGA2C@bjb
zSfLE_`!7U}c>Al%<P2McFDi<Zl{Uc1)LwA7dqrJ$zVJJPwWW{_1$q~cJZ#YfEJ*<i
z631Der0ia^xwg%IDP8^I<Q=e?MNqmji(DJwvj$sB&`T3gGP6nP0KyG|DnI8gVf6;;
zH&4=Di*qrX37JtE)9PoExyk=lmnM8#ORk+!leOJ{YSpWZk>O*tfABwlF<rY|fB7`S
z+oZ>{%z-ModNHj~QGe;bo?LvOg{qsV_rf3;v!LQB*7(-^z>Ee}6s*@y at 2#)=d;sT~
zVX<v+CD)@q*#<Ba74TZE;G9~1@mTM{wb)Pea(0~1aF*vx-Bp`lQk0FEWgON*T)}az
ztMnWWh2^O3^N1#X`Jh7zinp$<hVI#u)j}nK>~AQ{_9)N{m>FPFcN2LH(+eEG>_5B)
zu`w$o>3FKawDP8~3K)W&6gII9P;tVH_yB|;!}Cbyz5HT~1dbLwUb+pVwED{p_*=Q7
zd&vHc7Bh2&w5+Sw!{V#g=&E(;M8^?^2rS$Ef%rzhtbiF8A3$#M<u{7U;Hf`vo$r}1
zXQ}wZMA7&n3ImlX9tXVFk(a2(Y%G2KbYw1fU+<L=mztRPPGaBx=GCH#pSv+(muzS!
zo6%)h(XxApcw8~umr^U7z5C*|zZ0ZuWjRh;+n%V>wWZCBDcyP!*K%iVTvESQy|+^*
z8$-S)A^TO!&X=#*Yi}n~oU9#g%JU-$0jMn1fR^2rt_<Iyj;_GYOXd{H-IFS2F8AGP
r_A8Fpxf`?{egEfN3rTm{6Aq{2g2*D}2Yl4w8#Gm=m#|6&)1dzcvSeKg

literal 0
HcmV?d00001

-- 
2.34.1


