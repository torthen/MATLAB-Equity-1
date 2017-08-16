
%%% Mixed Lorenz Curves Fitting Function, with a fixed %%%
%Directly derived from problem "finding best a"

function y = find_epsilon_mixed(Equity)

% Matlab function. Finds epsilon by fitting the Mixed Lorenz curve with parameter 
% a = 0.6 to given data points and minimizing the mean square error. 


x=Equity.share_pop'; 
%CREATEFIT1(X,Y)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 17-Aug-2016 01:30:25


%% Fit: 'untitled fit 1'. % preparing the variables for the fit function
y=Equity.cumulated_dist_vector';

[xData, yData] = prepareCurveData( x, y );

a=0.6;

% Set up fittype and options.
ft = fittype( [' ' num2str(a) '*(1-(1-x)^epsilon )+(1- ' num2str(a) ' )*x^(1/ epsilon )'], 'independent', 'x', 'dependent', 'y' ); % we can define more than 1 number of optimization parameter
opts = fitoptions( 'Method', 'NonlinearLeastSquares');
opts.Display = 'Off';
opts.StartPoint = 0.3;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts ); 
error = gof.rmse;
y = fitresult;
% fitresult is an object including optimized parameters (here is the "epsilon"), 
%gof is a structure, including statistics regarding the goodness of the fit


