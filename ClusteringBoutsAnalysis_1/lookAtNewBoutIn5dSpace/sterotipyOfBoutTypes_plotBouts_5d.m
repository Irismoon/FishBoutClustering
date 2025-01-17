
% clear all 
% close all

%%
%%%%%%%%%%%%%%% load bout map with raw data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  load('C:\Joao analysis\FreeData\clusteringData\final\BoutCat_kNN4_74Kins3dims_1.75Smooth_slow_3000_auto_final.mat','finalClustering')

%%
%%%%%%%%%%%%%%%%% import bout map with raw data %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

boutCat = BoutInfFinalArray(:, EnumeratorBoutInf.boutCat);


uniqueBoutCat = unique(boutCatFinalArray);
% boutName = {'Approach swim','Slow 1','Slow 2','Burst swim','J turn','HAT','Routine turn','Routine turn2','SAR',...
%     'O bend','LLC','C start'};

boutName = {'Slow 2','Routine turn','Burst swim','Approach swim','Slow 1','Routine turn2','SAR','LLC','C start','HAT','O bend','J turn'};



% idx = [3 7 4 1 2 12 8 10 11 6 9 5];
%  idx2 = [1,2,3,4,5,6,7,12,8,9, 10,11];
% 
idx = [4 5 1 3 12 10 2 6 7 11 8 9];
 figure
 


 for n  = 1 : length(uniqueBoutCat)
%   n =1  
    
     indThisBoutType = find(boutCatFinalArray == uniqueBoutCat((idx(n))));
    
%         indThisBoutType = find(boutCatFinalArray == uniqueBoutCat((n)));

    
% end

 subplot(2,6,n)
% figure

%%
%%%%%%%%%%%%%%%%%%%%% plot center bouts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
col2 = jet(8);
segmentNumber = 7;
% boutName = {'Approach swim','Slow 1','Slow 2','Burst swim','J turn','HAT','Routine turn','SAR',...
%     'O bend','LLE','C start','Routine turn2'};

% figure
for i = 1 :10: 500%length(indThisBoutType)
     cumsumInterpFixedSegmentAngles = FishDataMap(indBoutStartAllDataInFinalArray(indThisBoutType(i)):indBoutEndAllDataInFinalArray(indThisBoutType(i)),EnumeratorFishData.cumsumInterpFixedSegmentAngles)*180/pi;
     beat1beatAmplitude8 = BoutKinematicParametersFinalArray(indThisBoutType(i),EnumeratorBoutKinPar.beat1beatAmplitude8);

     
    timeX = (1 : length(cumsumInterpFixedSegmentAngles)).*(1000/700);
    
%     subplot(3,4,i+1)
%     figure
    if beat1beatAmplitude8 > 0
    
%     for nnn = 1 : 7
    plot(timeX,cumsumInterpFixedSegmentAngles(:,segmentNumber),'color','k','linewidth',1)
    hold on
%     end
    
    else
%     for nnn = 1 : 7
    plot(timeX,cumsumInterpFixedSegmentAngles(:,segmentNumber)*-1,'color','k','linewidth',1)
    hold on
%     end
    end
    
    box off
    axis([0 220 -130 250])
    axis square
    xlabel('Time (ms)')
    
    ylabel('End tail angle (�)')

%     axis off
   
%     
end
  title(boutName{(idx(n))})
 end
 
 