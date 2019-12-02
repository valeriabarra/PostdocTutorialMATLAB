function [error,flag,iterates]=cobweb(g,c)

x = linspace(0,1,50); % define the domain
%evaluate the map the first time to draw the curve
y=g(c,x);
figure; % evry time we call this function we open a new figure

% for video saving
VideoObj = VideoWriter('cobweb_video.mp4', 'MPEG-4');
height = VideoObj.Height;
VideoObj.FrameRate = 3;
open(VideoObj);
set(gca,'nextplot','replacechildren'); 

plot(x,y,'b-'); % plot the logistic curve
hold on;
plot(x,x,'b-'); % plot the bisector line x=y to visualize the fixed point as the intersection of the two curves
box on; % it just looks prittier with a frame

xn=0.1; % starting point
tol=0.02; % define our tolerance for convergence

flag=0; % case of insuccess
for n = 1 :50
    y=g(c,xn); % find the new point
    plot([xn xn], [xn y], 'r.-'); % draw the first line
    hold on;
    plot([xn y], [y y], 'r.-'); % draw the second line
    xn = y; % update the new point with the evaluation of the map
    iterates(n)=y; % store the result of the map in a vector called iterates to compute the error
    drawnow; % drawnow serves not to wait until the end of the loop for the plot to be executed
    box on;
    xlabel('x');
    ylabel('y');
    titleString=['Cobweb graph for logistic map with c= ', num2str(c)];
    title(titleString);
    myFrame = getframe(gca);
    writeVideo(VideoObj, myFrame);
end

close(VideoObj);

% compute the error, from the third execution on (we need at least two iterates error formula)
if n>= 3     
    error=abs((iterates(3:end) - iterates(2:end-1)));
    if  min(abs(error))<=tol
        flag=1; % success of iterations
    end
end

end