function [] = plotHopSim(T,Q)
   
    
    a = figure(1);
    box = .8;
    axis([Q(1,1)-box/2,Q(1,1)+box/2,0,box]);
    for k=1:1:length(T)
       plot(Q(k,1),Q(k,2),'go','MarkerSize',20)
       hold on;
       axis([Q(k,1)-box/2,Q(k,1)+box/2,0,box]);
       line([Q(k,1),Q(k,1)+Q(k,4)*sin(Q(k,3))],[Q(k,2),Q(k,2)-Q(k,4)*cos(Q(k,3))]);
       hold off;
       pause(0.01);
    end
end