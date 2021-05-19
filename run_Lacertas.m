close all;
global pets

pets = {'Lacerta_schreiberi'};
check_my_pet(pets);

estim_options('default');
estim_options('max_step_number', 5e2); % I used 5e5 to reach to convergence after five 5e2 runs (reached in step 950)
estim_options('max_fun_evals',5e3);

estim_options('pars_init_method', 2);
estim_options('results_output', 3);
estim_options('method', 'no');

estim_pars;

