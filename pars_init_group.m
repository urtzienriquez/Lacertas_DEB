function [par, metaPar, txtPar] = pars_init_group(metaData)

metaPar.model = {'std','std','std'};
metaPar.cov_rules = '';
metaPar.weights.v = 1; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = [3.6397 1.881 2.537];       free.z     = [1 1 1];   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = [0.066463 0.02887 0.02265];     free.v     = [1 1 1];   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = [0.72942 0.793 0.5686];    free.kap   = [1 1 1];   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = [12.4008 65.73 27.96];    free.p_M   = [1 1 1];   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = [7827.9907 7832 7829];  free.E_G   = [1 1 1];   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = [1.476e+03 390.8 2383]; free.E_Hb  = [1 1 1];   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = [4.046e+04 18970 31380]; free.E_Hp  = [1 1 1];   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = [2.626e-10 7.819e-09 1.339e-08];  free.h_a   = [1 1 1];   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hpm = 3.329e+04; free.E_Hpm = 1;   units.E_Hpm = 'J';        label.E_Hpm = 'maturity at puberty for males'; 
par.E_Hx = 1.476e+03; free.E_Hx  = 0;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledge/weaning'; 
par.del_M = [0.28305 0.1765 0.2062];  free.del_M = [1 1 1];   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_LN = 1;         free.f_LN  = 0;   units.f_LN = '-';         label.f_LN = 'scaled functional response for LN data'; 
par.f_fem = 1;        free.f_fem = 0;   units.f_fem = '-';        label.f_fem = 'scaled functional response for females tL'; 
par.f_ma = 1;         free.f_ma  = 0;   units.f_ma = '-';         label.f_ma = 'scaled functional response for males tL'; 
par.f_sa = 1;         free.f_sa  = 0;   units.f_sa = '-';         label.f_sa = 'scaled functional response for subadults tL'; 
par.f_w = 1;          free.f_w   = 0;   units.f_w = '-';          label.f_w = 'scaled functional response for LWw'; 
par.f_Kh = 0.9512;    free.f_Kh  = 0;   units.f_Kh = '-';         label.f_Kh = 'scaled functional response at Khuchni'; 
par.f_Ko = 0.9061;    free.f_Ko  = 0;   units.f_Ko = '-';         label.f_Ko = 'scaled functional response at Kostek'; 
par.f_Ku = 1;         free.f_Ku  = 0;   units.f_Ku = '-';         label.f_Ku = 'scaled functional response at Kuli'; 
par.f_Se = 0.857;     free.f_Se  = 0;   units.f_Se = '-';         label.f_Se = 'scaled functional response at Sergokala'; 
par.f_Te = 0.9146;    free.f_Te  = 0;   units.f_Te = '-';         label.f_Te = 'scaled functional response at Termenlik'; 
par.f_Khs = 0.9507;    free.f_Khs  = 0;   units.f_Khs = '-';         label.f_Khs = 'scaled functional response at Khuchni for L. strigata'; 
par.f_Kos = 1;         free.f_Kos  = 0;   units.f_Kos = '-';         label.f_Kos = 'scaled functional response at Kostek for L. strigata'; 
par.f_Ses = 1.018;     free.f_Ses  = 0;   units.f_Ses = '-';         label.f_Ses = 'scaled functional response at Sergokala for L. strigata'; 
par.t_0 = 0;          free.t_0   = 0;   units.t_0 = 'd';          label.t_0 = 'time at start of development'; 
par.t_N = 365;        free.t_N   = 0;   units.t_N = 'd';          label.t_N = 'period between broods'; 
par.z_m = [3.3181 1.961 2.649];     free.z_m   = [1 1 1];   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[phylum, class] = metaData2taxo(metaData);
[par, units, label, free] = addchem(par, units, label, free, phylum, class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
