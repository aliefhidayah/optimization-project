function [c] = mygammafit(x)
% Yunus
if nargin == 1
  m = mean(x);
  s = log(m) - mean(log(x));
else
  % suff stats given
  m = x;
end
n = numel(x);
k=0;
for iter = 1:n
    k = k+ 1/x(iter);
end
k;
q= n/k;
c = 1;
count =0;
% slow version
if 1
  for iter = 1:10
     count = count + 1;
     old_c = c;
 g=n/(2*c) - sum(k)/2;
 c2= (n*c*c)/(2*c*c);
  c = -(n/2)/(g - c2/c)
  scatter(count, c, 'r')
  hold on;
    if(abs(c - old_c) < 1e-8) break, end
  end
end
count
% for iter = 1:10
%   count = count + 1;
%   g=n/(2*c) - sum(k)/2;
%   old_c = c;
%   c = c + (2*g*c*c)/n;
%   scatter(count, c, 'r')
%   hold on
%   if(abs(c - old_c) < 1e-8) break, end
% end  '
hline = refline([0 q]);
set(hline,'LineStyle','-', 'Color', 'b')
xlabel('Iteration Number (count)')
ylabel('Estimated Parameter (a)')
axis_pct;
%legend('estimation', 'value of myGamfit', 'Location', 'northoutside')
hold off
%set(gcf,'paperpos',[0.25 2.5 5 4])
print -depsc levyTest;
