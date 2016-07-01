function [a,b] = mygammafit(x,s)
% Yunus
  m = mean(x);
  s = log(m) - mean(log(x));
a = 0.5/s;
% slow version
% if 0
%   for iter = 1:1000
%     old_a = a
%     a = inv_digamma(log(a) - s);
%     if(abs(a - old_a) < 1e-100) break, end
%   end
% end
count = 0;
% % gen Newton
% figure(1),clf
% m = gamfit(x);

for iter = 1:1000
  count = count + 1;
  old_a = a;
  g = log(a)-s-digamma(a);
  h = 1/a - trigamma(a);
  a = 1/(1/a + g/(a^2*h));
%   scatter(count, a, 'r')
%   hold on
  if(abs(a - old_a) < 1e-8) break, end
end  
% hline = refline([0 m(1)]);
% set(hline,'LineStyle','-', 'Color', 'b')
% xlabel('Iteration Number (count)')
% ylabel('Estimated Parameter (a)')
% axis_pct;
% %legend('estimation', 'value of myGamfit', 'Location', 'northoutside')
% hold off
% %set(gcf,'paperpos',[0.25 2.5 5 4])

% count
% b = m/a;
% print -depsc gammaTest;
