clear; close all; clc; 
%%
% Open the access to the folder with the data to load

addpath('/home/liza/Documents/Technion/Advanced_Analysis_26/Advanced_analysis_2026/1st_lesson');
%%
% Load data as a table (column names and values)

filename = "penguins.csv";
penguins = readtable(filename); % analog of pandas dataframe in python
%%
% Fast data summary

summary(penguins);
%%
% Statistics for the column vector to the structure

stats = datastats(penguins.body_mass_g) 
%%
% Preprocessing the variable types

penguins.species = categorical(penguins.species);
penguins.island = categorical(penguins.island);
penguins.sex = categorical(penguins.sex);
%%
% Cleaning from the missing values

penguins1 = rmmissing(penguins);
%%
summary(penguins1)
%%
% The whole sample histogram for the bill length

histogram(penguins1.bill_length_mm,"DisplayStyle","bar");

xlabel("Bill Length, mm")
ylabel("Frequency")
%%
% Slicing the data

gentoo = penguins1(penguins1.species == "Gentoo",:); 
chinstrap = penguins1(penguins1.species == "Chinstrap",:);
adelie = penguins1(penguins1.species == "Adelie",:);
%%
% Different species histogram

h(1) = histogram(gentoo.flipper_length_mm, "FaceAlpha",0.5, SeriesIndex=1);
hold on
h(2) = histogram(chinstrap.flipper_length_mm, "FaceAlpha",0.5, SeriesIndex=2);
h(3) = histogram(adelie.flipper_length_mm, "FaceAlpha",0.5, SeriesIndex=4);
hold off 
xlabel("Flipper length (mm)")
ylabel("Frequency")
legend(h,"Gentoo", "Chinstrap", "Adelie")
%%
% BOXPLOT

figure;
boxchart(penguins1.species, penguins1.flipper_length_mm)
ylabel("Flipper Length (mm)")
%%
% MIN & MAX on the histogram

histogram(penguins1.flipper_length_mm)
xlabel("Flipper Length (mm)")
ylabel("Frequency")
title("Distribution of penguin flipper lengths")

min_flip = min(penguins1.flipper_length_mm)
xline(min_flip, "LineWidth",5)

max_flip = max(penguins1.flipper_length_mm)
xline(max_flip, "LineWidth",5)
%%
% Mean, Meadian, Mode

histogram(penguins1.flipper_length_mm, "EdgeColor","none") % you can remove the edges by utilzing the "EdgeColor" option
xlabel("Flipper Length (mm)")
ylabel("Frequency")
title("Distribution of penguin flipper lengths")

mean_flip = mean(penguins1.flipper_length_mm)
xline(mean_flip, "--")

median_flip = median(penguins1.flipper_length_mm)
xline(median_flip, ":", "LineWidth",1.5)

mode_flip = mode(penguins1.flipper_length_mm)
xline(mode_flip, "-.", 'LineWidth',2)
legend ("flip length", "mean", "median", "mode")
%%
% Hypothesis testing

male = penguins1(penguins1.sex == "MALE",:);
female = penguins1(penguins1.sex == "FEMALE",:);
%%
class(penguins1.body_mass_g)
%%
% Look on the hypothesis in boxplot

boxchart(penguins1.sex, penguins1.body_mass_g) % plot body mass, broken up by sex 
xlabel("Sex")
ylabel("Body Mass (g)")
%%
[h, p] = ttest2(male.body_mass_g, female.body_mass_g)
%%
[h, p] = ttest2(male.bill_length_mm, female.bill_length_mm, "Tail", "right")


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":32.1}
%---
