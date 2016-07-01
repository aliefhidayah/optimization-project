function [v] = newmycauchyfit(x)
% Yunus T
v = 0.001;
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
figure(1),clf
n = numel(x);
for iter = 1:5000000
  count = count + 1;
  old_v = v
  sum1 = 0;
  xsquared = x * x;
  for i = 1:n
      sum1 = sum1 + (2*v*xsquared(i))/(1+v*v*xsquared(i));
  end
  sum2 = 0;
  for i = 1:n
      increment = (2*xsquared(i)-2*v*v*xsquared(i)*xsquared(i))./((1+v*v*xsquared(i))*(1+v*v*xsquared(i)));
      sum2 = sum2 + increment;
  end
  df = n/v - sum1;
  df2 = -n/(v*v)+ sum2;
  c2 = (-df2*(v+1)-df)*v;
  c1 = (df - (c2/v))*(v+1);
  v = -c2/(c1+c2);
  scatter(count, v, 'r')
  hold on
  if(abs(v - old_v) < 1e-16) break, end
end  
count
xlabel('Iteration Number (count)')
ylabel('Estimated Parameter (v)')
axis_pct;
hold off;
print -depsc myCauchy;
% xlabel('Iteration Number (count)')
% ylabel('Estimated Parameter (v)')
% axis_pct;
%legend('estimation', 'Location', 'northoutside')
% hold off
% print -depsc c;
%set(gcf,'paperpos',[0.25 2.5 5 4])
end
