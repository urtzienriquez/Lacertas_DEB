close all;
global pets

pets = {'Lacerta_schreiberi','Lacerta_agilis','Lacerta_strigata'};
check_my_pet(pets);

estim_options('default');
estim_options('max_step_number', 1e3);
estim_options('max_fun_evals',5e3);

estim_options('pars_init_method', 2);
estim_options('results_output', 4);
estim_options('method', 'no');

estim_pars;

