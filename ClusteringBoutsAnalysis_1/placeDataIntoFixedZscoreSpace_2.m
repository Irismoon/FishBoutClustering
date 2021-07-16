%%
%%%%%%%%%%%%%% what this function does %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%puts new data points in previously calcualted Beahvioral space

function [newScore] = placeDataIntoFixedZscoreSpace_2(inputData,indKinPars,maxKinPars,meanAllVar,stdAllVar)
%%
%   inputData = thisLine;

%%
%%%%%%%%%%%%%%%%%%%%%% choose kin pars %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% indThisStim = 1:size(inputData,1);
% inputDataThisKins =  inputData(indThisStim,indKinPars);
  inputDataThisKins =  inputData(:,indKinPars);

%%
%%%%%%%%%% reconstruct log abs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


kinData = abs(inputDataThisKins);

for i = 1 : size(kinData,2)
    
    
    kinData(:,i) = kinData(:,i) + maxKinPars(i);
    
end

%do log
    

kinData = log(kinData);

%%
%%%%%%%%%%%%%%% reconstruct z-score %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


zScoreThisData = zeros(size(kinData,1),size(kinData,2));

for ii = 1 : size(kinData,2)
 
     kinDataThis = kinData(:,ii);
     
     
     
     
    zScoreThisData(:,ii) = (kinDataThis  -  meanAllVar(ii))/(stdAllVar(ii));
    
    

end

%erase nans
zScoreThisData(isnan(zScoreThisData)) = 0;  


%%
%%%%%%%%%%%%%% reconstruct PCA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
newScore = zScoreThisData;
%  newScore = (bsxfun(@minus,zScoreThisData,meanPCASpace));
