function [net,tr,Y,E] = newtrain(input,output)
net = newff(input',output',[8 3], {'logsig'})
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 0;
net.trainParam.goal = 0.1;
net.trainParam.lr = 0.02;
    net.trainParam.max_fail = 100;
[net,tr,Y,E] = train(net,input',output');
end