clear all;
close all;
clc;


test = load('testhw3(1).txt');
train = load('trainhw3(1).txt');

test;
train;

%nearest neighbour algorithm is implemented by me

test(:,1);
F = pdist2(train(:,1:2),test(:,1:2),'euclidean')


[C,I] = min(F)

for i=1:200;
I(i);
test(i,4)=train(I(i),3);
end

count = 0;
str='%';

for i=1:200
    
    
if test(i,3) == test(i,4)

count = count + 1;

end
end

count



sprintf('The output accuracy of part a is %0.3f%s',(100*(count/200)),str)

train_new=[];
test_new=[];

train_new(:,1:2)=train(:,1:2);
test_new(:,1:2)=test(:,1:2);

train_new(:,3)=train(:,2)-train(:,1);
test_new(:,3)=test(:,2)-test(:,1);

W = pdist2(train_new(:,1:3),test_new(:,1:3),'euclidean');

[R,Q] = min(W);

for i=1:200;
Q(i);
test_new(i,4)=train(Q(i),3);
end

count1 = 0;
str='%';


for i=1:200
    
    
if test(i,3) == test_new(i,4);

count1 = count1 + 1;

end
end

count1;

sprintf('The output accuracy of part b is %0.3f%s',(100*(count1/200)),str)


Z = pdist2(train_new(:,3),test_new(:,3),'euclidean');

[G,L] = min(Z);


for i=1:200;
L(i);
test_new(i,5)=train(L(i),3);
end

count2 = 0;
str='%';


for i=1:200
    
    
if test(i,3) == test_new(i,5);

count2 = count2 + 1;

end
end

count2;

sprintf('The output accuracy of part c is %0.3f%s',(100*(count2/200)),str)

%KNN implementation

for i=1:200

[sortedValues,sortIndex] = sort(F(:,i),'ascend');  
                                                  
minindex(i,1:3) = sortIndex(1:3)  ;

end

for i=1:200;
for j=1:3;
mapindex(i,j)=train(minindex(i,j),3);
end
end



for i=1:200;

    mapindex(i,6)=mode(mapindex(i,1:3));

end


count = 0;
str='%';

for i=1:200
    
    
if mapindex(i,6) == test(i,3);

count = count + 1;

end
end

count;

sprintf('The output accuracy of part e is %0.3f%s',(100*(count/200)),str)

