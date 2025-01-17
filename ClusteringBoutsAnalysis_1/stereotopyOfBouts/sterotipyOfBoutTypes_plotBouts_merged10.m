
% clear all 
 close all

%%
%%%%%%%%%%%%%%% load bout map with raw data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PathName = 'C:\Joao analysis\FreeData\clusteringData\boutMap\LDA\';


FileName = 'BoutMapWithRawCenters_kNN4_74Kins4dims_1.75Smooth_slow_3000_auto_4roc_merged10_corr.mat';%with strain experiments by 1X CS cluster size



%   load(strcat(PathName,FileName));

%%
%%%%%%%%%%%%%%%%% import bout map with raw data %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
idx = finalClustering.idx;

boutCat = BoutInfFinalArray(:, EnumeratorBoutInf.boutCat);


uniqueBoutCat = unique(boutCatFinalArray);


 for n  = 1 : length(uniqueBoutCat)
%   n =1  
    
    indThisBoutType = find(boutCatFinalArray == uniqueBoutCat(idx(n)));
    
    
    
% end

 subplot(3,5,n)
% figure

%%
%%%%%%%%%%%%%%%%%%%%% plot center bouts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
col2 = jet(7);
segmentNumber = 7;
boutName = {'Approach swim','Slow 1','Slow 2','Slow capture swim','Fast capture swim','Burst swim','J turn','HAT','Routine turn','SAR',...
    'O bend','LLE','C start'};
% figure
for i = 75 :1: 125%length(indThisBoutType)
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
    axis([0 220 -200 250])
    axis square
    xlabel('Time (ms)')
    
    ylabel('End tail angle (�)')

%     axis off
     title(boutName{n})
%     
end
 end
 
 