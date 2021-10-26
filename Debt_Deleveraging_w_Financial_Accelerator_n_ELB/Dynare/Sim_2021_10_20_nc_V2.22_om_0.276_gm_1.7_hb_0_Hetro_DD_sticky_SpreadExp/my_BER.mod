// Nimrod Cohen           10.9.2017   V 2.14
////	DETERMINISTIC MODEL !!!! perfect foresight


// run on Dynare 4.5.5
// Macro-processing language: 1 for "FlexiblePrices" , else  "StickyPrices"
@#define FlexPriceModel = 0
@#define Read_FlexPriceModelIRF = 0

@#define BER_MonetaryPolicy = 0

@#define IRF_periods = 200
@#define nominal_Debt = 0

@#define Borrowers_can_be_open = 0
@#define Savers_can_be_open = 0

// for comparision with GK model...   1 for Hetrogenity, 0 for Representative agent
@#define With_Borrowers_HH = 1
@#define Bank_by_Savers = 1

filename = 'IO_DATA.xlsx' ;
[input_M, input_name] 			= xlsread(filename, 'input');
[FlexModel_IRF,FlexModel_input_name] 	= xlsread(filename, 'y_tilde');
//xlswrite(filename, cellstr(['Start simulations at: ' ; datestr(clock)])' , 'output', 'H1');
xlswrite(filename, cell(300,100)  , 'output', 'A1');
xlswrite(filename, {'Start simulations at: ', datestr(clock)}  , 'output', 'H1');

var  	Y_s 		$Y^s$			,
		L_s			$L^s$			,
		C_s 		$C^s$ 			,
		MU_s 		$\{mu}^s$ 		,
		b_s 		$b^s$ 			,
		R_s 		$R^s$ 			,
		r_s  		$r^s$   		,
		b_f_s 		$b^{s*}$  		,
		R_f_s 		$R^{s*}$ 		,
		r_f_s 		$r^{s*}$ 		,
		TB_s		$TB^s$			,
		DB_s		$DB^b$			,
				
		Y_b 		$Y^b$			,
		K_b 		$K_b$			,
		I_b 		$I^b$			,
		I_AC_b		$I_{AC}^b$		,
		I_MAC		$I_{MC}$		,
		L_b			$L^b$			,
		C_b 		$C^b$  			,
		MU_b  		$\{mu}^b$		,
		b_b 		$b^b$			,
		R_b 		$R^b$	 		,
		r_b 		$r^b$			,
		b_f_b	 	$b^{b*}$	 	,
		R_f_b 		$R^{b*}$ 		,
		r_f_b 		$r^{b*}$		,
		TB_b		$TB^b$			,
		DB_b		$DB^b$			, // Debt Balanace
		K2Cltr   	$ \Theta $  	,		
		
		Z			$Z$				,
		TB 			$TB$			,
		pi_local_bank 			$\Pi^{local}_{banks}$   	,
		pi_foreign_bank 		$\Pi^{foreign}_{banks}$ 	,
		pi_foreign_bank_from_b 	$\Pi^{foreign}_{banks}(b)$ 	,
		pi_foreign_bank_from_s 	$\Pi^{foreign}_{banks}(s)$ 	,
		Y 			$Y$				,
		PI_Y 		$\Pi^Y$			,
		K			$K$				,
		I			$I$				,
		L			$L$				,
		C			$C$				,
		K_L 		$K/L$			,
		q			$q$				,
		w			$w$				,
		C_diff 		$ C_s / C  $	,
		Spread_R_b		$Spread_R_b$		,
		shock_Spread 	$Shock to Spread R_b$		,		
		shock_spread_ann $Shock to spread r_b ann.$		,		
		R_s_nom 	$ R^s_{nom}$ 	,
		r_s_nom 	$ r^s_{nom}$   	,
		R_b_nom 	$ R^b_{nom}$	,
		r_b_nom 	$ r^b_{nom}$	,
		Pi			$ \Pi $			,
		pi			$ \pi $			,
		y_hat		$ \hat{y} $		,
		y_gap 		$ \hat{y} - \tilde{y} $	,
		
		shock_R_rp 	$ Risk Premium Shock $	,
		r_CB_nom	$ r^{CB}_{nom}$   	,		
		
		E_Pi		$ E[\Pi] $		,
		R_b_Euler	$ R^b_{Euler} $ ,
		delta_Check					,
		r_n		 	$ r^n $			,
		I_AC 		$I_{AC}$		,
		Y_prod						,
		Yb_diff 					,
		b_gdp		$ b / Y^B_{ann.} $ 	,
		b_f_b_gdp 	$ b^{B*}/ Y_{ann.} $ ,
		b_gdp_tot 	$b/ Y_{ann.} $	,
		w_diff	 				 	,
		MC		 				 	,
		MC_hat		$ \hat{MC} $	,
		b_BAR	 	$ \bar{b} $		,
		b_f_b_limK 	$ \bar{b^{b*}} $,
		b_f_s_limK 	$ \bar{b^{s*}} $,
		r_n_imp		$r^n_{implied}$ ,		
		m_b 		$ m_b $	 		,
		m_s 		$ m_s $	 		,
		Rk 			$ R_k $	 		,
		Qk 			$ Q_k $	 		,		
		Ri 			$ R_i $	 		,
		NetWorth_b	$ NetWorth_b $	,
		LeverageRatio_b $ b^b / (Q * K^b) $	,
		
		r_s_annu 	$r^s_{ann.}$   		,
		r_f_s_annu	$r^{s*}_{ann.}$ 	,
		r_b_annu	$r^b_{ann.}$		,
		r_f_b_annu	$r^{b*}_{ann.}$		,
		spread_r_b_annu	$ (r_b - r_s)_{ann.} $,
		spread_r_k_annu	$ (r_k - r_s)_{ann.} $,
		r_s_nom_annu $ r^s_{nom.ann.}$  ,
		r_CB_nom_annu $ i_{ann.}$  ,
		r_RP_annu $ r^{RP}_{ann.}$  ,
		r_b_nom_annu $ r^b_{nom.ann.}$	,
		pi_annu		$ \pi_{ann.} $		,
		r_b_Euler_annu	$ r^{b.Euler}_{ann.} $ 	,
		E_pi_annu	$ E[\pi]_{ann.} $	,
		r_k_annu	$ r^k_{ann.} $ 		,
		delta      	$\delta $			,		
		MU_REP				$\{mu}^{REP}$ 		,
		m_REP 				$ m_REP $	 		,
		R_REP_Euler			$ R^{REP}_{Euler} $ ,
		r_REP_Euler_annu	$ r^{REP.Euler}_{ann.} $,
		E_Pi_s				$ E[\Pi]^{s} $			,
		E_pi_s_annu		$ E[\pi]_{ann.}^{s} $ 		,
		E_Pi_REP			$ E[\Pi]^{REP} $		,
		E_pi_REP_annu		$ E[\pi]_{ann.}^{REP} $ ,
		r_Taylor 			$ r_{Taylor} $			,
		r_Taylor_NEW 		$ r_{Taylor}^{NEW} $	,
		GiftFromBorrowers  	$ Gift From Borrowers $	,
		shock_NW 			$ Net Worth Shock $		
	 	;
pg1 =	{	'b_BAR'		,	'b_b' 		,	'b_gdp_tot'				;
			'spread_r_b_annu'	,	'r_b_annu'  ,	'r_s_annu'  	;		
			'r_k_annu' 		, 'r_b_nom_annu',	'r_s_nom_annu'		};
pg2 =	{	'C'				,	'C_b' 		,	'C_s'				;
			'L'				,	'L_b' 		,	'L_s'				;
			'I'				,	'K'  		,	'Qk'  				};
pg3 =	{	'Y'				,	'Y_b' 		,	'Y_s'				;
			'C_diff'		,	'w' 		,	'q'					;
			'pi_annu'		,	'E_pi_annu' ,	'MC'  				};
pg4 =	{	'E_pi_s_annu'	,'E_pi_REP_annu',	'r_RP_annu'			;
			'r_n'			,'r_b_Euler_annu',	'r_REP_Euler_annu'	;
			'r_Taylor'		,'delta' 	    ,	'NetWorth_b' 		};
pg5 =	{	'K_L'			,	'I_AC_b' 	,	'I_MAC'				;
			'K2Cltr'		,	'b_f_b_limK',	'b_f_s_limK'		;
			'b_gdp'			,	'b_f_b_gdp'	,	'b_gdp_tot'  		};
pg6 =	{	'pi_foreign_bank_from_b','Y_prod',	'Yb_diff'			;
			'PI_Y'			,	'delta_Check',	'w_diff'			;
			'pi_local_bank'	,	'LeverageRatio_b'  	,	'b_gdp_tot'	};			
pg7 =	{	'DB_b'			,	'TB_b' 		,	'TB_s'				;
			'b_b'			,	'b_f_b' 	,	'shock_spread_ann'	;   
			'y_gap'			,	'y_hat'		,	'GiftFromBorrowers'	};							
pg8 =	{	'Y'				,	'pi_annu' 	,	'r_CB_nom_annu'		;
			'b_b'			,	'Qk' 		,	'spread_r_k_annu'	;   
			'C'				,	'I'			,	'r_s_annu'	};							
				
disply  = 	{pg1 ; pg2 ; pg3; pg4; pg5; pg6; pg7; pg8; pg1; pg2; pg3; pg4; pg5; pg6; pg7; pg8 };
Legend_Fig_Num = 1 ; 
Legend_subPlot_Num = 1 ; 
// choice_display = 0 : C_t-C_ss         (Dynare Defult)
// choice_display = 1 : (C_t-C_ss)/C_ss  (this is similer as the IRF for logC !!! )
// choice_display = 2 : C_t
// choice_display = 3 : go from log back to valus...C_t

// if the variable is c=logC then the IRF (1) for c_t is log(C_t)-log(C_ss) similer to (2) for C_t  
// then if we whant to get back to C_t we need to calculate	 C = C_ss * exp(c^) this is (3)
//ch_1= 1*ones(3,3);
ch_2= 2*ones(3,3); //ch_3= 3*ones(4,3);
pg1c=[	1	1  2 	;
		2	2  2	;
		2	2  2  ] ;
pg2c=[	1	1  1 	;
		1	1  1	;
		1	1  1  ] ;
pg3c=[	1	1  1 	;
		2	1  1	;
		2  	2  1  ] ;
pg4c=[	2	2  2 	;
		2	2  2	;
		2	2  1  ] ;
pg5c=[	2	1  1 	;
		1	1  1	;
		2	2  2  ] ;
pg6c=[	1	1  1 	;
		1	1  1	;
		1	2  2  ] ;
pg7c=[	1	1  1 	;
		1	1  1	;
		1	1  1  ] ;
pg8c=[	1	2  2 	;
		1	1  2	;
		1	1  2  ] ;
choice_display_arr	= {ch_2;ch_2;ch_2;ch_2;ch_2;ch_2;ch_2;ch_2; pg1c;pg2c;pg3c;pg4c;pg5c;pg6c;pg7c;pg8c};	

zero3 = zeros(3,3); 
ones3 = ones(3,3);
 pg1_save =	[	0	0  0 	;
				0	0  0 	;
				0	0  1  ] ;			
pg2_save =	[	1	0	0	;
				1	0	0	;
				1	0	0 ]	;			
pg3_save =	[ 	1 	0 	0	; 
				0	1	1	;
				0	0	1 ]	;    
pg3_save_only_Y =		[ 	1 	0 	0	; 
							0	0	0	;
							0	0	0 ]	;
pg4_save =	[ 	0 	0 	0	; 
				0	0	1	;
				0	0	1 ]	;
//choice_save_xls_arr = {zero3;zero3;zero3;zero3;zero3;zero3;zero3; 	ones3;ones3;ones3;	pg4_save;  zero3;zero3;zero3};	
//choice_save_xls_arr = {zero3;zero3;zero3;zero3;zero3;zero3;zero3;		 pg1_save;pg2_save;pg3_save; zero3;zero3;zero3;zero3};	
choice_save_xls_arr = {zero3;zero3;zero3;zero3;zero3;zero3;zero3;zero3;		 zero3;zero3; pg3_save_only_Y; zero3;zero3;zero3;zero3;zero3};	

varexo	e_Z	,  K2Cltr_BAR ,   Depo2Cltr_f,  K2Cltr_f , K2f , e_delta	,  y_tilde, ExoZeroRate, e_R_rp, e_NW, e_Spread ;

// remember to define under SHOCK   AND!!! undet initial ane endval!!!
parameters	setup		  			    	/* 1*/
			beta_s 		$\beta_s$  			/* 2*/ 	,
			beta_b			  				/* 3*/	,
			beta_f			  				/* 4*/	,
			sigma_s 	$\sigma_s$			/* 5*/	,			
			sigma_b							/* 6*/	,			
			phi			$\phi_{local}$  	/* 7*/	, 
			nu			$\nu $		 		/* 8*/	,
			phi_f_s		$\phi_{foreign}^s$	/* 9*/	,
			phi_f_b		$\phi_{foreign}^b$	/*10*/	,
			nu_f_b		$\nu_{foreign}^b $	/*11*/	,
			K2Cltr_H 	$K2Colleteral^{High}$ /*12*/	,
			K2Cltr_L 	$K2Colleteral^{Low}$  /*13*/  ,						
			Depo2Cltr_f_H 	$ Depo2Cltr_f^{High} $		/*14*/ 	,
			Depo2Cltr_f_L 	$ Depo2Cltr_f^{Low} $		/*15*/ 	,			  	
			K2Cltr_f_H  	$ K2Colleteral_f^{High}$ 	/*16*/ 	,
			K2Cltr_f_L 		$ K2Colleteral_f^{Low}$ 	/*17*/ 	,
			K2f_h  							/*18*/	,
			K2f_l	  						/*19*/	,						
			Z_BAR							/*20*/	,			
			alpha   	$\alpha $			/*21*/	,
			p_delta		$ p \delta $		/*22*/	,
			chi_b 		$\chi^b $			/*23*/	,
			omega_s		$\omega^s $			/*24*/	,
			omega_b		$\omega^b $			/*25*/	,
			h_s			$h^s $				/*26*/	,
			h_b			$h^b $				/*27*/	,
			L_BAR        					/*28*/	,
			gamma2_b    $\gamma_2_b$		/*29*/	,
			kappa		$\kappa$			/*30*/	,
			phi_pi		$\phi_{\pi}$		/*31*/	,
			phi_y		$\phi_{y}$			/*32*/	,
			Pi_BAR		$ \bar{\Pi} $		/*33*/	,					
			ZLB_min							/*34*/	,
			REP_Model    					/*35*/	,									
			std_e_Z		$ \sigma(e^Z) $ 		/*36*/	,
			rho_e_Z		$ \rho(e^Z) $			/*37*/	,
			std_e_delta	$ \sigma(e^{\delta}) $ 	/*38*/	,
			rho_e_delta	$ \rho(e^{\delta}) $	/*39*/	,			
			std_e_NW	$\sigma(e^NW) $ 		/*40*/	,
			rho_e_NW	$\rho(e^NW) $			/*41*/	,			
			std_e_r_rp	$\sigma(e^{RP}) $ 		/*42*/	,
			rho_e_R_rp	$\rho(e^{RP}) $			/*43*/	,			
			std_e_Spread	$\sigma(e^{Spread}) $ /*44*/	,
			rho_e_Spread	$\rho(e^{Spread}) $	 /*45*/	,			
			
			ConstBL		$ Constant Borrowing Limit $				/*46*/	,
			BLwoQ		$ Borrowing Limit without Capital  Price $	/*47*/	,			
			rho_K2Cltr  					/*48*/	, 
			EndZeroRateTime 				/*49*/	,  
						
			start_t 						/*50*/	, 
			irf_periods_to_disp				/*51*/	,			
			save_irf_xls					/*52*/	,
			
	R_s_SS ,
	R_b_Euler_SS ,
	R_s_nom_SS ,	
	R_b_nom_SS_H ,
	R_b_nom_SS_L ,
	b_f_b_BAR_h ,
	b_f_s_BAR_h ,	
	b_b_SS_H	,
	b_b_SS_L	,	
	b_s_SS_H  	,
	b_s_SS_L  	,
	TB_s_BAR_h 	,
	TB_b_BAR_h 	,
	TB_BAR_h 	,
	DB_b_BAR_h 	,
	DB_s_BAR_h 	,
	b_f_b_BAR_l , 		/*60*/	
	b_f_s_BAR_l ,		
	TB_s_BAR_l 	,
	TB_b_BAR_l 	,
	TB_BAR_l 	,
	DB_b_BAR_l 	,
	DB_s_BAR_l 	,
	q_BAR 		,
	K_L_BAR 	, 		/*70*/	
	w_BAR 		,
	K_BAR 		,
	I_BAR 		,
	Y_BAR 		,
	C_b_BAR_h 	,
	MU_b_BAR_h	,
	C_s_BAR_h 	,
	MU_s_BAR_h	,
	C_b_BAR_l 	,
	MU_b_BAR_l	, 		/*80*/	
	C_s_BAR_l 	,
	MU_s_BAR_l	,
	chi_s		,
	vartheta_s  $\vartheta^s$	,
	vartheta_b  $\vartheta^b$	,
	MC_BAR		,
	b_f_b_limK_BAR_h, 
	b_f_b_limK_BAR_l, 
	b_BAR_SS_H,	
	b_BAR_SS_L,		/*90*/	
	b_f_s_limK_BAR_h,
	b_f_s_limK_BAR_l,
	I_b_BAR		,	
	K_b_BAR		,	
	R_world		,
	p_R_rp	
	;				
//params_display = [7 8 9 10 11]; //[23]	;			
//params_display = [25, 27, 30, 7, 8]; 			
params_display = [7, 8, 25, 29, 27, 44]; 			
/////////////////////////////////////////////////////////////// matlab LOOP 
tot_Graph_num = size(input_M,2);
saved_steady_state_start = [];
saved_steady_state_end = [];
for scenario = 1:tot_Graph_num
	disp(['Running simulation ', num2str(scenario), ' of ' ,num2str(tot_Graph_num)]);

////////////////////////////////////////// Dynare body
// calibration, as in Uribe - Canadian business cycle , in yearly units
	setup 		=  	input_M(1,scenario);
	beta_s 		=  	input_M(2,scenario);
	beta_b 	 	=  	input_M(3,scenario);
	beta_f		=  	input_M(4,scenario);
	sigma_s		=  	input_M(5,scenario);
	sigma_b		=  	input_M(6,scenario);
	phi 		=  	input_M(7,scenario);
	nu 			= 	input_M(8,scenario); 	
	phi_f_s		=  	input_M(9,scenario);
	phi_f_b		=  	input_M(10,scenario);
	nu_f_b		= 	input_M(11,scenario); 	
	K2Cltr_H	=  	input_M(12,scenario);
	K2Cltr_L	=  	input_M(13,scenario);
	Depo2Cltr_f_H	=  	input_M(14,scenario);
	Depo2Cltr_f_L	=  	input_M(15,scenario);
	K2Cltr_f_H		=  	input_M(16,scenario);
	K2Cltr_f_L		=  	input_M(17,scenario);			
	K2f_h  		= 	input_M(18,scenario);	
	K2f_l 	 	= 	input_M(19,scenario);		
	Z_BAR  		=  	input_M(20,scenario);	
	alpha		=	input_M(21,scenario);
	p_delta		=	input_M(22,scenario);
	chi_b 		= 	input_M(23,scenario);
	chi_s 		= 	1 - chi_b 	 ;
	omega_s		=	input_M(24,scenario);
	omega_b		=	input_M(25,scenario);
	h_s			=	input_M(26,scenario);
	h_b			=	input_M(27,scenario);
	L_BAR		= 	input_M(28,scenario);	
	gamma2_b 	=	input_M(29,scenario);	
	kappa		= 	input_M(30,scenario);
	phi_pi		= 	input_M(31,scenario);
	phi_y		= 	input_M(32,scenario);
	Pi_BAR		= 	input_M(33,scenario);	
	ZLB_min		= 	input_M(34,scenario);
	REP_Model	=	input_M(35,scenario);   	// 0 is S model |  1 for Representative model like
	
	std_e_Z		=  	input_M(36,scenario);
	rho_e_Z   	=  	input_M(37,scenario);	
	std_e_delta	=  	input_M(38,scenario);
	rho_e_delta =  	input_M(39,scenario);	
	std_e_NW	=  	input_M(40,scenario);
	rho_e_NW   	=  	input_M(41,scenario);		
	p_R_rp  	=  	input_M(42,scenario);							   
	std_e_r_rp	=  	input_M(43,scenario);
	rho_e_R_rp  =  	input_M(44,scenario);						
	std_e_Spread=  	input_M(45,scenario);
	rho_e_Spread=  	input_M(46,scenario);							
	
	ConstBL		=  	input_M(47,scenario);		
	BLwoQ		=  	input_M(48,scenario);		
	rho_K2Cltr	=  	input_M(49,scenario);		
	EndZeroRateTime	=  	input_M(50,scenario);
		vector_ExoZeroRate = zeros(@{IRF_periods},1);		
		vector_ExoZeroRate(EndZeroRateTime+1:end, 1)  = 1;
		
	start_t 			= input_M(60,scenario);
	irf_periods_to_disp	= input_M(61,scenario);
	save_irf_xls		= input_M(62,scenario);
	
	R_world		= 1 / beta_f ;
	R_s_SS 	= 1 / beta_s ;	
	R_s_nom_SS = R_s_SS * Pi_BAR ;	
	R_b_Euler_SS 	= 1 / beta_b ;	
	
	q_BAR 	= 1 / beta_b - (1-p_delta) ;  // note: this is  for B type !!! 
	K_L_BAR = (q_BAR / (alpha * Z_BAR)) ^ (1/(alpha-1));
	w_BAR 	= (1-alpha)* Z_BAR * K_L_BAR^alpha ;	
	K_BAR 	= K_L_BAR * L_BAR ;	
	I_BAR 	= p_delta * K_BAR ; 
	MC_BAR = (q_BAR/alpha)^alpha * (w_BAR/(1-alpha))^(1-alpha)* (1/Z_BAR);
	Y_BAR 	= Z_BAR * K_BAR^alpha * L_BAR^(1-alpha) ;		
	K_b_BAR = K_BAR/chi_b;		
	I_b_BAR = I_BAR/chi_b;	
	
	b_BAR_SS_H  	= K2Cltr_H		* ( K_b_BAR -  K2f_h 	* K_b_BAR ) ;  	
	b_BAR_SS_L  	= K2Cltr_L		* ( K_b_BAR -  K2f_l 	* K_b_BAR ) ;  	
	b_b_SS_H	= b_BAR_SS_H * ( 1 + (R_b_Euler_SS/R_s_SS - 1)/(phi + nu) )  ; // asuuming small primia s.t. (1+phi*D)*(1+nu*D)=(1+phi*D+nu*D)
	b_b_SS_L	= b_BAR_SS_L * ( 1 + (R_b_Euler_SS/R_s_SS - 1)/(phi + nu) )  ; // asuuming small primia s.t. (1+phi*D)*(1+nu*D)=(1+phi*D+nu*D)
	b_s_SS_H	 	= - chi_b / chi_s * b_b_SS_H ;	
	b_s_SS_L	 	= - chi_b / chi_s * b_b_SS_L ;	
		
	Spread_R_b_SS_H	= 1 + phi *(b_b_SS_H/b_BAR_SS_H - 1) ;
	Spread_R_b_SS_L	= 1 + phi *(b_b_SS_L/b_BAR_SS_L - 1) ;	
	R_b_SS_H 		= R_s_SS * Spread_R_b_SS_H  ;  	
	R_b_SS_L 		= R_s_SS * Spread_R_b_SS_L  ;	
	R_b_nom_SS_H = R_b_SS_H * Pi_BAR ;		
	R_b_nom_SS_L = R_b_SS_L * Pi_BAR ;		
	
	DB_b_BAR_h 		= b_b_SS_H * ( 1/Pi_BAR - 1 / R_b_nom_SS_H ) ;    // Debt Balanace 	
	DB_s_BAR_h 		= b_s_SS_H * ( 1/Pi_BAR - 1 / R_s_nom_SS ) ;    // Debt Balanace 	
	DB_b_BAR_l 		= b_b_SS_L * ( 1/Pi_BAR - 1 / R_b_nom_SS_L ) ;    // Debt Balanace 	
	DB_s_BAR_l 		= b_s_SS_L * ( 1/Pi_BAR - 1 / R_s_nom_SS ) ;    // Debt Balanace 		
		
	b_f_b_limK_BAR_h= K2Cltr_f_H 	* 	K2f_h 	* K_b_BAR   ;
	b_f_b_limK_BAR_l= K2Cltr_f_L 	* 	K2f_l 	* K_b_BAR   ;	
	@#if Borrowers_can_be_open ==1 			
		b_f_b_BAR_h 	= (phi_f_b^(-1)	*( R_b_SS_H	/ R_world - 1) + 1 )* b_f_b_limK_BAR_h;			
		b_f_b_BAR_l 	= (phi_f_b^(-1)	*( R_b_SS_L	/ R_world - 1) + 1 )* b_f_b_limK_BAR_l;					
	@#else  
		b_f_b_BAR_h 	=  0 ;			
		b_f_b_BAR_l 	=  0 ;		
	@#endif
	//end of @#if Borrowers_can_be_open == 1		
		
	b_f_s_limK_BAR_h= Depo2Cltr_f_H 	* 	(-b_s_SS_H)   ;
	b_f_s_limK_BAR_l= Depo2Cltr_f_L 	* 	(-b_s_SS_L)   ;
	@#if Savers_can_be_open ==1 			
		b_f_s_BAR_h 	= (phi_f_s^(-1)	*( R_s_SS	/ R_world - 1) + 1 )* b_f_s_limK_BAR_h;
		b_f_s_BAR_l 	= (phi_f_s^(-1)	*( R_s_SS	/ R_world - 1) + 1 )* b_f_s_limK_BAR_l;
	@#else  		
		b_f_s_BAR_h 	= 0 ;
		b_f_s_BAR_l 	= 0 ;
	@#endif
	//end of @#if Savers_can_be_open == 1		
	
	TB_s_BAR_h	 	= b_f_s_BAR_h * ( 1 -  1 / R_s_SS); // TB is USES
	TB_b_BAR_h	 	= b_f_b_BAR_h * ( 1 -  1 / R_b_SS_H);	
	TB_BAR_h 	 	= chi_b * TB_b_BAR_h + chi_s * TB_s_BAR_h ;
		
	TB_s_BAR_l	 	= b_f_s_BAR_l * ( 1 -  1 / R_s_SS); // TB is USES
	TB_b_BAR_l	 	= b_f_b_BAR_l * ( 1 -  1 / R_b_SS_L);	
	TB_BAR_l 	 	= chi_b * TB_b_BAR_l + chi_s * TB_s_BAR_l ;
		
	C_b_BAR_h = w_BAR * L_BAR + (q_BAR/p_delta-1) * I_b_BAR - DB_b_BAR_h - TB_b_BAR_h ;
	C_b_BAR_l = w_BAR * L_BAR + (q_BAR/p_delta-1) * I_b_BAR - DB_b_BAR_l - TB_b_BAR_l ;
	MU_b_BAR_h= (1 - beta_b * h_b) * ((1-h_b)*C_b_BAR_h)^(-sigma_b)	;
	MU_b_BAR_l= (1 - beta_b * h_b) * ((1-h_b)*C_b_BAR_l)^(-sigma_b)	;
	vartheta_b = w_BAR * L_BAR^(-omega_b) * MU_b_BAR_l ;
	
	C_s_BAR_h = w_BAR * L_BAR  - DB_s_BAR_h - TB_s_BAR_h ;
	C_s_BAR_l = w_BAR * L_BAR  - DB_s_BAR_l - TB_s_BAR_l ;
	MU_s_BAR_h= (1 - beta_s * h_s) * ((1-h_s)*C_s_BAR_h)^(-sigma_s)	;
	MU_s_BAR_l= (1 - beta_s * h_s) * ((1-h_s)*C_s_BAR_l)^(-sigma_s)	;
	vartheta_s = w_BAR * L_BAR^(-omega_s) * MU_s_BAR_l ;
	phi_pi_xxx = 1;	

model; 
// // Households Boudget Constraint
@#if Bank_by_Savers ==1 
// as in EK like model !!
	//firms by B, so i write Savers B.C.(which have just the bank - don't have firms):
	Y_s = C_s + DB_s + TB_s ;
	Y_s = w * L_s + pi_local_bank + GiftFromBorrowers ;		
	// firms by S, so i write Borrowers B.C. (which don't have bank and don't have firms):
	//Y_b = C_b + I_b + I_AC_b + DB_b + TB_b ;	
	//Y_b= w * L_b + q * K_b ;		
@#else  
// Without Borrowers HH !!! as in GK like model ....   	
	//firms by B, so i write Savers B.C.(which have just the bank - don't have firms):
	Y_s = C_s + DB_s + TB_s ;
	Y_s = w * L_s + GiftFromBorrowers ;    // so pi_local_bank go to borrowers as GK. need to update SS respectivly !!!
	// firms by S, so i write Borrowers B.C. (which don't have bank and don't have firms):
	//Y_b = C_b + I_b + I_AC_b + DB_b + TB_b ;	
	//Y_b= w * L_b + q * K_b ;		
@#endif
//end of @#if Bank_by_Savers == 1				

GiftFromBorrowers = chi_b * NetWorth_b / chi_s * (shock_NW - 1) ; 
shock_NW =  1^(1-rho_e_NW) * shock_NW(-1)^rho_e_NW * exp(e_NW * std_e_NW ) ;
	
@#if nominal_Debt ==1 
	// when nominal Debt:
	pi_local_bank  	= - b_s 	* ( 1/ R_s_nom -   1 / R_b_nom	) ;
	DB_b =  b_b(-1)/Pi - b_b / R_b_nom; // Debt Balanace; if Real Debt:b_b(-1)-b_b/R_b  
	DB_s =  b_s(-1)/Pi - b_s / R_s_nom;  // Debt Balanace; if Real Debt:b_s(-1)-b_s/R_s  
@#else  
	// when Debt in REAL temrs:	
	pi_local_bank	= - b_s 	* ( 1/R_s 		- 1 / R_b);			
	DB_b =  b_b(-1)-b_b/R_b  ;
	DB_s =  b_s(-1)-b_s/R_s  ;   // 5
@#endif
//end of @#if nominal_Debt == 1
	
	TB_b =	b_f_b(-1) -  b_f_b / R_f_b ;
	TB_s =	b_f_s(-1) -  b_f_s / R_f_s ; 
	// move it down: I_AC_b = gamma2_b / 2 * (I_b / I_b_BAR - 1)^2;										
	delta =  p_delta^(1-rho_e_delta) * delta(-1)^rho_e_delta * exp(e_delta* std_e_delta ); 		                   	
	K_b = I_b(-1) + (1-delta)*K_b(-1) ; //don't do: K(+1) = I + (1-delta)*K --> E[ K(+1) ]= ....!!!		
	// note that K_s=0 I_s=0 
		
// Households FOC
// FOC w.r.t C
	MU_b =  (C_b - h_b * C_b(-1)) ^(-sigma_b) - beta_b * h_b * (C_b(+1) - h_b * C_b) ^(-sigma_b) ;	// Eq 10	
	MU_s =  (C_s - h_s * C_s(-1)) ^(-sigma_s) - beta_s * h_s * (C_s(+1) - h_s * C_s) ^(-sigma_s) ;		
	MU_REP =(C 	 - h_s * C(-1))^(-sigma_s) 	  - beta_s * h_s * (C(+1)   - h_s * C)^(-sigma_s) 	;	
	// FOC by L
	w = vartheta_b * L_b^(omega_b) / MU_b ;
	w = vartheta_s * L_s^(omega_s) / MU_s ;
	// SDF
	m_b   = beta_b * MU_b / MU_b(-1) ;
	m_s   = beta_s * MU_s / MU_s(-1);	
	m_REP = beta_s * MU_REP / MU_REP(-1);			
	
	Rk = (q(+1) + (1-delta) * Qk(+1)) /  Qk   ;	// this is Rk(+1)...	
// capital production firm
	// replacing FOC by K in the old model: 	Qk =  1 + I_MAC ;		
	I_AC = gamma2_b / 2 * (I / I(-1) - 1)^2;   					
	I_MAC= gamma2_b 	* (I / I(-1) - 1);														// 20
	//Ri =  I_MAC_b(+1) * (I_b(+1)/I_b)^2 / (1 + I_AC_b + I_MAC_b * (I_b/I_b(-1)) - Qk ) ;	
	Ri =  1/beta_b  ;	
	Qk = 1 + I_AC + I_MAC * (I/I(-1)) - m_b(+1) * I_MAC(+1) * (I(+1)/I)^2;
	
	//1.
	// old Q is:
	//I_AC_b = gamma2_b / 2 * (I_b / I_b_BAR - 1)^2;
	//I_MAC_b= gamma2_b * (I_b / I_b_BAR - 1);
	//Qk =  1 + I_MAC_b ;
		
	//1 = m_b(+1) * Ri ;		
	//I_b = K_b_BAR * delta;
	
	// FOC by b	
	1 = m_s(+1) * R_s ;
	1 = m_REP(+1) * R_REP_Euler  ;
	// for boroowers
		@#if With_Borrowers_HH ==1 
		// as in EK like model !!
			1 = m_b(+1) * R_b_Euler  ;		
			1 = m_b(+1) * Rk ;									
		@#else  
		// Without Borrowers HH !!! as in GK like model ....   
			Rk = R_b_Euler;
			m_b / beta_b =  m_s / beta_s ;  // this is the best!!!
			//	m_b b =  m_s ;
			//MU_b = MU_s   ;
			//C_b =  C_s  ;
		@#endif
		//end of @#if With_Borrowers_HH == 1		
		
	
// Colleteral Style -Iacoviello& Minetti (2006)	
K2Cltr = K2Cltr_BAR^(1-rho_K2Cltr) * K2Cltr(-1)^rho_K2Cltr ;

	// thesis: 
	//		b_f_b_limK 	= K2Cltr_f * 	K2f 	* K_b_BAR   ;  // senior (gurentee)
	// now B.:
	//		b_f_b_limK 	= K2Cltr_f * Qk(+1) *	K2f 	* K_b_BAR   ;  // senior (gurentee)
	// C.:
			b_f_b_limK 	= K2Cltr_f * 	K2f 	* K_b_BAR   ;  // senior (gurentee)
	// thesis: 
	//		b_BAR  	= K2Cltr		* ( K_b -  K2f 	* K_b_BAR ) ;  
	// now A.:  but aprox. the same...
	//		b_BAR  	= K2Cltr		* ( K_b(+1) -  K2f 	* K_b_BAR ) ;  
	// now B.: 
	//		b_BAR  	= K2Cltr		* Qk(+1) *( K_b(+1) -  K2f 	* K_b_BAR ) ;  
	// now C.: 
			
			//b_BAR  	= K2Cltr		* (Qk(+1)* K_b(+1) -  K2f 	* K_b_BAR ) ;  
	// for testing again constant borrowing limit   (Qk = 1   K_b = K_b_BAR )
			//b_BAR  	= K2Cltr * (ConstBL * K_b_BAR  + (1-ConstBL) *Qk(+1)* K_b(+1) - K2f	* K_b_BAR ) ;  
			b_BAR  	= K2Cltr * (ConstBL * K_b_BAR  + (1-ConstBL)* ((1-BLwoQ) *Qk(+1)* K_b(+1) + BLwoQ * K_b(+1) ) - K2f	* K_b_BAR ) ;  
			
			// 2. old limit - without the price of capital...
			//b_BAR  	= K2Cltr		* ( K_b(+1) 		-  K2f 	* K_b_BAR ) ;  
			
			//b_BAR  	= K2Cltr		* ( K_b * (1+delta) 		-  K2f 	* K_b_BAR ) ;  
	
	b_f_s_limK 	= Depo2Cltr_f * (-b_s)  ;
	
	%Spread_R_b 	= (1 + phi *(b_b/b_BAR - 1)) * shock_Spread ;												// 30	
	Spread_R_b 	= exp(phi *(b_b/b_BAR - 1)) * shock_Spread ;												// 30	
	shock_Spread =  1^(1-rho_e_Spread) * shock_Spread(-1)^rho_e_Spread * exp(e_Spread* std_e_Spread); 		                   	
		
	R_b 		= R_s * Spread_R_b  ;  		
	%R_b_Euler 	= R_b * (1 + nu *(b_b/b_BAR - 1)) ;		
	R_b_Euler 	= R_b * exp(nu *(b_b/b_BAR - 1)) ;		
		
// Borrowers opening to world block	
	@#if Borrowers_can_be_open ==1 			
		R_f_b 		= R_world*( 1 + phi_f_b *(b_f_b / b_f_b_limK - 1 )); 		
		R_b_Euler 	= R_f_b*(1 + nu_f_b *(b_f_b / b_f_b_limK -1)) ;			
	@#else  
		R_f_b	    = R_b ; 
		b_f_b 		= 0;	
	@#endif
	//end of @#if Borrowers_can_be_open == 1		
// Savers opening to world block	
	@#if Savers_can_be_open ==1 			
		R_f_s 		= R_world * ( 1 + phi_f_s *(b_f_s / b_f_s_limK - 1 ));	
		R_f_s 		= R_s ; 		
	@#else  		
		R_f_s 		= R_s ;	
		b_f_s 		= 0;			
	@#endif
	//end of @#if Savers_can_be_open == 1		
			
	
// Firms and FOC
	Y_prod = Z * K^alpha * L^(1-alpha) ;
	K_L = K / L ;
	K_L = alpha/(1-alpha) * w / q ;
// this is w/q from :
	//q = alpha * Z * K_L^(alpha-1) * MC ;						// Eq 13
	//w = (1-alpha) * Z * K_L^alpha * MC;						// i use it in real model ..see bellow
	// which is also true for Real Model
	
// Aggregate Varibles and Budget Constraint	
	L 	 = chi_b * L_b 	  + chi_s * L_s ;	// 40
	K 	 = chi_b * K_b 	  				;
	Y 	 = chi_b * Y_b 	  + chi_s * Y_s ;						
	C 	 = chi_b * C_b 	  + chi_s * C_s ;
	I 	 = chi_b * I_b 	   			  	;
	I_AC = chi_b * I_AC_b 				;
	chi_b * b_b + chi_s * b_s = 0 		;		
	TB 	 = chi_b * TB_b   + chi_s * TB_s ;	
	//Y = C + I + I_AC  + TB   ;			
	
	Y = C + I * ( 1 + I_AC )  + TB   ;
	//Y = C + Qk * I + TB   ;		
	Y = Y_prod ; 
// Fisher Rule
	R_s_nom = R_s * E_Pi_s;			// 50
	R_s_nom = R_REP_Euler * E_Pi_REP;		// as in representative agent model								
	//E_Pi = (1 - REP_Model) * E_Pi_s + REP_Model * E_Pi_REP ; // !!!!!!!!!!!!!!	
	E_Pi =  E_Pi_s ; 
	E_Pi = Pi(+1);			
	R_b_nom = R_b * E_Pi;	

	// and also change the DEBT to REAL TERM. see above	
// FROM HERE NOMINAL SIDE EFFECTS		
@#if FlexPriceModel==1 
	MC_hat = 0 ;
@#else  
// that is "StickyPrices" with the New Keynesian Phillips Curve	
	@#if BER_MonetaryPolicy==0 	
		pi - (Pi_BAR-1) = kappa * MC_hat + beta_b *(E_Pi - Pi_BAR); // replacing: w = (1-alpha) * Z * K_L^alpha * MC; // i use it in the old real model 
	@#else  	
		pi - (Pi_BAR-1) = (1-ExoZeroRate) * ( kappa * MC_hat + beta_b *(E_Pi - Pi_BAR))   +  ExoZeroRate *  ( 0 );	
	@#endif
	//end of @#if BER_MonetaryPolicy==0 	
@#endif
//end of @#if FlexPriceModel == 1
	
// TFP AR1 for ln(Z):	ln(Z) = (1-rho) * ln(Zbar) + rho * ln(Z(-1)) + e			
	Z = Z_BAR^(1-rho_e_Z) * Z(-1)^rho_e_Z * exp(e_Z* std_e_Z );
	MC = (q/alpha)^alpha * (w/(1-alpha))^(1-alpha)* (1/Z);	
// Monetary Policy:
	// not standard. more ....see BER  fotnote 18 and Appendix EK pp 23 	
	//r_s_nom = max (ZLB_min, ((r_s)+(Pi_BAR-1) + phi_pi * (pi - (Pi_BAR-1)) + phi_y *  y_hat ) ) ;	
	//standard			
	r_Taylor 	 = ExoZeroRate * ( (R_s_SS-1) + (Pi_BAR-1) + phi_pi*(pi-(Pi_BAR-1)) + phi_y*y_hat);
	r_Taylor_NEW = ExoZeroRate * ( (R_s_SS-1) + (Pi_BAR-1) + phi_pi*(pi-(Pi_BAR-1)) + phi_y*y_gap);
	r_CB_nom  = max (ZLB_min,r_Taylor_NEW )  ;	// 60

	shock_R_rp =  p_R_rp^(1-rho_e_R_rp) * shock_R_rp(-1)^rho_e_R_rp * exp(e_R_rp* std_e_r_rp ); 		                   	
	R_s_nom = (1 + r_CB_nom) * shock_R_rp   ;	//  RiskPremiumShock
		
	// some validation:	
	// the natural rate of interest based on BER (or EK):
	%r_n = (R_s_SS - 1 ) - chi_b * ((nu +  phi) * (b_b /b_BAR - 1))  ;			
	r_n = (R_s_SS - 1 ) - chi_b * (exp((nu +  phi) * (b_b /b_BAR - 1))-1)  ;			
	//	r_n= (R_s_SS - 1 ) - chi_b * ( R_b_Euler/R_s - 1)  ;			
	// the natural rate of interest implied from the aggregate output van the AD \ IS curve:
	r_n_imp =(R_s_SS-1)+(C-C(+1))/((chi_b*C_b_BAR_l+chi_s*C_s_BAR_l)*sigma_b)+(R_s_nom/R_s_nom_SS-1)-(pi(+1)-(Pi_BAR-1));

	PI_Y 	= Y_prod - (w*L + q*K); 		
	Yb_diff =  C_b + Qk * I_b + DB_b + TB_b - 	w * L_b - q * K_b ; 
	w_diff 		= (1-alpha) * Z * K_L^alpha * MC - w ;
	//delta_Check = Y - C - I  - I_AC - TB   ; // must =0		
	//delta_Check = Y - C - I * ( 1  +  I_AC ) - TB   ; // must =0	
	delta_Check = Y - C - Qk* I  - TB   ; // must =0	

	// Definations:
	r_s=R_s-1;
	r_b=R_b-1;
	r_f_s=R_f_s-1;
	r_f_b=R_f_b-1;										// Eq 70
	r_s_nom = R_s_nom 	- 1 ;
	r_b_nom = R_b_nom 	- 1 ;
	pi		= Pi		- 1 ;	
	y_hat	= Y  / Y_BAR  - 1 ;
	y_gap	= y_hat - y_tilde ;
	MC_hat 	= MC / MC_BAR - 1 ;
	pi_foreign_bank_from_b 	= b_f_b * ( 1/R_world 	- 1/R_f_b);	
	pi_foreign_bank_from_s 	= b_f_s * ( 1/R_world 	- 1/R_f_s);	
	pi_foreign_bank			= chi_b * pi_foreign_bank_from_b + chi_s * pi_foreign_bank_from_s;	
	C_diff 		= C_s / C ;					// 80	
	NetWorth_b 	= Qk * K_b - b_b - b_f_b	; // balance sheet identitiy
	LeverageRatio_b = b_b / (Qk * K_b)  ;
	b_gdp  		= b_b 	/ (Y_b*4) ;	
	b_f_b_gdp 	= chi_b * b_f_b / (Y*4) ;	
	b_gdp_tot	= chi_b * b_b 	/ (Y * 4) ;	
	
	r_s_annu 		= 4 * r_s  	;	
	r_f_s_annu 		= 4 * r_f_s ;
	r_b_annu 		= 4 * r_b  	;	
	r_f_b_annu 		= 4 * r_f_b	;		
	r_REP_Euler_annu= 4 * (R_REP_Euler-1) ;		   // 90 
	spread_r_b_annu = 4 * (Spread_R_b - 1 ) ; 	
	spread_r_k_annu = 4 * (Rk / R_s - 1 ) ; 
	
	r_CB_nom_annu 	= 4 * r_CB_nom ;
	r_s_nom_annu 	= 4 * r_s_nom ;
	r_RP_annu 	= 4 * (shock_R_rp-1) ;		
	shock_spread_ann = 4 * (shock_Spread - 1 ) ; 		
	r_b_nom_annu	= 4 * r_b_nom ;
	pi_annu  		= 4 * pi  ;	
	r_b_Euler_annu  = 4 * ( R_b_Euler - 1 ) ;
	E_pi_annu		= 4 * ( E_Pi - 1 ) ;		
	E_pi_s_annu		= 4 * (E_Pi_s - 1 ) ;	
	E_pi_REP_annu	= 4 * (E_Pi_REP-1) ;	
	r_k_annu		= 4 * ( Rk - 1 )	;     // 99 			
end;

initval; // initial Steady State values				

      y_tilde     =   0 ;
	  ExoZeroRate = 1 ;
	Z 	= Z_BAR ;
	e_Z = 0	 ;		
	e_delta = 0	 ;		
	delta =  p_delta   ; 	
	K2Cltr_BAR = K2Cltr_H	;		
	K2Cltr = K2Cltr_H	;		
	Depo2Cltr_f = Depo2Cltr_f_H;
	K2Cltr_f = K2Cltr_f_H;		
	R_s 	= R_s_SS ;
	R_f_s	= R_s_SS ;
	r_s 	= R_s_SS - 1 ; 
	r_f_s	= R_s_SS - 1 ;	
	R_b_Euler 	= R_b_Euler_SS ;
	R_b 	= R_b_SS_H ;
	R_f_b	= R_b_SS_H ;
	r_b 	= R_b_SS_H - 1;	
	r_f_b	= R_b_SS_H - 1;		
	Spread_R_b 	= R_b_SS_H / R_s_SS ;	

	q 	= q_BAR ;
	K_L = K_L_BAR ;
	w 	= w_BAR ;
	// assumption (EK) L_b=L_s
	L_b = L_BAR ; 
	L_s = L_BAR ; 
	L 	= L_BAR ;
	K_b = K_b_BAR ;	
	K 	= K_BAR ;
	I_b	= I_b_BAR	;				
	I 	= I_BAR ;
	Y 	= Y_BAR 	;
	Y_prod = Y_BAR;
	
	pi_local_bank 			= -b_s_SS_H 	* ( 1/R_s_SS - 1 / R_b_SS_H); 	
	
	
@#if Bank_by_Savers ==1 
	Y_s = w * L_s + pi_local_bank ;	
@#else  
	Y_s = w * L_s  ;    // so pi_local_bank go to borrowers as GK. need to update SS respectivly !!!
@#endif
//end of @#if Bank_by_Savers == 1		
	
	
	Y_b=  (Y - Y_s * chi_s)/chi_b ;			
	
	PI_Y = Y- chi_b * Y_b - chi_s * Y_s ; // shuold be 0
	
	b_f_b 	= b_f_b_BAR_h ;
	b_f_s 	= b_f_s_BAR_h ;
	b_b 	= b_b_SS_H 	;
	b_s 	= b_s_SS_H ;
	
	K2f = K2f_h ;
	b_f_b_limK 	= b_f_b_limK_BAR_h ;	
	b_f_s_limK 	= b_f_s_limK_BAR_h ;
	b_BAR  		= b_BAR_SS_H;  	
			
	TB_s = TB_s_BAR_h ;
	TB_b = TB_b_BAR_h ;
	TB   = TB_BAR_h ;	
	DB_b = DB_b_BAR_h ;
	DB_s = DB_s_BAR_h ;
	
	Pi = Pi_BAR; 	
	E_Pi = Pi_BAR; 	
	R_s_nom = R_s * Pi_BAR;
	R_b_nom = R_b * Pi_BAR;			
	y_hat = 0 ;
	y_gap = 0 ;
		
	r_s_nom = R_s_nom 	- 1 ;
	r_b_nom = R_b_nom 	- 1 ;	
	pi 		= Pi_BAR-1;	
		
	pi_foreign_bank_from_b 	= b_f_b_BAR_h * ( 1/R_world - 1/R_b_SS_H);
	pi_foreign_bank_from_s 	= b_f_s_BAR_h * ( 1/R_world - 1/R_s_SS);	
	pi_foreign_bank			= chi_b * pi_foreign_bank_from_b + chi_s * pi_foreign_bank_from_s;	
	
	C_b = C_b_BAR_h ;
	MU_b= MU_b_BAR_h ;
	C_s	= C_s_BAR_h ;	
	MU_s = MU_s_BAR_h ;
	C = chi_b * C_b + chi_s * C_s ;				
	C_diff = C_s / C ;
	NetWorth_b 	= Qk * K_b - b_b - b_f_b	;	
	
	Qk = 1 ;	
	LeverageRatio_b = b_b / (Qk * K_b)  ;
	
	I_AC_b = 0;
	I_MAC  = 0;
	I_AC = 0 ;	

    m_b  = beta_b ;
	m_s  = beta_s ;
	
	Ri= 1/beta_b  ;
	Rk= 1/beta_b  ;		

	
	delta_Check =  0 ;	
		
	r_n= (1/beta_s - 1 ) - chi_b * (nu +  phi) * (b_b /K2Cltr_BAR - 1)  ;	
	r_n_imp =(R_s_SS-1);
	Yb_diff = (w * L_b + q * K_b)- Y_b ;	
	b_gdp 		= b_b 	/ (Y_b*4) ;	
	b_f_b_gdp 	= chi_b * b_f_b / (Y*4) ;	
	b_gdp_tot	= chi_b * b_b 	/ (Y * 4) ;	
	w_diff 		= (1-alpha) * Z * K_L^alpha - w ;
	MC = (q/alpha)^alpha * (w/(1-alpha))^(1-alpha)* (1/Z);	
	MC_hat 	= MC / MC_BAR - 1 ;	
	

	r_s_annu 		= 4 * r_s  	;	
	r_f_s_annu 		= 4 * r_f_s ;
	r_b_annu 		= 4 * r_b  	;
	r_f_b_annu 		= 4 * r_f_b	;
	spread_r_b_annu = 4 * (Spread_R_b - 1 ) ; 
	spread_r_k_annu = 4 * (Rk / R_s - 1 ) ; 
	r_s_nom_annu 	= 4 * r_s_nom ;
	r_b_nom_annu	= 4 * r_b_nom ;
	pi_annu  		= 4 * pi  ;
	r_b_Euler_annu  = 4 * ( R_b_Euler - 1 ) ;
	E_pi_annu		= 4 * ( E_Pi - 1 ) ;
	r_k_annu		= 4 * ( Rk - 1 )	;		
	
	MU_REP =  (1 - beta_s * h_s )*((1 - h_s)* C) ^(-sigma_s) ;	
	m_REP = beta_s ;		
	R_REP_Euler = 1/ beta_s ;			
	r_REP_Euler_annu= 4 * (R_REP_Euler-1) ;		
	E_Pi_REP 		= R_s_nom / R_REP_Euler ;  // as in representative agent model	
	E_pi_REP_annu	= 4 * (E_Pi_REP-1) ;		
	E_Pi_s  		= R_s_nom / R_s;			
	E_pi_s_annu		= 4 * (E_Pi_s - 1) ;		
	r_Taylor=(R_s_SS-1)+(Pi_BAR-1)+phi_pi*(pi-(Pi_BAR-1))+phi_y*y_hat;
	r_Taylor_NEW=(R_s_SS-1)+(Pi_BAR-1)+phi_pi*(pi-(Pi_BAR-1))+phi_y*y_gap;
	
	
	e_R_rp		= 0 ;
	shock_R_rp = p_R_rp ;	
 	r_RP_annu 	= 4 * (shock_R_rp-1) ;	
	r_CB_nom = r_s_nom ;	
	r_CB_nom_annu 	= 4 * r_CB_nom ;
	
	e_Spread = 0 ;
	shock_Spread = 1 ; 	
	shock_spread_ann = 4 * (shock_Spread - 1 ) ; 	
	
	e_NW		= 0 ; 
	GiftFromBorrowers  = 0	;
	shock_NW 		   = 1	;			
	
end;
//check;
steady;
saved_steady_state_start  = [saved_steady_state_start oo_.steady_state] ;

endval;
      y_tilde     =   0 ;
	  ExoZeroRate = 1 ;
	Z 	= Z_BAR ;
	e_Z = 0	 ;	
	e_delta = 0	 ;		
	delta =  p_delta   ; 	
	K2Cltr_BAR = K2Cltr_L	;		
	K2Cltr = K2Cltr_L	;		
	Depo2Cltr_f = Depo2Cltr_f_L ;	
	K2Cltr_f = K2Cltr_f_L ;
	R_s 	= R_s_SS ;
	R_f_s	= R_s_SS ;
	r_s 	= R_s_SS - 1 ; 
	r_f_s	= R_s_SS - 1 ;	
	R_b_Euler 	= R_b_Euler_SS ;
	R_b 	= R_b_SS_L ;
	R_f_b	= R_b_SS_L ;
	r_b 	= R_b_SS_L - 1;	
	r_f_b	= R_b_SS_L - 1;		
	Spread_R_b 	= R_b_SS_L / R_s_SS  ;
	
		
	q 	= q_BAR ;
	K_L = K_L_BAR ;
	w 	= w_BAR ;
	// assumption (EK) L_b=L_s
	L_b = L_BAR ; 
	L_s = L_BAR ; 
	L 	= L_BAR ;
	K_b = K_b_BAR ;
	K 	= K_BAR ;
	I_b	= I_b_BAR	;			
	I 	= I_BAR ;
	Y 	= Y_BAR 	;
	Y_prod = Y_BAR;
	
	pi_local_bank = -b_s_SS_L 	* ( 1/R_s_SS - 1 / R_b_SS_L); 		
	@#if Bank_by_Savers ==1 
		Y_s = w * L_s + pi_local_bank ;	
	@#else  
		Y_s = w * L_s  ;    // so pi_local_bank go to borrowers as GK. need to update SS respectivly !!!
	@#endif
	//end of @#if Bank_by_Savers == 1			
	Y_b=  (Y - Y_s * chi_s)/chi_b ;			
	
	PI_Y = Y- chi_b * Y_b - chi_s * Y_s ; // shuold be 0
			
	b_f_b 	= b_f_b_BAR_l ;
	b_f_s 	= b_f_s_BAR_l ;
	b_b 	= b_b_SS_L 	;
	b_s 	= b_s_SS_L ;
		
	K2f = K2f_l ;
	b_f_b_limK 	= b_f_b_limK_BAR_l ;	
	b_f_s_limK 	= b_f_s_limK_BAR_l ;
	b_BAR  	= b_BAR_SS_L; 	
		
	TB_s = TB_s_BAR_l ;
	TB_b = TB_b_BAR_l ;
	TB   = TB_BAR_l ;	
	DB_b = DB_b_BAR_l ;
	DB_s = DB_s_BAR_l ;
	
	Pi = Pi_BAR; 	
	E_Pi = Pi_BAR; 	
	R_s_nom = R_s * Pi_BAR;
	R_b_nom = R_b * Pi_BAR;			
	y_hat = 0 ;
	y_gap = 0 ;
		
	r_s_nom = R_s_nom 	- 1 ;
	r_b_nom = R_b_nom 	- 1 ;	
	pi 		= Pi_BAR-1;	
		
	pi_foreign_bank_from_b 	= b_f_b_BAR_l * ( 1/R_world - 1/R_b_SS_L);
	pi_foreign_bank_from_s 	= b_f_s_BAR_l * ( 1/R_world - 1/R_s_SS);	
	pi_foreign_bank			= chi_b * pi_foreign_bank_from_b + chi_s * pi_foreign_bank_from_s;	
	
	C_b = C_b_BAR_l ;
	MU_b= MU_b_BAR_l ;
	C_s	= C_s_BAR_l ;	
	MU_s = MU_s_BAR_l ;
	C = chi_b * C_b + chi_s * C_s ;
	C_diff = C_s / C ;
	NetWorth_b 	= Qk * K_b - b_b - b_f_b	;
	
	Qk = 1 ;
	LeverageRatio_b = b_b / (Qk * K_b)  ;
	
	I_AC = 0 ;
	I_AC_b = 0 ;
	I_MAC = 0 ;
	
    m_b  = beta_b ;
	m_s  = beta_s ;	

	Ri= 1/beta_b  ;
	Rk= 1/beta_b  ;		
		
	
	
	delta_Check =  0 ;		
		
	r_n= (1/beta_s - 1 ) - chi_b * (nu +  phi) * (b_b /K2Cltr_BAR - 1)  ;	
	r_n_imp =(R_s_SS-1);
	Yb_diff = (w * L_b + q * K_b)- Y_b ;		
	b_gdp 		= b_b 	/ (Y_b 	*4 ) ;	
	b_f_b_gdp 	= chi_b * b_f_b / (Y*4) ;	
	b_gdp_tot	= chi_b * b_b 	/ (Y * 4) ;	
	w_diff 		= (1-alpha) * Z * K_L^alpha - w ;
	MC = (q/alpha)^alpha * (w/(1-alpha))^(1-alpha)* (1/Z);
	MC_hat 	= MC / MC_BAR - 1 ;
	
	r_s_annu 		= 4 * r_s  	;	
	r_f_s_annu 		= 4 * r_f_s ;
	r_b_annu 		= 4 * r_b  	;
	r_f_b_annu 		= 4 * r_f_b	;
	spread_r_b_annu = 4 * (Spread_R_b - 1 ); 
	spread_r_k_annu = 4 * (Rk / R_s - 1 ) ; 
	r_s_nom_annu 	= 4 * r_s_nom ;
	r_b_nom_annu	= 4 * r_b_nom ;
	pi_annu  		= 4 * pi  ;
	r_b_Euler_annu  = 4 * ( R_b_Euler - 1 ) ;
	E_pi_annu		= 4 * ( E_Pi - 1 ) ;
	r_k_annu		= 4 * ( Rk - 1 )	;	
		
	MU_REP =  (1 - beta_s * h_s )*((1 - h_s)* C) ^(-sigma_s) ;	
	m_REP = beta_s ;		
	R_REP_Euler = 1/ beta_s ;			
	r_REP_Euler_annu= 4 * (R_REP_Euler-1) ;		
	E_Pi_REP 		= R_s_nom / R_REP_Euler ;  // as in representative agent model	
	E_pi_REP_annu	= 4 * (E_Pi_REP-1) ;		
	E_Pi_s  		= R_s_nom / R_s;			
	E_pi_s_annu		= 4 * (E_Pi_s - 1) ;		
	r_Taylor=(R_s_SS-1)+(Pi_BAR-1)+phi_pi*(pi-(Pi_BAR-1))+phi_y*y_hat;
	r_Taylor_NEW=(R_s_SS-1)+(Pi_BAR-1)+phi_pi*(pi-(Pi_BAR-1))+phi_y*y_gap;
	
	e_R_rp		= 0 ;
	shock_R_rp = p_R_rp ;	
 	r_RP_annu 	= 4 * (shock_R_rp-1) ;	
	r_CB_nom = r_s_nom ;	
	r_CB_nom_annu 	= 4 * r_CB_nom ;
	
	e_Spread = 0 ;
	shock_Spread = 1 ; 	
	shock_spread_ann = 4 * (shock_Spread - 1 ) ; 	
		
	e_NW		= 0 ; 
	GiftFromBorrowers  = 0	;
	shock_NW 		   = 1	;			
end;
steady;
saved_steady_state_end  = [saved_steady_state_end oo_.steady_state] ;

@#if Read_FlexPriceModelIRF==1 
	y_tilde_Values = FlexModel_IRF(3:end-1,scenario+1); 
@#endif

shocks;

	var y_tilde;  // a temporary shock to TFP
		periods  1 : @{IRF_periods};
		@#if Read_FlexPriceModelIRF==1 
			values   (y_tilde_Values);	
		@#else 
			values   0	;			
		@#endif

var ExoZeroRate;  // external determination of zero monetary rate
		periods  1 : @{IRF_periods};		
		values   (vector_ExoZeroRate);	
	
		
	var e_Z;  // a temporary shock to TFP
		periods  1;
		values   1;
		
	var e_delta;  // a temporary shock to capital depritiation
		periods  1;
		values   1;

	var e_R_rp;  // Risk Premium shock
		periods  1;
		values   1;			
	
	var e_Spread;  // 
		periods  1;
		values   1;		
			
	var e_NW;  // Risk Premium shock
		periods  1;
		values   1;		
	//  var e_monetary_delay;  // a temporary shock to capital depritiation
	//	 periods  1:mon_delay;
	// 		values   0; 
	// var e_b;  // a temporary shock to borowers
	// periods  1;
	// values   1;
	// var e_s;  // a temporary shock to savers
	// periods  1;
	// values   1;
end;   //shocks
   
//perfect_foresight_setup(periods=50)   ;
//perfect_foresight_solver(stack_solve_algo=7, solve_algo=9);
//simul(periods=50 , maxit=500, stack_solve_algo=7, solve_algo=9 ) ;  //      periods = 100
simul(periods = @{IRF_periods} , maxit=500) ;  //      periods = 100
// if you get: "Warning: Matrix is singular to working precision. "  --> try periods=100 and more...
 

  //stoch_simul(order=1, irf=40 ) ;  //      periods = 100
  
  //saved_irfs(1,scenario)  	  	= oo_.irfs ;  
  saved_irfs(:,:,scenario) 	  	= oo_.endo_simul ;     
  
  if scenario==1
	write_latex_static_model;
	write_latex_dynamic_model;
	  
    save.params.names	= cellstr(M_.param_names);
	save.params.values	= [];
	save.endo.names		= cellstr(M_.endo_names);	
	save.endo.std		= [];	
	save.endo.autocorr	= [];
  end
  save.params.values=[save.params.values M_.params];     
//save.endo.std =[save.endo.std sqrt(diag(oo_.var))];
//if isfield(oo_,'autocorr')
//	save.endo.autocorr = [save.endo.autocorr diag(oo_.autocorr{1,1})];
//  else
//	save.endo.autocorr = [save.endo.autocorr NaN];	
//  end;
  
end  % for scenario = 1: tot_Graph_num   // finish all simulations...now plot and save them
////////////////////////////////////////////////////////////////
close all;
///////////////////
disp('Save Parameters and Steady State to Excel');
xlswrite(filename, {'End simulations at: ' , datestr(clock)}, 'output', 'H2');

xlswrite(filename,  {'Parameters ' , 'Value'}	, 'output', 'A1');
xlswrite(filename, save.params.names  	, 'output', 'A2');
xlswrite(filename, save.params.values 	, 'output', 'B2');

xlswrite(filename, {'Varibles' , 'End - Steady State'} , 'output', 'J1');
xlswrite(filename, save.endo.names 	, 'output', 'J2');
xlswrite(filename, saved_steady_state_end , 'output','K2');

xlswrite(filename, {'Start -  Steady State'} , 'output', 'Q1');
xlswrite(filename, saved_steady_state_start , 'output','Q2');
//xlswrite(filename, {'Standard','Deviation'} , 'output', 'N55');
//xlswrite(filename, save.endo.std 		, 'output', 'B42');
//xlswrite(filename, {'Autocorrelation'}	, 'output', 'A63');
//xlswrite(filename, save.endo.autocorr	, 'output', 'B64');

% matlab PLOT
mkdir('fig');
mkdir('emf');
mkdir('eps');	
mkdir('pdf');	
mkdir('png');	

fontname = 'Times New Roman' ; // 'Cambria Math';   // to check fonts list in matlab: c = listfonts
set(0,'DefaultAxesFontName',fontname);
set(0,'DefaultTextFontName',fontname);
set(0,'DefaultAxesFontSize',8);
set(0,'DefaultTextFontSize',8)

for fig_num = 1:size(disply,1)
	disp(['Drawing & Saving Figure number ', num2str(fig_num), ' of ' ,num2str(size(disply,1))]);
	choice 			= disply{fig_num};
	choice_display 	= choice_display_arr{fig_num};
	choice_save_xls	= choice_save_xls_arr{fig_num}	 ;
		
	//name = fieldnames(saved_irfs);
	name = M_.endo_names;
	
	figure_filename = num2str(fig_num);
	
	%Screen_Size = get(0,'ScreenSize');
	%x_max = 300 ;
	%y_max = 200 ;
	%figure1 = figure('Name',figure_filename,'Color',[1 1 1],'PaperPositionMode','manual','PaperUnits','centimeters','PaperSize', [x_max, y_max ], 'PaperPosition',[ 1 ,1 , x_max-1, y_max-1 ]  );  %****** to update!!!!	
	figure1 = figure('Name',figure_filename,'Color',[1 1 1]);  %****** to update!!!!	
	
	x_plots=  size(choice,1);
	y_plots=  size(choice,2);
	// becouse subplot is in transpose order...
	choice=choice';
	choice_display  = choice_display';
	choice_save_xls = choice_save_xls';	
	
	for IRF_num =1:numel(choice) 		
		//disp(choice(IRF_num));				
		fprintf('%s| ',  char(choice(IRF_num)));
		temp=[];    
		for scenario=1:size(saved_irfs,3)        
			//vec    = getfield(saved_irfs(scenario), name{choice(IRF_num)});  %// the irf is C_t-C_ss
			varible_number =  find(ismember(save.endo.names,choice(IRF_num)));
			vec    = squeeze(saved_irfs(varible_number,:,scenario));  %// the irf is C_t-C_ss
			
	// choice_display = 0 : C_t-C_ss         (Dynare Defult)
	// choice_display = 1 : (C_t-C_ss)/C_ss  (this is similer as the IRF for logC !!! )
	// choice_display = 2 : C_t
	// choice_display = 3 : go from log back to valus...C_t			
			if  (choice_display(IRF_num)==0)				
				disp_type = '\Delta^{from}_{new.ss}' ;
				vec = vec - saved_steady_state_end(varible_number,scenario)   ;				
				if (start_t==0), vec= [0 vec] ,	end;				
			elseif (choice_display(IRF_num)==1)							
				disp_type = ' \% \Delta^{from}_{new.ss}' ;
				vec = vec ./ saved_steady_state_end(varible_number,scenario) - 1 ;
				if (start_t==0), vec= [0 vec] ,	end;					
			elseif (choice_display(IRF_num)==2)
				disp_type = ' Value ' ;
				//vec = vec + saved_steady_state_end(varible_number,scenario) ;
				if (start_t==0)	, vec= [saved_steady_state_end(varible_number,scenario)  vec] ,	end;							
			elseif (choice_display(IRF_num)==3)
				disp_type = ' Value ' ;
				vec = saved_steady_state_end(varible_number,scenario) * exp(vec) ;
				if (start_t==0)	, vec= [exp(saved_steady_state_end(varible_number,scenario))  vec] ,	end;				
			end; %// if  choice_display...		
			temp =[temp , vec'];      					
		end 
		
		if or(choice_display(IRF_num)==0 , choice_display(IRF_num)==1)
			temp=[temp , zeros(length(vec),1)];  %// y=0 line                        
		elseif or(choice_display(IRF_num)==2 , choice_display(IRF_num)==3)
			temp=[temp , ones(length(vec),1)*saved_steady_state_end(varible_number,scenario)]; % // y=ss line                        
		end;
		
		subplot(x_plots,y_plots,IRF_num); 		
		x_temp = 0 : irf_periods_to_disp ; 
		y_temp = 1 : length(x_temp) ; 		 		
		plot1 = plot(x_temp,temp(y_temp,:)); 
		y_plot_min = min(min(temp(y_temp,:)));
		y_plot_max = max(max(temp(y_temp,:)));		
		set(plot1,'LineWidth',1.2);		
		for scenario = 1:tot_Graph_num				
			irf_MarkerSize =  input_M(64,scenario);
				if ~isnan(irf_MarkerSize) , set(plot1(scenario),'MarkerSize',irf_MarkerSize) , end;															
			irf_MarkerEdgeColor =  char(input_name(65,scenario+1));
				if ~isnan(irf_MarkerEdgeColor) ,set(plot1(scenario),'MarkerEdgeColor',irf_MarkerEdgeColor), end;				
			irf_Marker			=  char(input_name(66,scenario+1));
				if ~isnan(irf_Marker) ,set(plot1(scenario),'Marker',irf_Marker), end;				
			irf_LineWidth		=  input_M(67,scenario);
				if ~isnan(irf_LineWidth) , set(plot1(scenario),'LineWidth',irf_LineWidth), end;				
			irf_LineStyle		=  char(input_name(68,scenario+1));
				if ~isnan(irf_LineStyle) ,set(plot1(scenario),'LineStyle',irf_LineStyle), end;				
			irf_Color			=  char(input_name(69,scenario+1));
				if ~isnan(irf_Color) , set(plot1(scenario),'Color',irf_Color), end;					
		end; % for scenario = 1:tot_Graph_num										
		set(plot1(tot_Graph_num+1),'LineWidth',1,'LineStyle',':','Color','black');				
		y_plot_margin = (y_plot_max - y_plot_min)* 0.05  ; 		
		if (y_plot_margin > 0.00001)		
			ylim([ y_plot_min - y_plot_margin  , y_plot_max + y_plot_margin  ]);						
		end;					
		title_name = ['$$   ', M_.endo_names_tex(varible_number,:) , '\ \ \ \ \ (\ ' , disp_type , '\ )',' $$' ] ; 
		title( title_name , 'interpreter' , 'latex','fontsize',8 )	;
		axis on					
		%save to Exel		
		if(save_irf_xls==1)&&(choice_save_xls(IRF_num)==1)				
			IRF_name=strtrim( M_.endo_names(varible_number,:) );
			xlswrite(filename, {'Saved at: ' , datestr(clock)}  , IRF_name , 'K1');			
			xlswrite(filename, cellstr( title_name )  		,IRF_name  , 'A1');
			xlswrite(filename, input_M(1,:)					,IRF_name  , 'B2');
			xlswrite(filename, [(0:length(temp)-1)'	,temp]	,IRF_name  , 'A3');
		end; %save_irf_xls
		
		if (fig_num==Legend_Fig_Num)&&(IRF_num==Legend_subPlot_Num)  
			LegendText=[];
			for parm_i=params_display
				LegendText=[LegendText  repmat( [strtrim(M_.param_names_tex(parm_i,:)) '='],tot_Graph_num,1) num2str( input_M(parm_i,:)') repmat(', ',tot_Graph_num,1)];  
			end;			
			hleg=legend(LegendText);
			if verLessThan('matlab','8.4')
			   set(hleg,'YColor',[1 1 1],'XColor',[1 1 1],'fontsize',6);
			else
			    hleg.FontSize=6;
			end
		end % if
		
	end % for IRF_num					
	fprintf(' ...now saving figures \n');
	cd('fig');	
	saveas(gcf,figure_filename);				
	%print('-depsc2','-tiff',figure_filename);		
	cd('../emf');	
	print('-dmeta','-r600',figure_filename);
	cd('../eps');
	print('-depsc2','-tiff','-r600',figure_filename)
	cd('../pdf');
	print('-dpdf','-r600',figure_filename);	
	cd('../png');
	print('-dpng','-r600',figure_filename);
	cd('../');
	%saveTightFigure([figure_filename '_']);
	close all;		
end; % for fig_num
xlswrite(filename,{'End saving results: ', datestr(clock)}, 'output', 'H3');
