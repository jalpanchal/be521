%%
% <latex>
% \title{BE 521: Homework 2 Questions \\{\normalsize Modeling Neurons} \\{\normalsize Spring 2021}}
% \author{46 points}
% \date{Due: Tuesday, 2/9/2021 10:00 PM}
% \maketitle
% \textbf{Objective:} Computational modeling of neurons. \\
% We gratefully acknowledge Dr. Vijay Balasubramanian (UPenn) for many of
% the questions in this homework.\\
% </latex>

%% 
% <latex>
% \begin{center}
% \author{Jal Mahendra Panchal}
% \end{center}
% </latex>

%%
% <latex>
% \section{Basic Membrane and Equilibrium Potentials (6 pts)}
% Before undertaking this section, you may find it useful to read pg.
% 153-161 of Dayan \& Abbott's \textit{Theoretical Neuroscience} (the 
% relevant section of which, Chapter 5, is posted with the homework). 
% </latex>

%%
% <latex>
% \begin{enumerate}
%  \item Recall that the potential difference $V_T$ when a mole of ions crosses a cell membrane is defined by the universal gas constant $R = 8.31\; {\rm J/mol\cdot K}$, the temperature $T$ (in Kelvin), and Faraday's constant $F = 96,480 {\rm\ C/mol}$ \[ V_T = \frac{RT}{F} \] Calculate $V_T$ at human physiologic temperature ($37\; ^{\circ} \rm C$). (1 pt)
% </latex>

%%
% <latex>
% \rule{\textwidth}{1pt}
% \textit{Example Latex math commands that uses the align tag to make your equations
% neater. You can also input math into sentences with \$ symbol like $\pi + 1$.}
% \begin{align*}
% E = MC^2 \tag{not aligned}\\
% E = & MC^2 \tag{aligned at = by the \&}\\
% 1 = &\; \frac{2}{2}\tag{aligned at = by \&}
% \end{align*}
% \rule{\textwidth}{1pt}
% </latex>

%%
% <latex>
% \\ Answer: \\
% </latex>
%%
% Replacing the value of R = 8.134 J/ mol.K, F  = 96,480 C/mol and T = 310 K
% in the equation, we get : 
R = 8.314;
F = 96480;
T = 310;
V_t = R*T/F

%%
% <latex>
% The $V_T$ at human physiological temperatures is 0.0267 V or 26.7 mV.\\
% </latex>


%%
% <latex>
%  \item Use this value $V_T$ to calculate the Nernst equilibrium potentials 
%  (in mV) for the $\rm K^+$, $\rm Na^+$, and $\rm Cl^-$ ions, given the following 
%  cytoplasm and extracellular concentrations in the squid giant axon: 
%  $\rm K^+$ : (120, 4.5), $\rm Na^+$ : (15, 145), and $\rm Cl^-$ : (12, 120), 
%  where the first number is the cytoplasmic and the second the extracellular 
%  concentration (in mM). (2 pts)
% </latex>

%%
% <latex>
% \\ Answer: \\
% To calcualte the Nernst equilibrium potential, we can use the equation,
% \begin{align*}
% E = & \frac{V_T}{z} ln(\frac{[extracellular\ concentration]}{[cytoplasmic\ concentration]})
% \end{align*}
% </latex>

K_extcell_conc_mM =4.5;
K_cyto_conc_mM = 120;
K_z = 1;

Na_extcell_conc_mM =145;
Na_cyto_conc_mM = 15;
Na_z  = 1;

Cl_extcell_conc_mM =120;
Cl_cyto_conc_mM = 12;
Cl_z = -1;

% Nernst equilibrium potential for K in mV is
E_K_mV = V_t/K_z*log(K_extcell_conc_mM/K_cyto_conc_mM)

% Nernst equilibrium potential for Na in mV is 
E_Na_mV = V_t/Na_z*log(Na_extcell_conc_mM/Na_cyto_conc_mM)

% Nernst equilibrium potential for Cl in mV is 
E_Cl_mV = V_t/Cl_z*log(Cl_extcell_conc_mM/Cl_cyto_conc_mM)

%%
% <latex>
% The Nernst equilibrium potential for $K^+$ is -87.7 mV, for $Na^+$ is 60.6
% mV and for $Cl^-$ is -61.5 mV. \\
% </latex>



%%
% <latex>
%  \item 
%   \begin{enumerate}
% 	\item Use the Goldmann equation,
% 	  \begin{equation}
% 		V_m = V_T\ln\left( \frac{\rm P_{K}\cdot[K^+]_{out} + P_{NA}\cdot[Na^+]_{out} + P_{Cl}\cdot[Cl^-]_{in}}{\rm P_{K}\cdot[K^+]_{in} + P_{NA}\cdot[Na^+]_{in} + P_{Cl}\cdot[Cl^-]_{out}} \right)
% 	  \end{equation}
% 	to calculate the resting membrane potential, $V_m$, assuming that the ratio of membrane permeabilities $\rm P_K:P_{Na}:P_{Cl}$ is $1.0:0.045:0.45$. Use the ion concentrations given above in Question 1.2. (2 pts)
% </latex>

%%
% <latex>
% \\ Answer: \\
% </latex>

%%
%Using the given ratios of membrane permiabilities, we get
P_K = 1;
P_Na = 0.045;
P_Cl = 0.45;

V_m_rest = V_t*log(((P_K*K_extcell_conc_mM)+(P_Na*Na_extcell_conc_mM)+ (P_Cl*Cl_cyto_conc_mM))/((P_K*K_cyto_conc_mM)+(P_Na*Na_cyto_conc_mM)+(P_Cl*Cl_extcell_conc_mM)))

%%
% <latex>
% The resting membrane potential is $V_m$ = -63.2 mV.\\
% </latex>

%%
% <latex>
% 	\item Calculate the membrane potential at the peak action potential, assuming a permeability ratio of $1.0:11:0.45$, again using the ion concentrations given in Question 1.2. (1 pt)
%   \end{enumerate}
% </latex>

%%
% <latex>
% \\ Answer: \\
% </latex>

%%
%Using the membrane permiabilities  to find membrane potential at peak
%action potential

P_K = 1;
P_Na = 11;
P_Cl = 0.45;

V_m_actpot = V_t*log(((P_K*K_extcell_conc_mM)+(P_Na*Na_extcell_conc_mM)+(P_Cl*Cl_cyto_conc_mM))/((P_K*K_cyto_conc_mM)+(P_Na*Na_cyto_conc_mM)+(P_Cl*Cl_extcell_conc_mM)))

%%
% <latex>
% The membrane potential at peak action potential is $V_m$ = 41.5 mV.\\
% </latex>

%%
% <latex>
% 	\item The amplitudes of the multi-unit signals in HW0 and local field
% 	potentials (LFP) in HW1 had magnitudes on the order of 10 to 100
% 	microvolts. The voltage at the peak of the action potential (determined
% 	using the Goldman equation above) has a magnitude on the order of 10
% 	millivolts. Briefly explain why we see this difference in magnitude.
% 	Hint 1: Voltage is the difference in electric potential between two
% 	points. What are the two points for our voltage measurement in the
% 	multi-unit and LFP signals? What are the two points for the voltage
% 	measurement of the action potential? Hint 2: The resistance of the neuronal membrane is typically much higher than the resistance of the extracellular fluid. (2 pts)
% </latex>

%%
% <latex>
% \\ Answer: \\
% lorem epsum
% </latex>
%% 
% <latex>
% \end{enumerate}
% \section{Integrate and Fire Model (38 pts)}
% You may find it useful to read pg.\ 162-166 of Dayan and Abbott for this section. The general differential equation for the integrate and fire model is
% \[ \tau_m\frac{dV}{dt} = V_m - V(t) + R_m I_e(t) \]
% where $\tau_m = 10\, \rm ms$ is the membrane time constant, describing how fast the current is leaking through the membrane, $V_m$ in this case is constant and represents the resting membrane potential (which you have already calculated in question 1.3.a), and $V(t)$ is the actual membrane potential as a function of time. $R_m = 10^7\, \Omega$ is the constant total membrane resistance, and $I_e(t)$ is the fluctuating incoming current. Here, we do not explicitly model the action potentials (that's Hodgkin-Huxley) but instead model the neuron's behavior leading up and after the action potential.
% </latex>

%%
% <latex>
% Use a $\Delta t = 10\, \rm \mu s$ ($\Delta t$ is the discrete analog of the continuous $dt$). Remember, one strategy for modeling differential equations like this is to start with an initial condition (here, $V(0)=V_m$), then calculate the function change (here, $\Delta V$, the discrete analog to $dV$) and then add it to the function (here, $V(t)$) to get the next value at $t+\Delta t$. Once/if the membrane potential reaches a certain threshold ($V_{th} = -50\, \rm mV$), you will say that an action potential has occurred and reset the potential back to its resting value.
% \begin{enumerate}
%  \item Model the membrane potential with a constant current injection (i.e., $I_e(t) = I_e = 2 {\rm nA}$). Plot your membrane potential as a function of time to show at least a handful of ``firings.'' (8 pts)
% </latex>

%%
% <latex>
% \\ Answer: \\
% Subsituting the values provided, we can calculate membrane potential for
% given constant current injection.
% </latex>

%%
%Using paramters provided in the question
tau_m_s = 10*1e-3;
V_m_V = V_m_rest;
R_m_ohm = 1e7; 
I_e_A = 2*1e-9;
del_t_s = 10*1e-6 ;
V_m_t_V= [];
V_m_t_curr_V = V_m_V; %Initial V_m_t = V_m
V_m_thresh = -50*1e-3;

duration_us = 10000;

for i=0:duration_us
    
    V_m_t_V = [V_m_t_V, V_m_t_curr_V];
    del_V_V = del_t_s/tau_m_s*(V_m_V-V_m_t_curr_V+R_m_ohm*I_e_A);
    V_m_t_curr_V = V_m_t_curr_V+del_V_V;
    %Resetting the membrane potential when it crosses the threshold
    if V_m_t_curr_V > V_m_thresh
        V_m_t_curr_V = V_m_V;
    end 
    
end

%%
%Plotting the voltage
t_us = 0:duration_us;
t_ms = t_us/1e3;
V_m_t_mV = V_m_t_V*1e3;
plot(t_ms,V_m_t_mV, 'Linewidth', 1.5);
title('Membrane potential for I_e = 2nA')
xlabel('Time (ms)')
ylabel('Membrane Potential (mV)')
ylim([-65,-48])

%%
% <latex>
%  \item Produce a plot of firing rate (in Hz) versus injection current, over the range of 1-4 nA. (4 pts)
% </latex>

%%
% <latex>
%  \item \texttt{I521\_A0002\_D001} contains a dynamic current injection in nA. Plot the membrane potential of your neuron in response to this variable injection current. Use Matlab's \texttt{subplot} function to place the plot of the membrane potential above the injection current so that they both have the same time axis. (Hint: the sampling frequency of the current injection data is different from the sampling frequency ($\frac{1}{\Delta t}$) that we used above.) (4 pts)
% </latex>

%%
% <latex>
%  \item Real neurons have a refractory period after an action potential that prevents them from firing again right away. We can include this behavior in the model by adding a spike-rate adaptation conductance term, $g_{sra}(t)$ (modeled as a potassium conductance), to the model
%  \[ \tau_m\frac{dV}{dt} = V_m - V(t) - r_m g_{sra}(t)(V(t)-V_K)+ R_m I_e(t) \]
%  where \[ \tau_{sra}\frac{dg_{sra}(t)}{dt} = -g_{sra}(t), \]
%  Every time an action potential occurs, we increase $g_{sra}$ by a certain constant amount, $g_{sra} = g_{sra} + \Delta g_{sra}$. Use $r_m \Delta g_{sra} = 0.06$. Use a conductance time constant of $\tau_{sra} = 100\, \rm ms$, a potassium equilibrium potential of $V_K = -70\, \rm mV$, and $g_{sra}(0) = 0$. (Hint: How can you use the $r_m \Delta g_{sra}$ value to update voltage and conductance separately in your simulation?)
% </latex>

%%
% <latex>
%  \begin{enumerate}
%   \item Implement this addition to the model (using the same other parameters as in question 2.1) and plot the membrane potential over 200 ms. (8 pts)
% </latex>

%%
% <latex>
%   \item Plot the inter-spike interval (the time between the spikes) of all the spikes that occur in 500 ms. (2 pts)
% </latex>

%%
% <latex>
%   \item Explain how the spike-rate adaptation term we introduced above might be contributing to the behavior you observe in 2.4.b. (2 pts)
% </latex>

%%
% <latex>
%  \end{enumerate}
%  \item Pursue an extension of this basic integrate and fire model. A few ideas are: implement the Integrate-and-Fire-or-Burst Model of Smith et al.\ 2000 (included); implement the Hodgkin-Huxley model (see Dayan and Abbot, pg.\ 173); provide some sort of interesting model of a population of neurons; or perhaps model what an electrode sampling at 200 Hz would record from the signal you produce in question 2.3. Feel free to be creative. 
%  We reserve the right to give extra credit to particularly interesting extensions and will in general be more generous with points for more difficult extensions (like the first two ideas), though it is possible to get full credit for any well-done extension.
%   \begin{enumerate}
% 	\item Briefly describe what your extension is and how you will execute it in code. (6 pts)
% </latex>

%%
% <latex>
% 	\item Provide an interesting figure along with an explanation illustrating the extension. (4 pts)
% </latex>

%%
% <latex>
%   \end{enumerate}
% \end{enumerate}
% </latex>


