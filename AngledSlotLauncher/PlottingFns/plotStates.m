function [] = plotStates(T,Y)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    %State figures
    figure(2);
    set(gcf,'numbertitle','off','name','States')
    subplot(321), plot(T,Y(:,4));
    grid on;
    xlabel('$$ t (s) $$','interpreter','latex','fontsize',15)
    ylabel('$$ r (m) $$','interpreter','latex','fontsize',15)
    subplot(322), plot(T,Y(:,8));
    grid on;
    xlabel('$$ t (s) $$','interpreter','latex','fontsize',15)
    ylabel('$$ r (m/s) $$','interpreter','latex','fontsize',15)
    subplot(323), plot(T, Y(:,3));
    grid on;
    xlabel('$$ t (s) $$','interpreter','latex','fontsize',15)
    ylabel('$$ \theta (rad) $$','interpreter','latex','fontsize',15)
    subplot(324), plot(T,Y(:,7));
    grid on;
    xlabel('$$ t (s) $$','interpreter','latex','fontsize',15)
    ylabel('$$ \dot{\theta} (rad/s) $$','interpreter','latex','fontsize',15)
%     subplot(325), plot(T,Y(:,3));
%     grid on;
%     xlabel('$$ t (s) $$','interpreter','latex','fontsize',15)
%     ylabel('$$ \phi (deg) $$','interpreter','latex','fontsize',15)
%     hold on;
    %subplot(325), plot(T,Y(:,7)*180/pi-phi_eq*180/3.14,'r');
%     subplot(326), plot(T,Y(:,6));
%     grid on;
%     xlabel('$$ t (s) $$','interpreter','latex','fontsize',15)
%     ylabel('$$ \dot{\phi} (rad/s) $$','interpreter','latex','fontsize',15)
%     hold on;
   
    hold off;

end

