function createWorld()
    world={}
    for y=1,maxy do
        row={}
        for x=1,maxx do
            randomnumber=math.random()
            if (randomnumber<0.2) then
                if (randomnumber<0.1) then 
                	row[x]="X"
                else 
                	row[x]="O"
                end
            else 
            	row[x]=" " 
            end
        end
        world[y]=row
    end
end

function printWorld(i)

    for y=1,maxy do
        for x=1,maxx do
            io.write(world[y][x])
        end
        io.write("\n")
    end
    print("Iteration: "..i)
end

function copyWorldToBuffer()
    bufferedWorld={}
    for y=1,maxy do
        row={}
        for x=1,maxx do
            row[x]=world[y][x]
        end
        bufferedWorld[y]=row
    end
end

function switchBuffer()
    for y=1,maxy do
        for x=1,maxx do
            world[y][x]=bufferedWorld[y][x]
        end
    end
end

function randomDirection()
    randomnumber=math.random()

    if randomnumber<1 then direction="left" end
    if randomnumber<0.75 then direction="right" end
    if randomnumber<0.50 then direction="up" end
    if randomnumber<0.25 then direction="down" end

    return direction
end