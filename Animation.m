%% Visualization/Animation
%Skript erst nach einem Simulationsdurchlauf starten!
t_step=1/30
t = out.simouty.time(1):t_step:out.simouty.time(end);
%interpolation
interpx = interp1(out.simoutx.time,out.simoutx.signals.values,t)
interpy = interp1(out.simouty.time,out.simouty.signals.values,t)

b_pilot=150
h_pilot=150

figure
xlim([0,11000])
ylim([0,11000])
axis manual


hold on
test=imread('pilot.jpg'); 
im=image(flipud(test),'XData',[interpx(1)-50 interpx(1)+50],'YData',[interpy(1)+50 interpy(1)-50])
hold on
test2=imread('jet.jpg'); 
jety=interpy(1)
jetx=t*out.simoutvjet.signals.values(1)
im2=image(flipud(test2),'XData',[-100 +100],'YData',[jety+100 jety-100])



for k=2:length(t)
   
    im.XData=[interpx(k)+80 interpx(k)-80]
    im.YData=[interpy(k)-100 interpy(k)+100]
    im2.XData=[jetx(k)-100 jetx(k)+100]
    im2.YData=[jety-100 jety+100]
    
    pause(t_step)
end


    