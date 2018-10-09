function [] = plotASLSim(T,Q,params,apexPred)
   
    d = params.d;
    a = figure(1);
    box = 1.6;
    axis([Q(1,1)-box/2,Q(1,1)+box/2,0,box]);
    swIndex=inf;

    for k=1:1:length(T)
%        plot(Q(k,1),Q(k,2),'go','MarkerSize',20)
       
       Rect2( Q(k,1)-d , Q(k,2) , Q(k,1)+d , Q(k,2) , 0.01, 0.05);
       hold on;
       if(k>2)
        if(Q(k,9)==1 && Q(k-1,9)==0)
            swIndex = k;
        end
       end
       if(k<swIndex)
          plot(Q(1:k,1),Q(1:k,2),'r');
       else
          plot(Q(1:swIndex,1),Q(1:swIndex,2),'r');
          plot(Q(swIndex:k,1),Q(swIndex:k,2),'b');
       end
       
       axis([Q(1,1)-box/2,Q(1,1)+box/2,0,box]);
       line([Q(k,1) - d ,Q(k,1) - d - Q(k,4)*sin(Q(k,3))],[Q(k,2),Q(k,2)-Q(k,4)*cos(Q(k,3))],'LineWidth',4,'Color','k');
       line([Q(k,1) + d ,Q(k,1) + d - Q(k,4)*sin(Q(k,3))],[Q(k,2),Q(k,2)-Q(k,4)*cos(Q(k,3))],'LineWidth',4,'Color','k');
       axis([Q(k,1)-box/2,Q(k,1)+box/2,0,box]);
       plot(apexPred(1),apexPred(2),'go','MarkerSize',10);
       plot(Q(k,1),Q(k,2),'rx');
       hold off;
       %     line([Q(k,1),Q(k,1)-Q(k,4)*sin(Q(k,3))],[Q(k,2),Q(k,2)-Q(k,4)*cos(Q(k,3))]);
       if(mod(k,4)==0)
        drawnow
       end
       

    end
    
end