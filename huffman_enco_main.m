clear ; close all ; clc;

% Taking symbols from the user
symbol=input('Enter the symbols in {''''} : ');

% Taking Probability from the user
prob=input('Enter the probability of symbols in [] :');

% pre-processing

for i=1:length(prob)    
   codewords{i}='';      
   symbol_{i} = i;    
end
 
prob=sort(prob,'descend');
prob_or=prob;

 % Coding    
 
    while ( prob ~= 1 )  % Loop, until we reach the root.

        % Sort the probabilities at every loop.

        [~,arr] = sort(prob);
       
        % Get the index of the two sets to be merged.

        last = arr(1);
        next = arr(2);
       
        % Get their main index .

        right_set = symbol_{last};
        left_set  = symbol_{next};
        
        % Get their probabilities.

        right_probability = prob(last); 
        left_probability  = prob(next); 
       
        % Append them in a new set.

        merged_set = [right_set, left_set]; 
        new_prob   = right_probability + left_probability;
        
        % Update probability and symbol sets

        symbol_(arr(1:2)) = '';
        prob(arr(1:2))   = '';
        symbol_=[symbol_,merged_set];
        prob=[prob,new_prob];     
       
        % Get the updated codeword.

        for i = 1:length(right_set)
            codewords{right_set(i)} = strcat('1',codewords{right_set(i)});      
        end

        for i = 1:length(left_set)
            codewords{left_set(i)} = strcat('0',codewords{left_set(i)});      
        end

        % Output{symbol,codewords}.
        code.symbol=symbol;
        code.probability=prob_or;
        code.code = codewords;
        
    end

% Displaying the code along with their probabilities
disp('-------------------------------------------------------------------------------');
disp(code);
disp('-------------------------------------------------------------------------------');