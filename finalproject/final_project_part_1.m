%% Final project part 1
% Prepared by John Bernabei and Brittany Scheid

% One of the oldest paradigms of BCI research is motor planning: predicting
% the movement of a limb using recordings from an ensemble of cells involved
% in motor control (usually in primary motor cortex, often called M1).

% This final project involves predicting finger flexion using intracranial EEG (ECoG) in three human
% subjects. The data and problem framing come from the 4th BCI Competition. For the details of the
% problem, experimental protocol, data, and evaluation, please see the original 4th BCI Competition
% documentation (included as separate document). The remainder of the current document discusses
% other aspects of the project relevant to BE521.


%% Start the necessary ieeg.org sessions (0 points)

%fetching data from the ieee server
addpath(genpath('/Users/jalpanchal/git/be521'));

username = 'jalpanchal';
passPath = 'jal_ieeglogin.bin';

% Load training ecog from each of three patients
s1_train_ecog_session = IEEGSession('I521_Sub1_Training_ecog', username, passPath);
s2_train_ecog_session = IEEGSession('I521_Sub2_Training_ecog', username, passPath);
s3_train_ecog_session = IEEGSession('I521_Sub3_Training_ecog', username, passPath);


% Load training dataglove finger flexion values for each of three patients
s1_train_dg_session = IEEGSession('I521_Sub1_Training_dg', username, passPath);
s2_train_dg_session = IEEGSession('I521_Sub2_Training_dg', username, passPath);
s3_train_dg_session = IEEGSession('I521_Sub3_Training_dg', username, passPath);

%%
%load data from mat file
load('final_proj_part1_data.mat')
%This data has 61 ch for s1,46 ch for s2 and 64 ch for s3
%training set contain 75% of 300s data
%ecog data
s1_train_ecog_cleaned = train_ecog{1}(1:225000,:)';
s2_train_ecog_cleaned = train_ecog{2}(1:225000,:)';
s3_train_ecog_cleaned = train_ecog{3}(1:225000,:)';
%finger data
s1_train_dg = train_dg{1}(1:225000,:)';
s2_train_dg = train_dg{2}(1:225000,:)';
s3_train_dg = train_dg{3}(1:225000,:)';

%test set containing last 25% of 300 data
%ecog data
s1_test_ecog_cleaned = train_ecog{1}(225001:300000,:)';
s2_test_ecog_cleaned = train_ecog{2}(225001:300000,:)';
s3_test_ecog_cleaned = train_ecog{3}(225001:300000,:)';
%finger dta
s1_test_dg = train_dg{1}(225001:300000,:)';
s2_test_dg = train_dg{2}(225001:300000,:)';
s3_test_dg = train_dg{3}(225001:300000,:)';

%%
% $\textbf{Answer 1.1} \\$
% The number of samples in the ECoG recording for each of the 3 subjects is
% 300,000. This consists of 300s of data sampled at 1000 Hz. Yes, it is the
% same for all three subjects.

%%
% $\textbf{Answer 1.1} \\$
% I used a bandpass filter, wth a passband between 0.15 and 200 Hz.


%%

%%
%testing filter
% fs = 1000;                    % Sampling frequency (samples per second)
% dt = 1/fs;                   % seconds per sample
% StopTime = 0.25;             % seconds
% t = (0:dt:StopTime-dt)';     % seconds
% F = 60;                      % Sine wave frequency (hertz)
% data = sin(2*pi*F*t);
% 
% F2  = 300
% data2 = sin(2*pi*F2*t);
% 
% x= data + data2;
% subplot(2,1,1)
% plot(x);
% 
% 
% y = filter_data(x)
% subplot(2,1,2)
% plot(y)



%% Extract dataglove and ECoG data 
% Dataglove should be (samples x 5) array 
% ECoG should be (samples x channels) array

% Split data into a train and test set (use at least 50% for training)

%% Get Features
% run getWindowedFeats_release function

%% Create R matrix
% run create_R_matrix

%% Train classifiers (8 points)


% Classifier 1: Get angle predictions using optimal linear decoding. That is, 
% calculate the linear filter (i.e. the weights matrix) as defined by 
% Equation 1 for all 5 finger angles.


% Try at least 1 other type of machine learning algorithm, you may choose
% to loop through the fingers and train a separate classifier for angles 
% corresponding to each finger



% Try a form of either feature or prediction post-processing to try and
% improve underlying data or predictions.



%% Correlate data to get test accuracy and make figures (2 point)

% Calculate accuracy by correlating predicted and actual angles for each
% finger separately. Hint: You will want to use zohinterp to ensure both 
% vectors are the same length.
