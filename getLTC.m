function LTC=getLTC(Matrix)

[m,n]=size(Matrix);

thres=abs(mean(Matrix(:))-median(Matrix(:)));
      
central=Matrix(2:m-1,2:n-1);
left_upper=Matrix(1:m-2,1:n-2);
upper=Matrix(1:m-2,2:n-1);
right_upper=Matrix(1:m-2,3:n);
right=Matrix(2:m-1,3:n);
right_lower=Matrix(3:m,3:n);
lower=Matrix(3:m,2:n-1);
left_lower=Matrix(3:m,1:n-2);
left=Matrix(2:m-1,1:n-2);
    
% positive
left_upper_po=((left_upper-central)>thres);
upper_po=((upper-central)>thres);
right_upper_po=((right_upper-central)>thres);
right_po=((right-central)>thres);
right_lower_po=((right_lower-central)>thres);
lower_po=((lower-central)>thres);
left_lower_po=((left_lower-central)>thres);
left_po=((left-central)>thres);
    
Positive=left_upper_po+upper_po+right_upper_po+right_po+right_lower_po+lower_po+left_lower_po+left_po;
    
% negative
left_upper_ne=((left_upper-central)<-thres);
upper_ne=((upper-central)<-thres);
right_upper_ne=((right_upper-central)<-thres);
right_ne=((right-central)<-thres);
right_lower_ne=((right_lower-central)<-thres);
lower_ne=((lower-central)<-thres);
left_lower_ne=((left_lower-central)<-thres);
left_ne=((left-central)<-thres);
    
Negative=left_upper_ne+upper_ne+right_upper_ne+right_ne+right_lower_ne+lower_ne+left_lower_ne+left_ne;
      
Pos_his=histcounts(Positive,9)/((m-2)*(n-2));   % normalized LTC histogram
Neg_his=histcounts(Negative,9)/((m-2)*(n-2));

LTC=[Pos_his,Neg_his];
