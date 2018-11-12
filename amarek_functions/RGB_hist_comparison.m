% x = linspace(0,pi);
% y1 = cos(x);
% plot(x,y1,'DisplayName','cos(x)')
% 
% hold on 
% y2 = cos(2*x);
% plot(x,y2,'DisplayName','cos(2x)')
% hold off
% 
% legend

subplot(1,3,1);
x=1:1:256;
yRnat=rHist2Nat;
plot(x,yRnat,'DisplayName','Natural')
hold on
yRman=rHist2Man;
plot(x,yRman,'DisplayName','Manmade')
ylim([0*10^4, 4*10^4])
xlim([0, 260])
title('Red Channel')
hold off
legend
grid on

subplot(1,3,2)
x=1:1:256;
yGnat=gHist2Nat;
plot(x,yGnat,'DisplayName','Natural')
hold on
yGman=gHist2Man;
plot(x,yGman,'DisplayName','Manmade')
ylim([0*10^4, 4*10^4])
xlim([0, 260])
title('Green Channel')
hold off
legend
grid on

subplot(1,3,3)
x=1:1:256;
yBnat=bHist2Nat;
plot(x,yBnat,'DisplayName','Natural')
hold on
yBman=bHist2Man;
plot(x,yBman,'DisplayName','Manmade')
ylim([0*10^4, 4*10^4])
xlim([0, 260])
title('Blue Channel')
hold off
legend
grid on