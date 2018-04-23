function percentage = checkAccuracy(resultArray)

targetArray = output_array();
checkArray = resultArray == targetArray';
checked = find(checkArray == 1);
count = length(checked);
percentage = count/90 * 100;
fprintf('Accuracy =  %i%', round(percentage));
fprintf(' percent');
fprintf('\n');

end