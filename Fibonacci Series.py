def fibonacci(n):
    a = 0
    b = 1

    if n < 0:
        print("Incorrect number")
    elif n == 0:
        return a
    elif n == 1:
        return b
    else:
        for i in range(2, n):
            c = a + b
            a = b
            b = c
            print(c)


fibonacci(15)