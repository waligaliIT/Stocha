% script for question 1.2.6
clear all;

% different sizes with the correct number of states
precision_s1_4 = Q1_2_6_fct(30, 4);
precision_s2_4 = Q1_2_6_fct(100, 4);
precision_s3_4 = Q1_2_6_fct(200, 4);
precision_s4_4 = Q1_2_6_fct(500, 4);

% different sizes with a greater number of states
precision_s1_6 = Q1_2_6_fct(30, 6);
% precision_s2_6 = Q1_2_6_fct(100, 6); computed below
precision_s3_6 = Q1_2_6_fct(200, 6);
precision_s4_6 = Q1_2_6_fct(500, 6);

% same size with 1 to 6 states
precision_s2_1 = Q1_2_6_fct(100, 1);
precision_s2_2 = Q1_2_6_fct(100, 2);
precision_s2_3 = Q1_2_6_fct(100, 3);
precision_s2_5 = Q1_2_6_fct(100, 5);
precision_s2_6 = Q1_2_6_fct(100, 6);
