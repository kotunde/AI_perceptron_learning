%x a bemenet (matrix, amibe soronkent a bemenetek vannak), d a kimenet (vektor)
function w = PerceptronLearning2(x, d)
	% N x sora, n = x oszlopa, a  bemenetek szama
	[N, n] = size(x);
	% learning rate (mekkora lepesekkel haladunk)
	lr = 0.01;
	% sulyok
	w = randn(n,1);
	% error
	E = 1;
	while E > 10.0e-8
		E = 0;
        %ei = 0;
		for i = 1:N
			% atviteli(aktivacios) fuggveny
			yi = tanh(x(i,:) * w);
            
			% kiszamitjuk az i-dik iteracioban a hibat: elvart ertek - jelenlegi ertek
			ei = d(i)-yi;
            
			% updateljuk a sulyvektort
			w = w + lr * ei * x(i,:)';
            
            %updateljuk a hibat
			E = E + ei^2;
        end
        E
	end
end