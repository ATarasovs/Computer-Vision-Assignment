subplot(2,3,1)
plot(1:1:256,rHist2Nat)
title('R nat')
ylim([1*10^4, 4*10^4])
hold on
subplot(2,3,4)
plot(1:1:256,rHist2Man)
title('R Man')
ylim([1*10^4, 4*10^4])
hold off


subplot(2,3,2)
plot(1:1:256,gHist2Nat)
title('G nat')
ylim([1*10^4, 4*10^4])
hold on
subplot(2,3,6)
plot(1:1:256,bHist2Man)
title('G Man')
ylim([1*10^4, 4*10^4])
hold off

subplot(2,3,3)
plot(1:1:256,bHist2Nat)
title('B nat')
ylim([1*10^4, 4*10^4])
hold on
subplot(2,3,5)
plot(1:1:256,gHist2Man)
title('B Man')
ylim([1*10^4, 4*10^4])
hold off