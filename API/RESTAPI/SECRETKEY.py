import string
import secrets
def SECRETKEY(length):
    characters = string.ascii_letters
    security_key = ''.join(secrets.choice(characters) for _ in range(length))
    return(security_key)
