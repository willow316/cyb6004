
       #!/usr/bin/python3 
      
import hashlib
import random
import itertools
import string
      
#hidden password hash 
      
passwordHash = "50e721e49c013f00c62cf59f2163542a9d8df02464efeb615d31051b0fddc326" 
 
#passwordHash = "z"

#open the wordlist 
      
def guess_password(real):
    chars = string.ascii_lowercase + string.digits
    attempts = 0
    for password_length in range(1, 9):
        for guess in itertools.product(chars, repeat=password_length):
            attempts += 1
            guess = ''.join(guess)
            guess = hashlib.sha256(guess.encode("utf-8")).hexdigest()
            if guess == real:
                return 'password hex is {}. found in {} guesses.'.format(guess, attempts)
            print(guess, attempts)

print(guess_password(passwordHash))