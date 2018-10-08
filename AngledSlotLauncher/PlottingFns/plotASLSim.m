function [] = plotASLSim(T,Q,params)
   
    d = params.d;
    a = figure(1);
    box = 1.6;
    axis([Q(1,1)-box/2,Q(1,1)+box/2,0,box]);
    for k=1:1:length(T)
%        plot(Q(k,1),Q(k,2),'go','MarkerSize',20)
       
       Rect2( Q(k,1)-d , Q(k,2) , Q(k,1)+d , Q(k,2) , 0.01, 0.05);
       hold on;
       axis([Q(1,1)-box/2,Q(1,1)+box/2,0,box]);
       line([Q(k,1) - d ,Q(k,1) - d - Q(k,4)*sin(Q(k,3))],[Q(k,2),Q(k,2)-Q(k,4)*cos(Q(k,3))],'LineWidth',4,'Color','k');
       line([Q(k,1) + d ,Q(k,1) + d - Q(k,4)*sin(Q(k,3))],[Q(k,2),Q(k,2)-Q(k,4)*cos(Q(k,3))],'LineWidth',4,'Color','k');
       axis([Q(k,1)-box/2,Q(k,1)+box/2,0,box]);
       hold off;
       %     line([Q(k,1),Q(k,1)-Q(k,4)*sin(Q(k,3))],[Q(k,2),Q(k,2)-Q(k,4)*cos(Q(k,3))]);
       
       
       
       
       pause(0.0001);
    end
end