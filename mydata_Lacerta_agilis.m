function [data, auxData, metaData, txtData, weights] = mydata_Lacerta_agilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Lacerta_agilis'; 
metaData.species_en = 'Sand lizard'; 
metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 07];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'EngeFrit1993';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '7 till 10 weeks';
data.ap = 22.5*30.5;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'RoitSmir2006';
  temp.ap = C2K(22); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 7.5*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'RoitSmir2006';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.1;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'RoitSmir2006';  
data.Li  = 10;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'RoitSmir2006';  

data.Wwi = 12;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'arkive';

data.Ri  = 11/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'EngeFrit1993';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 till 15';

% univariate data
% t-L data
data.tL_fKo = [ ... % time since birth (yr), SVL (cm)
1	4.538
1	4.737
1	5.260
1	5.676
1	5.802
1	5.892
1	5.965
1	6.073
1	6.488
1	4.105
1	4.899
1	5.423
1	6.254
1	5.134
1	5.351
2	7.918
2	8.008
2	8.188
2	7.556
2	8.405
2	7.123
2	7.412
2	6.581
2	6.744
2	7.249
3	8.372
3	8.462
3	8.588
3	7.631
3	8.065
3	8.191
3	9.365
3	7.848
3	8.913
4	8.140];
data.tL_fKo(:,1) = (data.tL_fKo(:,1)-.7) * 365; % convert yr to d
units.tL_fKo  = {'d', 'cm'};  label.tL_fKo = {'time since birth', 'SVL'};  
temp.tL_fKo   = C2K(24);  units.temp.tL_fKo = 'K'; label.temp.tL_fKo = 'temperature';
bibkey.tL_fKo = 'RoitSmir2006';
comment.tL_fKo = 'Data for females in Kostek, 50 m';
%
data.tL_mKo = [ ... % time since birth (yr), SVL (cm)
1	4.519
1	6.036
1	6.108
1	6.162
1	6.379
1	4.664
1	4.916
1	5.169
1	5.386
1	5.603
1	5.657
2	6.815
2	9.361
2	9.506
2	8.422
2	8.513
2	8.567
2	8.711
2	8.134
2	8.206
2	8.892
2	8.964
2	9.127
3	9.093
3	9.202
3	9.328
3	8.660
3	9.653
3	9.798
3	9.906
4	9.511
4	9.728
4	9.854
4	9.890
4	9.981
4	10.342
5	9.893
5	10.164
5	10.471
6	10.600];
data.tL_mKo(:,1) = (data.tL_mKo(:,1)-.7) * 365; % convert yr to d
units.tL_mKo  = {'d', 'cm'};  label.tL_mKo = {'time since birth', 'SVL'};  
temp.tL_mKo   = C2K(24);  units.temp.tL_mKo = 'K'; label.temp.tL_mKo = 'temperature';
bibkey.tL_mKo = 'RoitSmir2006';
comment.tL_mKo = 'Data for males in Kostek, 50 m';
%
data.tL_fSe = [ ... % time since birth (yr), SVL (cm)
1	4.402
1	4.169
1	3.935
1	4.636
1	4.061
2	7.638
2	7.476
2	7.404
2	7.333
2	7.926
2	7.854
2	7.782
2	6.811
3	7.261
3	8.088];
data.tL_fSe(:,1) = (data.tL_fSe(:,1)-.7) * 365; % convert yr to d
units.tL_fSe  = {'d', 'cm'};  label.tL_fSe = {'time since birth', 'SVL'};  
temp.tL_fSe   = C2K(22);  units.temp.tL_fSe = 'K'; label.temp.tL_fSe = 'temperature';
bibkey.tL_fSe = 'RoitSmir2006';
comment.tL_fSe = 'Data for females in Sergokala, 600 m';
%
data.tL_mSe = [ ... % time since birth (yr), SVL (cm)
1	4.420
1	4.870
2	7.045
2	7.009
2	6.793
2	6.613
2	6.146
2	7.207
2	7.944
2	7.764
2	7.638
2	7.530
2	7.458
2	8.285
3	8.861
3	8.699
3	8.591
3	8.483
3	8.357
3	8.070
3	7.225
4	9.148
4	8.375
5	9.544
5	8.771
6	9.598
6	8.915];
data.tL_mSe(:,1) = (data.tL_mSe(:,1)-.7) * 365; % convert yr to d
units.tL_mSe  = {'d', 'cm'};  label.tL_mSe = {'time since birth', 'SVL'};  
temp.tL_mSe   = C2K(22);  units.temp.tL_mSe = 'K'; label.temp.tL_mSe = 'temperature';
bibkey.tL_mSe = 'RoitSmir2006';
comment.tL_mSe = 'Data for males in Sergokala, 600 m';
%
data.tL_fKh = [ ... % time since birth (yr), SVL (cm)
1	4.207
1	4.657
1	4.747
1	4.837
1	4.945
1	5.088
1	4.297
2	7.788
2	8.399
2	8.525
2	8.614
2	8.758
2	7.913
2	7.967
2	8.039
2	8.129
3	8.635
3	8.186
3	9.480
4	9.644];
data.tL_fKh(:,1) = (data.tL_fKh(:,1)-.7) * 365; % convert yr to d
units.tL_fKh  = {'d', 'cm'};  label.tL_fKh = {'time since birth', 'SVL'};  
temp.tL_fKh   = C2K(22);  units.temp.tL_fKh = 'K'; label.temp.tL_fKh = 'temperature';
bibkey.tL_fKh = 'RoitSmir2006';
comment.tL_fKh = 'Data for females in Khuchni, 600 m';
%
data.tL_mKh = [ ... % time since birth (yr), SVL (cm)
1	5.177
1	5.034
1	4.944
1	4.153
1	4.297
1	4.440
1	4.656
1	4.800
1	4.890
2	7.535
2	7.625
2	7.733
2	7.823
2	8.488
2	8.596
2	8.686
2	8.236
2	8.740
2	7.176
2	7.391
2	7.967
2	8.038
2	8.146
3	7.628
3	9.048
3	9.156
3	9.371
4	9.913
5	10.167];
data.tL_mKh(:,1) = (data.tL_mKh(:,1)-.7) * 365; % convert yr to d
units.tL_mKh  = {'d', 'cm'};  label.tL_mKh = {'time since birth', 'SVL'};  
temp.tL_mKh   = C2K(22);  units.temp.tL_mKh = 'K'; label.temp.tL_mKh = 'temperature';
bibkey.tL_mKh = 'RoitSmir2006';
comment.tL_mKh = 'Data for males in Khuchni, 600 m';
%
data.tL_fTe = [ ... % time since birth (yr), SVL (cm)
1	3.698
1	3.754
1	4.201
1	3.419
1	3.461
1	3.558
1	3.908
1	4.368
1	3.642
2	7.021
2	7.161
2	7.328
2	7.468
2	8.403
2	6.630
2	6.742
2	6.853
2	6.951
2	8.752
2	8.096
3	7.901
3	8.473
3	9.059
3	9.199
3	7.244
3	7.426
3	7.510
3	8.012
3	8.096
3	8.236
3	8.347
3	8.794
4	8.529
4	9.450
4	7.859
4	8.347
4	8.668
4	7.733
4	8.976
4	9.129
4	9.283
5	7.956
5	9.269
5	8.654
5	8.752
5	8.920
5	8.138
5	9.422
5	9.702
6	8.250
6	8.417
6	8.878
6	9.506
6	9.785
6	9.366];
data.tL_fTe(:,1) = (data.tL_fTe(:,1)-.7) * 365; % convert yr to d
units.tL_fTe  = {'d', 'cm'};  label.tL_fTe = {'time since birth', 'SVL'};  
temp.tL_fTe   = C2K(18);  units.temp.tL_fTe = 'K'; label.temp.tL_fTe = 'temperature';
bibkey.tL_fTe = 'RoitSmir2006';
comment.tL_fTe = 'Data for females in Termenlik, 960 m';
%
data.tL_mTe = [ ... % time since birth (yr), SVL (cm)
1	3.349
1	3.475
1	3.572
1	3.712
1	3.949
1	4.061
2	7.426
2	7.300
2	7.998
2	8.124
2	6.099
2	6.588
2	6.686
2	6.965
2	7.175
2	7.621
2	7.803
2	7.873
3	8.529
3	8.878
3	8.654
3	8.794
3	8.124
3	9.087
4	9.101
4	9.199
4	9.269
4	8.808
4	9.562
5	9.003
5	9.576
5	9.255
5	9.394
6	9.227
6	9.422
6	9.813
7	9.464
7	9.632
7	9.869];
data.tL_mTe(:,1) = (data.tL_mTe(:,1)-.7) * 365; % convert yr to d
units.tL_mTe  = {'d', 'cm'};  label.tL_mTe = {'time since birth', 'SVL'};  
temp.tL_mTe   = C2K(18);  units.temp.tL_mTe = 'K'; label.temp.tL_mTe = 'temperature';
bibkey.tL_mTe = 'RoitSmir2006';
comment.tL_mTe = 'Data for males in Termenlik, 960 m';
%
data.tL_fKu = [ ... % time since birth (yr), SVL (cm)
1	3.971
1	4.234
2	7.617
2	7.395
2	7.783
2	7.853
2	8.005
2	6.785
2	7.007
2	7.187
3	8.366
3	8.504
3	8.643
3	8.823
3	8.934
4	9.336
4	8.823
4	9.073
4	9.211
5	9.572
5	9.322
6	9.766];
data.tL_fKu(:,1) = (data.tL_fKu(:,1)-.7) * 365; % convert yr to d
units.tL_fKu  = {'d', 'cm'};  label.tL_fKu = {'time since birth', 'SVL'};  
temp.tL_fKu   = C2K(16);  units.temp.tL_fKu = 'K'; label.temp.tL_fKu = 'temperature';
bibkey.tL_fKu = 'RoitSmir2006';
comment.tL_fKu = 'Data for females in Kuli, 1900 m';
%
data.tL_mKu = [ ... % time since birth (yr), SVL (cm)
1	4.303
2	6.882
2	6.965
2	7.354
2	7.562
2	6.605
2	6.716
2	7.118
2	7.229
2	5.953
3	8.685
3	9.114
3	8.546
3	7.853
3	8.116
3	8.296
4	9.766
4	8.560
4	9.059
4	9.211
5	9.419
5	9.503
6	9.614];
data.tL_mKu(:,1) = (data.tL_mKu(:,1)-.7) * 365; % convert yr to d
units.tL_mKu  = {'d', 'cm'};  label.tL_mKu = {'time since birth', 'SVL'};  
temp.tL_mKu   = C2K(16);  units.temp.tL_mKu = 'K'; label.temp.tL_mKu = 'temperature';
bibkey.tL_mKu = 'RoitSmir2006';
comment.tL_mKu = 'Data for males in Kuli, 1900 m';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 50 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fKo','tL_mKo'}; comment1 = {'Data for females, males at Kostek, 50 m'};
set2 = {'tL_fSe','tL_mSe'}; comment2 = {'Data for females, males at Sergokala, 600 m'};
set3 = {'tL_fKh','tL_mKh'}; comment3 = {'Data for females, males at Khuchni, 600 m'};
set4 = {'tL_fTe','tL_mTe'}; comment4 = {'Data for females, males at Termenlik, 960 m'};
set5 = {'tL_fKu','tL_mKu'}; comment5 = {'Data for females, males at Kuli, 1900 m'};
metaData.grp.sets = {set1,set2,set3,set4,set5};
metaData.grp.comment = {comment1,comment2,comment3,comment4,comment5};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7e1a059719ca73323daa52f23a19a64d'; % Cat of Life
metaData.links.id_EoL = '791768'; % Ency of Life
metaData.links.id_Wiki = 'Lacerta_agilis'; % Wikipedia
metaData.links.id_ADW = 'Lacerta_agilis'; % ADW
metaData.links.id_Taxo = '642580'; % Taxonomicon
metaData.links.id_ReptileDB = 'genus=Lacerta&species=agilis'; % ReptileDB

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lacerta_agilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RoitSmir2006'; type = 'Article'; bib = [ ... 
'author = {E. S. Roitberg and E. M. Smirina}, ' ... 
'year = {2006}, ' ...
'title = {AGE, BODY SIZE AND GROWTH OF \emph{Lacerta agilis boemica} AND \emph{L. strigata}: A COMPARATIVE STUDY OF TWO CLOSELY RELATED LIZARD SPECIES BASED ON SKELETOCHRONOLOGY}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {16}, ' ...
'pages = {133-–148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EngeFrit1993'; type = 'Book'; bib = [ ... 
 'title = {Lurche und Kriechtiere Europas}, ' ...
 'publisher = {Neumann Verlag}, ' ...
 'year = {1993}, ' ...
 'author = {Engelmann, W.-E. and Fritzsche, J. and G\"{u}nther, R. and Obst, F. J.}, ' ...
 'address = {Radebeul}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/sand-lizard/lacerta-agilis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

