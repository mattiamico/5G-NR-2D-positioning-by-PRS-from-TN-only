function plotPRSCorr(carrier,corr,sr)
%   plotPRSCorr(CARRIER,CORR,SR) plots PRS-based correlation for each gNB
%   CORR, given the array of carrier-specific configuration objects CARRIER
%   and the sampling rate SR.
    
    numgNBs = numel(corr);
    colors = getColors(numgNBs);
    figure;
    hold on;
    
    % Plot correlation for each gNodeB
    t = (0:length(corr{1}) - 1)/sr; 
    legendstr = cell(1,2*numgNBs);
    for gNBIdx = 1:numgNBs
        plot(t,abs(corr{gNBIdx}), ...
            'Color',colors(gNBIdx,:),'LineWidth',2);

        legendstr{gNBIdx} = sprintf('gNB%d (NCellID = %d)', ...
            gNBIdx,carrier(gNBIdx).NCellID);
    end

    % Plot correlation peaks
    for gNBIdx = 1:numgNBs
        c = abs(corr{gNBIdx});
        j = find(c == max(c),1);
        plot(t(j),c(j),'Marker','o','MarkerSize',5, ...
            'Color',colors(gNBIdx,:),'LineWidth',2)
        legendstr{numgNBs+gNBIdx} = '';
    end
    
    legend(legendstr);
    xlabel('Time [s]')
    ylabel('Absolute value');
    title('PRS Correlation for All gNBs');
end








