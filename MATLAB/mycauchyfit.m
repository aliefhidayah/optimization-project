function [b] = mycauchyfit(x, a)
% Yunus T
b_initial = 1.2486;
% slow version my
% ----- 
% UPDATE THIS
% if 0
%   for iter = 1:1000
%     old_a = a;
%     a = inv_digamma(log(a) - s);
%     if(abs(a - old_a) < 1e-8) break, end
%   end
% end
count = 0;
% gen Newton
figure(1),clf
m = b_initial;
b = b_initial;

totalSum = 0;

for iter = 1:100
  count = count + 1;
  old_b = b;
  totalSum = totalSum + b;
  xi_minus_a = x - a;
  xi_minus_a_sq = xi_minus_a.*xi_minus_a;
  g = (1+xi_minus_a_sq*b);
  n=numel(x);
  df = n/b-sum(xi_minus_a_sq./g);
  df2 = n/(b*b)+sum((xi_minus_a_sq.*xi_minus_a_sq)./(g.*g));
  b = (b*b*(df+df2*(b+1)))/(df*(b+1)+b*(df2*(b+1)+df));
  scatter(count, b, 'r')
  hold on
  if(abs(b - b_initial) < 1e-3) break, end
end  
count
hline = refline([0 m(1)]);
set(hline,'LineStyle','-', 'Color', 'b')
xlabel('Iteration Number (count)')
ylabel('Estimated Parameter (a)')
axis_pct;
legend('estimation', 'value of gamfit', 'Location', 'northoutside')
hold off
%set(gcf,'paperpos',[0.25 2.5 5 4])
