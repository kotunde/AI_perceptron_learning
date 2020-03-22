%x a bemenet (matrix, amibe soronkent a bemenetek vannak), d a kimenet (vektor)
function w = PerceptronLearning(x, d)
    w1 = [];
    w2 = [];
    e = [];
	% N x sora, n = x oszlopa, a  bemenetek szama
	[N, n] =size(x);
	% learning rate (mekkora lepesekkel haladunk)
	lr = 0.01;
	% sulyok
	w = randn(n,1);
	% error
	E = 1;
	while E ~= 0
		E = 0;
        %ei = 0;
		for i = 1:N
			% atviteli(aktivacios) fuggveny
			yi = hardlim((x(i,:) * w));
            
			% kiszamitjuk az i-dik iteracioban a hibat: elvart ertek - jelenlegi ertek
			ei = d(i)-yi;
            
			% updateljuk a sulyvektort
			w = w + lr * ei * x(i,:)';
            
            %updateljuk a hibat
			E = E + ei^2;
        end
        
        hold on
        grid on
        view(3)
        plot3(w(1),w(2),E,'*');
        drawnow
        pause(0.2)
        E
        w1 = [w1; w(1)];
        w2 = [w2; w(2)];
        e = [e; E];
         
    end
    
    grid on
    hold on
%     plot3(w1,w2,e,'*');
    
    x = w1; 
    y = w2; 
    z = e;

    dt = delaunayTriangulation(x,y) ;
    tri = dt.ConnectivityList ;

    xi = dt.Points(:,1) ;
    yi = dt.Points(:,2) ;

    F = scatteredInterpolant(x,y,z);

    zi = F(xi,yi) ;

    trisurf(tri,xi,yi,zi) 
    view(3)
    shading interp
    
end