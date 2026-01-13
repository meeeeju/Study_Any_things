import sys
input = sys.stdin.readline

# Equilateral :  세 변의 길이가 모두 같은 경우
# Isosceles : 두 변의 길이만 같은 경우
# Scalene : 세 변의 길이가 모두 다른 경우

# '''
# 7 7 7
# 6 5 4
# 3 2 5
# 6 2 6
# 0 0 0
# '''

answer =[]



while True:

    triangle_list = list(map(int,input().split()))
    triangle_list.sort()
    if triangle_list[0]==0:
        break

    a,b,c = triangle_list
    if c >= (a + b) :
        answer.append("Invalid")
        continue
    elif a == b and b == c:
        answer.append("Equilateral")
        continue
    elif b==c or a==c or a==b:
        answer.append("Isosceles")
        continue
    else:
        answer.append("Scalene")

print("\n".join(answer))

    
