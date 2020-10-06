def task(file):
    f=open(file, 'r')
    n=0
    last = 0
    CheckSum = 1
    first = 0
    second = 0
    while True:
        x = int(f.readline())
        if CheckSum == 1:
            if (x*last) % 7 == 0 and (x*last)%  49 != 0 and (x*last) > CheckSum:
                CheckSum = x*last
                first = x
                second = last
                
            
        else:
            if (x*first) % 7 == 0 and (x*first) % 49 != 0 and (x*first) > CheckSum:       
                CheckSum = x*first
                second = x
            if x*second % 7 == 0 and x*second % 49 != 0 and x*second > CheckSum:
                CheckSum = x*second
                first = x
        last = x
        if x==0:
            break
    return CheckSum
print (task('task1.txt'))
print (task('27986_B.txt'))
