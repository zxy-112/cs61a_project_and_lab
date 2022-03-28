a = 1
b = 1

def func():
    nonlocal a
    a += 1
    return a
