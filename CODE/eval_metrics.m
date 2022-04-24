function [] = eval_metrics(imgs)
%n_imgs = size(imgs)(1);

etrpy = mean(entropy(imgs(:,:,1)) + entropy(imgs(:,:,2)) + entropy(imgs(:,:,3)));

niqe_score = niqe(imgs);    

disp(etrpy);

disp(niqe_score);