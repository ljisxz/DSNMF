 function   [V, objective]=DSNMF(X,Options)
 

      options = [];
      options.Metric = 'Euclidean';
      options.NeighborMode = 'KNN';
      options.k = Options.k;
      options.WeightMode ='Binary'; % 'HeatKernel';
     % options.t =1;%  sqrt(sigma/2);%0.7;%
      W = constructW( X,options);
                  
      N=size(W,1);
      Y=zeros(N, Options.KClass);
      %m=length(Options.XSmpgnd);
      for i=1:Options.gndSmpNum
          Y(i, Options.Smpgnd(i))=1;
      end

    % D=diag(sum(W1,2));
     V = rand(N, Options.KClass);
      objective=[];
        V_L=zeros(N, Options.KClass);
      for iters = 1: Options.maxIter
        V_L(1:Options.gndSmpNum,:)=V(1:Options.gndSmpNum,:);
       V=V.*(W*V+Options.alpha*Y)./(V*V'*V+Options.alpha*V_L+eps);
       objective(iters)=sum(sum((W- V*V').^2)) + Options.alpha*sum(sum((Y -V_L).^2));
      end
 end
       
    