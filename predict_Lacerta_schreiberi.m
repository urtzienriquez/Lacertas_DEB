function [prdData, info] = predict_Lacerta_schreiberi(par, data, auxData)
% file generated by prt_predict

% unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

% compute temperature correction factors
pars_T = T_A;
TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, pars_T);
TC_am = tempcorr(temp.am, T_ref, pars_T);
TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
TC_tp = tempcorr(temp.tp, T_ref, pars_T);
TC_tpm = tempcorr(temp.tpm, T_ref, pars_T);
TC_LN = tempcorr(temp.LN, T_ref, pars_T);

% Zero-variate data

% life cycle
pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
[tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths

if info == 0
  prdData = []; return;
end

% initial
pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
Ww_0 = U_E0 * p_Am * w_E/ mu_E/ d_V; % g, initial wet weight

% birth
L_b = L_m * l_b;                  % cm, structural length at birth
a_b = t_0 + tau_b/ k_M;           % d, age at birth
Lw_b = L_b/ del_M;                % cm, physical length at birth
Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth

% puberty
L_p = L_m * l_p; % cm, structural length at puberty
Lw_p = L_p/ del_M; % cm, physical length at puberty
options = odeset('Events',@puberty); % set event handler to compute tT_p
r_B = k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
[t, L] = ode45(@get_L, [0; 1e8], L_b, options, T_ref, T_A, T_m, T_a, t_TL, r_B, f * L_m, L_p); % d, cm
tT_p = t(end); % d, time since birth at puberty

% ultimate
l_i = f - l_T; % -, scaled ultimate length
L_i = L_m * l_i; % cm, ultimate structural length
Lw_i = f * L_m/ del_M; % cm, ultimate physical length
Ww_i = L_i^3 * (1 + f * ome); % g, ultimate wet weight 
pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector
tau_m = get_tm_s(pars_tm, f, l_b); % -, scaled mean life span
a_m = tau_m/ k_M/ TC_am; % d, mean life span

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
R_i = TC_Ri * reprod_rate(L_i, f, pars_R); % #/d, ultimate reproduction rate

% males
p_Am_m = z_m * p_M/ kap; % J/d.cm^2, {p_Am} spec assimilation flux
E_m_m = p_Am_m/ v; % J/cm^3, reserve capacity [E_m]
g_m = E_G/ (kap* E_m_m); % -, energy investment ratio
m_Em_m = y_E_V * E_m_m/ E_G; % mol/mol, reserve capacity
ome_m = m_Em_m * w_E/ w_V; % -, contribution of reserve to weight
L_mm = v/ k_M/ g_m; L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, max ultimate length
pars_tpm = [g_m k l_T v_Hb v_Hpm]; % pars for males
[tau_pm, tau_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % - , scaled time, length
L_bm = L_mm * l_bm; L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M;  % cm, lengths
r_Bm = k_M/ 3/ (1 + f/ g_m); % 1/d, von Bert growth rate
[t, L] = ode45(@get_L, [0; 1e8], L_bm, options, T_ref, T_A, T_m, T_a, t_TL, r_Bm, L_mm, L_pm); % d, cm
tT_pm = t(end);
Ww_im = L_im^3 * (1 + f * ome_m); % g, ultimate wet weight

% pack to output
prdData.ab = a_b;
prdData.tp = tT_p;
prdData.tpm = tT_pm;
prdData.am = a_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Lpm = Lw_pm;
prdData.Li = Lw_i;
prdData.Lim = Lw_im;
prdData.Ww0 = Ww_0;
prdData.Wwb = Ww_b;
prdData.Ri = R_i;
prdData.Wwi = Ww_i;
prdData.Wwim = Ww_im;

%%%%%%%%%%%%%%%%%%
% Univariate data

% length - yearly fecundity
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
LN = TC_LN * 365 * reprod_rate(LN(:,1) * del_M, f_LN, pars_R); % #, yearly fecundity

% age at birth at different temperatures
Eab = a_b ./ TC_Tab; 
  
% time-SVL; subadults
r_B = k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
[t, L] = ode45(@get_L, [0; tL_j(:,1)], L_b, [], T_ref, T_A, T_m, T_a, t_TL, r_B, L_i, L_p); % d, cm
L(1) = []; ELw_j = L/ del_M;  % cm, SVL
% time-SVL; females
[t, L] = ode45(@get_L, [0; tL_f(:,1)], L_b, [], T_ref, T_A, T_m, T_a, t_TL, r_B, L_i, L_p); % d, cm
L(1) = []; ELw_f = L/ del_M;  % cm, SVL
% 
% time-SVL; males
L_bm = L_mm * get_lb([g_m k v_Hb], f_tL); L_im = f_tL * L_mm;
r_Bm = k_M/ 3/ (1 + f_tL/ g_m); % 1/d, von Bert growth rate
[t, L] = ode45(@get_L, [0; tL_m(:,1)], L_bm, [], T_ref, T_A, T_m, T_a, t_TL, r_Bm, L_im, L_pm); % d, cm
L(1) = []; ELw_m = L/ del_M;  % cm, SVL

% SVL-weet wight: L-Ww
EWw = (LWw(:,1) * del_M).^3 * (1 + f_LW * w); % g, wet mass

% time - temperature
ET =  T_m + T_a * sin(2 * pi * (tT(:,1) - t_T)/365);

% pack to output
prdData.LN = LN;
prdData.Tab = Eab;
prdData.tL_j= ELw_j;
prdData.tL_f = ELw_f;
prdData.tL_m = ELw_m;
prdData.LWw = EWw;
prdData.tT = ET;
    
end
   
function dL = get_L(t, L, T_ref, T_A, T_m, T_a, t_T, r_B, L_i, L_p)
    TC = tempcorr(C2K(T_m + T_a * sin(2 * pi * (t - t_T)/365)), T_ref, T_A);
    dL = TC * r_B * (L_i - L);
end

% event puberty
function [value, isterminal, direction] = puberty(t, L, T_ref, T_A, T_m, T_a, t_TL, r_B, L_i, L_p)
  value = L - L_p;  % trigger 
  isterminal = 1;  % terminate at puberty
  direction = [];          % get all the zeros
end