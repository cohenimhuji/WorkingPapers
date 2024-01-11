 ///% 
 // Documentation:
 // Code for the small-open-economy model as in the IMF working paper:
 // Practical Model-Based Monetary Policy Analysis - // A How-To Guide.
 // By Berg Karam and Laxton (2006) Modified for the National Bank of Georgia (2010)
 //%/
 // ON Observables: quarterly: dy, dy_row. annualized: pie, pie_row, dfx, pierpoil. Yaakov 06.04.2020
 ///% // Variables:
// =========
var 

// Rest of the World //
	 ygap_row 	$\widehat{y}^{RoW}$ 	// 	    World output gap, unobservable
	 dy_row 	$\Delta{y}^{RoW}$  	 	//      World real growth, observable
	 gst_row 	$g*^{RoW}$				//      World steady-state potential output growth, annual, unobservable
	 RR_row     $r^{RoW}$				//      World real interest rate, unobservable (as calculated via identity) 
	 RRst_row   $r*^{RoW}$				//      World steady-state real interest rate, unobservable
	 pie_row    $\pi^{RoW}$				//      World inflation, observable.
	 pie4_row 	$\pi{4}^{RoW}$			//      World inflation 4-quarter, unobservable (as calculated via identity)
	 piest_row 	$\pi{*}^RoW$			//      World steady-state inflation, unobservale	
	 RRgap_row 	$\widehat{r}^{RoW}$		//      World real interest rate gap, unobservable
	 i_fed      $i^{Fed}$				// obs. World short-run int. rate on USD (fed fund) observable
	
// Small Open Economy (SOE)

	 ygap		$\widehat{y}$			// 		SOE output gap, unobservable
	 dy      	$\Delta{y}$				//  	SOE real growth, observable
	 gst     	$g^*$					// 		SOE steady-state potential output growth, annual, unobservable
	 RR      	$r$	 					// 		SOE real interest rate, unobservable (as calculated via identity)
	 RRst     	$r^n$					// 		SOE steady-state real interest rate, unobservable
	 RRst_wrong
	 pie       	$\pi$	 				//   	SEO inflation, observable
	 pie4     	$\pi^{4}$				// 		SOE inflation 4-quarter, unobservable (as calculated via identity) 
	 piest     	$\bar{\pi}$				// 		SOE steady-state inflation, unobservable	
	 RRgap     	$\widehat{r}$			// 		SOE real interest rate gap, unobservable
	 i_BOI		$i$				// OBS.	SOE short-run interest rate, observable
	 z        	$z$						// 		SOE real exchange rate, (identified)
	 zst    	$z^*$					// 		SOE steady-state real exchange rate, unobservable
	 zgap    	$\widehat{z}$			// 		SOE real exchange rate gap, unobservable
	 rhost   	$\rho^{*}$				// 		SOE equilibrium risk premium, unobservable
	 dfx      	$\Delta{FX}$			//    	SOE nominal depreciation (quarterly), observable
	 pie4RPoil  $\pi{4}^{RPoil}$		// 		Annual change in relative price of oil, unobservable (so far)
	// RS_TR    	$i^{TR}$  	 			// 		SOE short-run nominal interest rate (Taylor rule), unobservable 
	 pieRPoil  	$\pi^{RPoil}$  		    //   	SOE RoC of the Relative Price of oil. observable.
	 dz									// 		Added by Alon after mission 2
	 u_zst		$u^{z^*}$				// 		Alon, Jun 2011. Serially correlated shock to enable predicted trend change
	
	

% Addition by Alex and Nimrod:	
	i_b        $ i^b $        //The interest rate for the borrowers
    spread_gap $\widehat{\Delta}$          // The spread between borrowers and lenders
    B_gap      $\widehat{b}$     //The debt gap
    cgap_b     $\widehat{c}^b$          //consumption gap of the borrowers 
    BY_gap     $\widehat{lev}$           //LEVERAGE RATIO  
    shock_spread_gap
    di_BOI             //change in the BOI interest rate
    dygap              //change in the output gap
    u_cbor   	; //shock to Euler of borrowers


varexo 
	eps_ygap_row eps_pie_row eps_RS_row eps_piest_row eps_RRst_row  eps_gst_row eps_cb   // Rest of the World (RoW)
	eps_ygap eps_pie     eps_RS     eps_piest     eps_RRst          eps_gst       // Small open economy (SOE) % canceld	eps_ygap
	eps_Rp_Fx u_spread_gap	  eps_zst	 eps_pieRPoil 		%eps_pieC
	% Credit Block by Alex and Nimrod
	; 

parameters 
 		   ///% // names:
	Bld_row Blag_row Brr_row 							// ygap at RoW
	Apld_row Aygap_row									// pie  at RoW
	Glag_row Gpie_row Gygap_row 						// RS   at RoW
	Lp_row pieBAR_row Lrr_row rrBAR_row Lg_row gBAR_row // Equilibrium at RoW
	Bld Blag Brr Bzgap Byrow Brr_b_factor 				// ygap at SOE
	Apld Aygap Az A0 A1 								// pie  at SOE
	Glag Gpie Gygap Gfx 								// RS   at SOE
	Lp pieBAR Lrr rrBAR Lg gBAR Loil 					// Equilibrium at SOE
	Ls_row sprBAR_row Ls sprBAR 						// Spreads
	Dz Lz zBAR vRPoil Luz 								// Real exchange rate & oil
    par_ystar
    par_Eqr
	
	///% // Credit block by Alex and Nimrod
alfa2_row
alfa1_row
alfa1
alfa2
alfa3
alfa4
alfa5
p_spr_lev
p_rho_spread
par_b1
par_b2
par_v

  // just for Comparison between Models
  par_flag
  
	//%/
; 

///% // Output gap:
	Bld_row = 0.3873; 
	Blag_row = 0.7737; 
	Brr_row = 0.0984; 
	 //---------------
	Bld = 0.4523; 
	Blag = 0.592656 * 0 + (1 - 0.475481) * 0 + 1 - Bld; 
	Brr = 0.1 ; // updated at 28.12.021. before that we use Yaacov value of :0.0219; 
	Brr_b_factor = 5 ; % updated at 28.12.021. before that we use : 30 ; % 60;
	Bzgap = 0.0033; 
	Byrow = 0.0254; // 

///% // Phillips curve:
	Apld_row = 0.7111; 
	Aygap_row = 0.1028; 
	Apld = 0.5864; 
	Aygap = 0.1172; 
	Az = 0.0727;  
	A0 = 0.0146;
	A1 = 0; 

///% // Policy Rule:
	Glag_row = 0.8994; 
	Gpie_row = 1.4985; 
	Gygap_row = 0.3033; 
	Glag = 0.8448; 
	Gpie = 1.8315; 
	Gygap = 0.4480; 
	Gfx = 0.00; 			// (should be smaller than one)

///% // Modified UIP:
	Dz = 0.6180; 			//   Weight of rationality in the expectations formation of RER
	Lz = 0.9650 - 0.165;	//  Inertia of equilibrium RER.
	zBAR = 0.00; 			// V  Long Run RER. With big enough shocks to z* and with dz as OBS, it can be anything.
	Luz = 0.95 + 0.049; 	// 	Inertia of shocks to z*

///% // Dynamic equilibrium:
	Lp_row = 0.95; 			//V  IT persistence.
	Lrr_row = 0.96; 		//V  Natural real interest-rate persistence. 
	Lg_row = 0.95;			//V  Inertia of potential growth. 
	pieBAR_row = 2.00;		//V  Long run inflation target (annual terms)
	rrBAR_row = 3.00; 		//V  Long run real interest rate (annual terms)
	gBAR_row = 0.45; 	//V  Long run annual growth rate
	Lp = 0.8; 				//V  IT persistence.
	Lrr = 0.97; 			//V  Natural real interest-rate persistence. Based on Lg.
	Lg = 0.95; 				//V  Inertia of potential growth rate. 
	Loil = 0.15; 			//V  Inertia of oil prices. 
	pieBAR = 2.00;			//V  Long run inflation target (annual terms)
	rrBAR = 3.00; 			//V  Long run real interest rate (annual terms)
	gBAR = 0.45; 		//V  Long run annual growth rate. By averege of OB_dy - updated 14.04.2020 Yaakov
	vRPoil = 0.01 * 0;		//   elasticity of potential growth WRT relative price of oil

///% // Spreads:
	Ls_row = 0.85; 			//V Inertia of offshore spread.
	sprBAR_row = 0; 		//V Long-run offshore spread.
	Ls     	   = 0.80;		//V Inertia of spread. 
	sprBAR = 0; 			//V Long-run spread.

///% // Credit Block by Alex and Nimrod:
alfa2_row=1;
alfa1_row=rrBAR_row-4*alfa2_row*gBAR_row;


par_b1=0.6;
par_b2=0.8;
par_v=10*0.0225; //as in Beningo (2020) *multiply for calibration reasons

par_Eqr=0.1;
par_ystar=0.1;
p_spr_lev=0.031; //The elasticity of spread w.r.t. leverage
p_rho_spread = 0.7;
alfa2=0.4; 
alfa3=0.6;
alfa4=0.5; //in Beningo(2020) for closed economy alfa4=2.37, for SOE I think should be, alfa4=0.5
alfa5=0.2; // ~as Chi
spread_gap_SS=0; 
alfa1=rrBAR-alfa2*4*gBAR-alfa3*4*gBAR_row+alfa4*spread_gap_SS ;//Restriction should be imposed on alfa1 
par_flag = 0;


//%/	
	

model; 

///% // The rest of the world economy (RoW):

///% // A_row. NK Behavioral equations:
// The only Core Endo. Varibales are:  ygap_row, pie_row, i_fed
	ygap_row = Bld_row * ygap_row(+1) + (1 - Bld_row) * ygap_row(-1) 
		-Brr_row * RRgap_row(-1) + eps_ygap_row; 						// Output gap (RoW)

	pie_row = Apld_row * pie4_row(4) + (1 - Apld_row) * pie4_row(-1) 
		+Aygap_row * ygap_row(-1) + eps_pie_row; 						// NKPC (RoW)

	i_fed = Glag_row * i_fed(-1) +
			(1 - Glag_row) * 
		(RRst_row + piest_row(4) + Gpie_row * (pie4_row(4) - piest_row(4))
		+ Gygap_row * ygap_row) + eps_RS_row;							// Policy (RoW)

///% // B_row. Dynamic equilibrium:
	piest_row = (1 - Lp_row) * pieBAR_row + Lp_row * piest_row(-1) + eps_piest_row; // Time verying IT (RoW)
	RRst_row = alfa1_row+alfa2_row*(4*gst_row(+1))+ eps_RRst_row;   // Time verying real rate (RoW)
	gst_row = (1 - Lg_row) * gBAR_row + Lg_row * gst_row(-1) + eps_gst_row; 		// Potential growth rate

///% // C_row. Identities:
	RRgap_row = RR_row - RRst_row; //Monetary stance abroad
	pie4_row = 0.25 * (pie_row + pie_row(-1) + pie_row(-2) + pie_row(-3)); 			// 4 quarters inflation
	RR_row = i_fed - pie_row(1); //Fisher equation													// Real int. rate.
    dy_row = gst_row + ygap_row - ygap_row(-1);		// Actual growth
						
///% // The small open economy:

///% // A. NK Behavioral equations:

// Output gap
	ygap = Bld * ygap(+1) + (1 - Bld) * ygap(-1) - Brr * RRgap(-1) 
		+Bzgap * zgap(-1) + Byrow * ygap_row + eps_ygap; 
		% please don't eliminate, just multiply by 0 or even beter - 0 std.
		% eps_ygap is ad hoc demad shock...  
		%  canceled: eps_ygap Alex: no meaning to this shock !!	

	pie = Apld * pie4(4) + (1 - Apld) * pie4(-1) + Aygap * ygap(-1) 
		+Az * dz + A0 * pieRPoil + A1 * pieRPoil(-1) + eps_pie; 		// NKPC

	z = Dz * z(1) + (1 - Dz) * z(-1) - (RR - RR_row - rhost) / 4 ;	// Modified UIP. Alex delete shock from here becuase it is redunant given shock eps_Rp_Fx
	
	// i_BOI = Glag * i_BOI(-1) + (1 - Glag) * 
		// (RRst + piest(4)  + Gpie * (pie4(4) - piest(4)) 
		// + Gygap * ygap + Gfx * dfx) + eps_RS; 									// Policy (TR=Taylor Rule)
	// OLD VERSION:
	// i_BOI = Glag * i_BOI(-1) + (1 - Glag) * 
		// ((1-par_flag)*RRst +(par_flag)*RRst_wrong + piest(4)  + Gpie * (pie4(4) - piest(4)) 
		// + Gygap * ygap + Gfx * dfx) + eps_RS; 
	//2.1.2021 : response to REAL FX	: dz
	i_BOI = Glag * i_BOI(-1) + (1 - Glag) * 
		((1-par_flag)*RRst +(par_flag)*RRst_wrong + piest(4)  + 
		+ Gpie * (0.75 *  (pie4(4) - piest(4)) +0.25 *  (pie4(0) - piest(4))) //Gpie * (pie4(4) - piest(4)) 
		+ Gygap * ygap + Gfx * dz) + eps_RS;
    di_BOI=i_BOI-i_BOI(-1);  
	dygap=4*(dy-gst);	//change in the output gap in annual terms (needed for the loss function)

  //--------------------------------------------------------------------------------

///% // B. Dynamic equilibrium:
	piest = (1 - Lp) * pieBAR + Lp * piest(-1) + eps_piest;						// Time verying IT
	
	RRst       = alfa1+alfa2*4*gst(+1)+alfa3*4*dy_row(+1)-alfa4*spread_gap -alfa5*(u_cbor(+1)-u_cbor)+eps_RRst; 	// NRI in Israel (Modification By Alex and Nimrod)
 	RRst_wrong = alfa1+alfa2*4*gst(+1)+alfa3*4*dy_row(+1)-  0  *spread_gap -0*(u_cbor(+1)-u_cbor)+eps_RRst; 	// NRI in Israel (Modification By Alex and Nimrod)

	gst = (1 - Lg-par_ystar) * gBAR + Lg * gst(-1) +par_Eqr*(zst-zst(-1))
    + par_ystar*dy_row-eps_gst; 							// Potential growth rate

	rhost = 4 * (zst - zst(1)) + (RRst - RRst_row)+eps_Rp_Fx; 					// Country risk premium
	zst = (1 - Lz) * zBAR + Lz * zst(-1) + u_zst; 								// Natural RER. Alon: with big enough shocks to eps_zst you don't need the tunes.
	u_zst = Luz * u_zst(-1) + eps_zst; 											// Inertial shocks to Z*, so as to enable predicted trend change
	pieRPoil = Loil * pieRPoil(-1) + eps_pieRPoil; 								// AR(1) process for the relative price of oil.
///% // C. Identities:
	RRgap = RR - RRst;															// Real int. rate gap
	pie4 = 0.25 * (pie + pie(-1) + pie(-2) + pie(-3));		// 4 quarters inflation
    RR = i_BOI - pie(1);	
    zgap = z - zst; 															// RER gap
	dfx = z - z(-1) + (pie - pie_row) / 4; 								// Nominal depreciation (quarterly)
	dy        = gst + ygap - ygap(-1)                      ; 					// Actual growth
	pie4RPoil = 0; 
	dz = z - z(-1);  //Quarterly Terms															// 14.10.10 Alon.

///% // E. Credit Block by Alex and Nimrod
spread_gap=p_spr_lev*BY_gap+shock_spread_gap;
shock_spread_gap= p_rho_spread *shock_spread_gap(-1)+u_spread_gap;
BY_gap=B_gap-ygap;
i_b=spread_gap+i_BOI;

//Budget constraint of borrowers
//B_gap= i_b-(rrBAR+pieBAR)+par_b1*(B_gap(-1)-(pie-pieBAR)-(gst-gBAR))+par_b2*(cgap_b-ygap);
// Determinacy is satisfied when the paramerer of the i_b is close to 1 when Brr is high, if Brr is original, the parameter should be less than 0.3
B_gap= 1 *0.25*(i_b-(rrBAR+pieBAR))
		+ 1.0075*(B_gap(-1)-0.25*(pie-pieBAR)-(gst-gBAR))+1.05*(cgap_b-ygap);

// maybe to adjust to somthing like:
//B_gap= RRgap + spread_gap + (pie(1)-piest(1))/(1+pieBAR)
//		+ 1.0075*(B_gap(-1)-(pie-piest)/(1+pieBAR)-(gst-gBAR)/(1+gBAR))
//		+1.05*(cgap_b-ygap);
	
//Euler equation of borrowers (the parameters here as in the aggreate IS equation)
//In Beningo (2020) the parameter Brr=-1.5 (here it equals to -0.1)
cgap_b = Bld * cgap_b (+1) + (1 - Bld) * cgap_b (-1)
		 - Brr * Brr_b_factor *(i_b-rrBAR- pie(1)+par_v*BY_gap-4*(gst(1)-gBAR))-(u_cbor(+1)-u_cbor);

u_cbor=0*u_cbor(-1)+eps_cb;

// also maybe to be consist with ygap:
//cgap_b = Bld * cgap_b (+1) + (1 - Bld) * cgap_b (-1) 
//	    - Brr * Brr_b_factor *( RRgap(-1)+ spread_gap(-1) 
//		                        + par_v*BY_gap-(gst(1)-gBAR)/(1+gBAR));
//%/

end;

initval; 
///% // Rest of the world:
	ygap_row = 0; // Output gap
	pie_row = pieBAR_row; 							// Inflation
	i_fed = rrBAR_row + pieBAR_row; 				// Nominal int rate
	piest_row = pieBAR_row; 						// Inflation target
	RRst_row = rrBAR_row; 							// Natural real rate
	RRgap_row = 0; 									// Real rate gap
	pie4_row = pieBAR_row; 							// 4 quarters inflation
	RR_row = rrBAR_row; 							// real rate
	gst_row = gBAR_row; 							// Potental growth rate (annualized)
	dy_row = gBAR_row; 						    	// Growth of actual gdp

///% // Small open econ:
	ygap = 0; 				// Output gap
	pie   = pieBAR; 		// Inflation
	piest = pieBAR; 		// Inflation target
	RRst = rrBAR; 			// Natural real rate
	RRst_wrong = rrBAR;	
	RRgap = 0; 				// Real rate gap
	pie4 = pieBAR; 			// 4 quarters inflation
	RR = rrBAR; 			// real rate
	gst = gBAR; 			// Potential growth rate (annualized)
	dy  = gBAR; 		// Growth of Actual Y

	z = 0; 									// Real Excange Rate (RER)
	zst = 0;								// Natural RER
	zgap = 0; 								// RER gap
	rhost = rrBAR - rrBAR_row - sprBAR_row; // Risk premium
	zst = 0; 								// Natural RER
	dfx = (pieBAR - pieBAR_row) / 4; 		// Nominal depreciation
	i_BOI = rrBAR + pieBAR; 		// Key NBG interest rate
	pie4RPoil = 0 ;                         // Annual change in relative price of oil
	shock_spread_gap=0;
end; 

steady; 
check; 
//pause;

shocks; 
///% // Rest of the World:
	//var eps_ygap_row  ; stderr 0.1725	; 
	//var eps_pie_row   ; stderr 1.6227	; 
	//var eps_RS_row    ; stderr 0.2201	; 
	//var eps_RRst_row  ; stderr 0.320326	; //shocks to NRI abroad
	//var eps_gst_row   ; stderr 0.187788 	; 
	var eps_Rp_Fx   ; stderr 0.3290		; //relevant for stoch. simulation 0.3290

///% // Small open economy:
	var eps_ygap  		; stderr   0.4106	;  // 
  	var eps_pie   		; stderr   1.9	;  // based on regression. In Jacob:2.6328
	var eps_RS    		; stderr   0.20	;  //unreasoble estimate of Yacob of 0.7292, I changed to 0.20
	//var eps_RRst  		; stderr   0.6118	;  //shocks to the NRI in Israel
	var eps_gst   		; stderr   0.20	;  //Means: shock of 0.8 in annual terms. In Jacob in quarterly terms:0.887248. 	
    //var eps_zst   		; stderr   0.2*2.1865 ;  
	//var eps_pieRPoil  	; stderr   3.49;		
    var u_spread_gap    ; stderr  0.4;  // relevant for stoch. simulation 0.326303
    var eps_cb ;  stderr 5.03; //20 
end; 

//stoch_simul(order=1, periods=10000, irf=0) spread_gap B_gap BY_gap ygap i_b i_BOI cgap_b RRst pie;
	 
///% %% --------- Comparing IR
 
// Close Economy:
//Bzgap    = 0;//0.00001; // cohenim close. before it was:0.05 ;
//Byrow    = 0; // cohenim close. before it was:0.05 ; // According to the export share
//Az        = 0;// cohenim close. before it was: 0.30   ; // Considering the IM share and assuming immediate passthrough
//Gfx       = 0.00;
 
@#define Choose_Sensativity_Type = [1]
@#define Choose_Sensativity_number = [1,2,3] 
 
// MULTI Sensativity
@#for Sensativity_index in Choose_Sensativity_Type
    disp('Sensativity_index');
    @{Sensativity_index}
    // vector to loop on - set to baseline      
        Vec_p_spr_lev   = [0.031, 0.031, 0.031]; 
        Vec_p_NRI_Spr   = [0.5  , 0.5   , 0.5]  ;
        Vec_p_NRI_PrefShock   = [0.2  , 0.2   , 0.2]  ;		 
        Vec_p_yGap_rGap = [0.1  , 0.1   , 0.1]  ;       
        Vec_p_Brr_b_factor= [5  , 5     , 5]    ;       
        Vec_par_v       =  1 * [0.0225, 0.0225, 0.0225];       
        Vec_par_flag=     [0,0,0];
// ------------------
    @#if Sensativity_index==1
        FileNamePrefix = 'elasticity_Spr_Lev_';     
        //Vec_p_spr_lev     = [0.031, 0.022, 0.058] ; 
        Vec_p_spr_lev   = [0, 0.031, 0.1] ; 
        LegendSTR   = {'Original','MP' } ;   
        LegendSTR = buildLegend('$\beta^{\Delta}_{lev}=','$',Vec_p_spr_lev)   
        FileNameValue = Vec_p_spr_lev ;
    @#endif //Sensativity_index==1
    @#if Sensativity_index==2
        FileNamePrefix = 'elasticity_NRI_Spr_';
        Vec_p_NRI_Spr   = [0.5, 1.5, 0.1] ; 
        LegendSTR = buildLegend('$\alpha^{NRI}_{\Delta}=','$',Vec_p_NRI_Spr)    
        FileNameValue = Vec_p_NRI_Spr ;
    @#endif //Sensativity_index==2
    @#if Sensativity_index==3
        FileNamePrefix = 'elasticity_yGap_rGap_';
        Vec_p_yGap_rGap     = [0.1, 0.02, 0.82] ; 
        LegendSTR = buildLegend('$\beta^{y}_{r}=','$',Vec_p_yGap_rGap)  
        FileNameValue = Vec_p_yGap_rGap ;
    @#endif //Sensativity_index==3
    @#if Sensativity_index==4
        FileNamePrefix = 'Brr_b_factor_';
        Vec_p_Brr_b_factor  = [5, 1.1, 10] ; 
        LegendSTR = buildLegend('$\sigma^{b} / \sigma =','$',Vec_p_Brr_b_factor)    
        FileNameValue = Vec_p_Brr_b_factor ;
    @#endif //Sensativity_index==4
    @#if Sensativity_index==5
        FileNamePrefix = 'FinFric_w_wo_';
        Vec_p_spr_lev   = [0.031    ,   0   ] ;             
        LegendSTR   = {'Endo. Spread','Exo. Spread' } ;   
        FileNameValue = Vec_p_spr_lev ;
    @#endif //Sensativity_index==5
 
    @#if Sensativity_index==6
        FileNamePrefix = 'FinFric_Smart_Stupid_';
        Vec_par_flag=[0,1];
        LegendSTR   = {'R-Correct','R-Wrong'} ;   
        FileNameValue = Vec_par_flag;
    @#endif //Sensativity_index==6
	
	@#if Sensativity_index==7
        FileNamePrefix = 'elasticity_NRI_Pref_Shock_';
        Vec_p_NRI_PrefShock   = [0.5*0.4, 0.5*0.3 , 0.05] ; 
        LegendSTR = buildLegend('$\alpha^{NRI}_{u}=','$',Vec_p_NRI_PrefShock)    
        FileNameValue = Vec_p_NRI_PrefShock ;    
	@#endif //Sensativity_index==7
       
    loss_Version1=[];
    loss_Version2=[];
    loss_Version3=[];
    loss_Version4=[];
    //Vec_flag_NewModel = [ 0 , 0 , 1]  
// LOOP
// ----
    @#for loop_index in Choose_Sensativity_number
        disp(['Simulation number: ',num2str(@{loop_index})]);
 
// parameter to change insid the  loop:     
        p_spr_lev       =  Vec_p_spr_lev(@{loop_index}) ;               
        alfa4           =  Vec_p_NRI_Spr(@{loop_index})     ;       
        alfa5           =  Vec_p_NRI_PrefShock(@{loop_index})     ;       
        Brr             =  Vec_p_yGap_rGap(@{loop_index})       ;       
        Brr_b_factor    =  Vec_p_Brr_b_factor(@{loop_index})        ;       
        par_v           =  Vec_par_v(@{loop_index})         ;
        par_flag        =  Vec_par_flag(@{loop_index});
        
        //importent to update:
        alfa1=rrBAR-alfa2*4*gBAR-alfa3*4*gBAR_row+alfa4*spread_gap_SS ;//Restriction should be imposed on alfa1 
        disp([p_spr_lev, par_v, alfa4, alfa5]);
        steady;
        check;  

    
        stoch_simul(order=1, periods=0, irf=20, nocorr, nofunctions, nograph)
 
//                 B_gap  
					ygap  i_BOI   pie // di_BOI dygap //open 'di_BOI' and 'dygap' only in calculating loss function but not in IRFs. Put periods=10,000 in calculating loss function
                    BY_gap  spread_gap  RRst 
                    cgap_b  z	i_b;
                    //RRgap B_gap
                    //Credit_gap 
                    //leverage_def  zgap    dfx  FXI;  
                    // z     RR_eff_gap;        
            loss_Version1=[loss_Version1, oo_.var(4,4)+0.5*oo_.var(2,2)+6*oo_.var(5,5)]; //var(dp)+alfa*var(ygap)+beta*var(di_cb)
            loss_Version2=[loss_Version2, oo_.var(4,4)+0.5*oo_.var(6,6)+6*oo_.var(5,5)];//var(dp)+alfa*var(dygap)+beta*var(di_cb)
            loss_Version3=[loss_Version3, oo_.var(4,4)+0.5*oo_.var(2,2)];                 //var(dp)+alfa*var(ygap)
            loss_Version4=[loss_Version4, oo_.var(4,4)+0.5*oo_.var(6,6)];                 //var(dp)+alfa*var(dygap)

 
        MultiOO{@{loop_index}}=oo_; 
        // save IRFs to excel       
        filename = ['IRFs_',FileNamePrefix,num2str(FileNameValue(@{loop_index})),'.xlsx']
        //irfs2xls(filename, M_, oo_ );
    @#endfor     // loop_index 
    addpath('Lib_MultiSim') ;
    Formats = {'png'};
    %v_colors   = [ 'g','r','b','c', 'm','y','k' ];         
    v_colors    = [];           
    v_style     = { ':','--','-','--',':'}; 
    v_width     = [ 1.6, 1.8, 2, 1.6];
    LegendAT    =  [6,1,3,0,0,8,9,9,9,9,9];  
    MultiIRFs( M_, MultiOO, var_list_, options_, LegendAT, LegendSTR ,v_colors ,v_style , v_width, Formats,FileNamePrefix);
@#endfor //Sensativity_index

