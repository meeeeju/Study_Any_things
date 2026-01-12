import sys
input = sys.stdin.readline

'''
input
5 4 1 1 (H, W, N, M)

output 
6 (인원수)
'''

h,w,n,m = map(int,input().split())

n += 1
m += 1

h_cnt = 0
w_cnt = 0

i=1
while i <=h:
    i +=n
    h_cnt +=1
i=1

while i <=w:
    i +=m
    w_cnt +=1


print(h_cnt*w_cnt)


