N = 8 -- 棋盘大小
-- 检查（n,c）是否会被攻击
function isplaceok(a,n,c)
    for i = 1,n-1 do 
        if  (a[i] == c) or              -- 列相同
            (c - a[i] == n - i) or      -- 列差等于行差，右下对角线
            (a[i] - c == n - i) then    -- 列差等于行差，左下对角线
            return false
        end
    end
    return true
end

function printsolution(a)
    io.write("===============\n")
    for i = 1,N do 
        for j = 1,N do
            io.write(a[i] == j and 'X' or '-',' ')
        end
        io.write("\n")
    end
    io.write("\n")
end

-- 把第n-N的所有皇后放到棋盘上，递归
function addqueen(a,n)
    if n > N then -- 所有皇后安排好了，打印
        printsolution(a)
    else -- 尝试安排第n个皇后，从第一列开始尝试
        for c = 1,N do
            if isplaceok(a,n,c) then
                a[n] = c
                addqueen(a,n+1)
            end
        end
    end
end

-- 运行
addqueen({},1)
