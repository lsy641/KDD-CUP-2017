%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data_Y= load('Ato2_Y.txt');
data_X = load('Ato2_X.txt');
X = data_X;
y = data_Y;
m = length(y);

iter=1;
while iter<=m
    if y(iter) > 700
        y(iter)=[];
        X(iter,:)=[];
        m=m-1;
    else
        iter=iter+1;
    end
end
m = length(y);
temp = X(:,2:6)-X(:,1:5);
X = [X X(:,1:6).*X(:,1) X(:,2:6).*X(:,2) X(:,3:6).*X(:,3) X(:,4:6).*X(:,4) X(:,5:6).*X(:,5) X(:,6:6).*X(:,6) temp temp(:,2:5)-temp(:,1:4)];
fprintf(' %f,  \n', size(X,2));
% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f], y = %f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(38, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
temp1 = [58.08 46.36 48.59 66.64 64.68]-[54.84 58.08 46.36 48.59 66.64];
X_test = [54.84 58.08 46.36 48.59 66.64 64.68 0 3007.4256 3185.1072 2542.3824 2664.6756 3654.5376 3547.0512 3373.2864 2692.5888 2822.1072 3870.4512 3756.6144 2149.2496 2252.6324 3089.4304 2998.5648 2360.9881 3238.0376 3142.8012 4440.8896 4310.2752 4183.5024 temp1 temp1(:,2:5)-temp1(:,1:4)];
[X_test mu sigma] = featureNormalize(X_test);
price = [ones(1,1) X_test]*theta; % You should change this

data_Y= load('Ato2_Y.txt');
data_X = load('Ato2_X.txt');
X = data_X;
y = data_Y;
temp = X(:,2:6)-X(:,1:5);
X = [X X(:,1:6).*X(:,1) X(:,2:6).*X(:,2) X(:,3:6).*X(:,3) X(:,4:6).*X(:,4) X(:,5:6).*X(:,5) X(:,6:6).*X(:,6) temp temp(:,2:5)-temp(:,1:4)];
[X mu sigma] = featureNormalize(X);
X_predict = [ones(length(X),1) X]*theta;
iter=1;
fprintf('counting..%f %f \n' ,length(y));
m=length(y);
while iter<=m
%     fprintf('cool.! \n %f  %f',y(iter) ,abs(y(iter)-0));
    if abs(y(iter)-0)<=0.01
%         fprintf('yesnow.! \n   %f',y(iter));
        y(iter)=[];
        X_predict(iter)=[];
        m=m-1;
    else
        iter=iter+1;
    end
end
fprintf('counting.. \n' );
fprintf('counting..%f %f \n' ,length(X_predict),i);
sub = (y-X_predict);
sub = sub./y;
fprintf('wonderful.! \n' );
loss = sum(abs(sub))/length(y);
fprintf('loss is : %f  \n' ,loss);
% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);
fprintf('Program paused. Press enter to continue.\n');
pause;



