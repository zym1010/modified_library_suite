% run the original code and save them for debug.
import UFLDL.sampleIMAGES2
import UFLDL.sparse_coding

numPatches = 20000; 
patchDim = 8;         % patch dimension        % patch dimension
visibleSize = patchDim * patchDim; 

rng(0,'twister');

images = load('IMAGES.mat');
images = images.IMAGES;
patches = sampleIMAGES2(images, patchDim, numPatches); % changed the code to make it runnable.
patches = patches';

pars = {'numFeatures',121,...
    'topography',false,...
    'poolDim',3,... % 
    'epsilon',1e-5,...
    'lambda',0.1,...
    'gamma',1e-2,...
    'optMethod','cg',...
    'optMaxIter',20,...
    'iterationTotal',200,...
    'batchNumPatches',2000,...
    'initSeed',0,... % if set to [], then shuffle.
    'visualize',true,...
    'initMultiplier',1,...
    'initFunction','rand'}; % the demo used rand to init.



[sparse_coding_result,pars] = sparse_coding(patches,pars);

save('UFLDL_data/sparse_coding_result_no_topo.mat','sparse_coding_result',...
    'pars');

%% try topography version.
pars = {'numFeatures',121,...
    'topography',true,...
    'poolDim',3,... % 
    'epsilon',1e-5,...
    'lambda',0.1,...
    'gamma',1e-2,...
    'optMethod','cg',...
    'optMaxIter',20,...
    'iterationTotal',200,...
    'batchNumPatches',2000,...
    'initSeed',0,... % if set to [], then shuffle.
    'visualize',true,...
    'initMultiplier',1,...
    'initFunction','rand'}; % the demo used rand to init.

[sparse_coding_result,pars] = sparse_coding(patches,pars);

save('UFLDL_data/sparse_coding_result_topo.mat','sparse_coding_result',...
    'pars');
