function moveLeft(x,y,animal)
	if directionChange == 4 then return end 
	directionChange = directionChange + 1;

    if x==1 then leftx=maxx else leftx=x-1 end

    if animal=="O" then 
	    if world[y][leftx]==" " and bufferedWorld[y][leftx] ==" " then
	    	bufferedWorld[y][leftx]="O"
	    	bufferedWorld[y][x]=" "
	    else
	    	moveUp (x,y,animal)
	    end
   elseif animal=="X" then
	    if world[y][leftx]=="O" then
	    	bufferedWorld[y][leftx]="X"
	    	bufferedWorld[y][x]=" "
	    	world[y][leftx]=" "
		elseif world[y][leftx]==" " and bufferedWorld[y][leftx]==" " then
			bufferedWorld[y][leftx]="X"
			bufferedWorld[y][x]=" "
		elseif world[y][leftx]=="X" then
			moveUp (x,y,animal)
	    end
	end
end

function moveRight(x,y,animal)
	if directionChange == 4 then return end
	directionChange = directionChange + 1;

	if x==maxx then rightx=1 else rightx=x+1 end

	if animal=="O" then
	    if world[y][rightx]==" " and bufferedWorld[y][rightx]==" " then 
	    	bufferedWorld[y][rightx]="O"
	    	bufferedWorld[y][x]=" " 
	    else
	    	moveDown (x,y, animal)
	    end
    elseif animal=="X" then 
	    if world[y][rightx]=="O" then 
	    	bufferedWorld[y][rightx]="X" 
	    	bufferedWorld[y][x]=" "
	    	world[y][rightx]=" "
		elseif world[y][rightx]==" " and bufferedWorld[y][rightx]==" " then 
			bufferedWorld[y][rightx]="X" 
			bufferedWorld[y][x]=" "
		elseif world[y][rightx]=="X" then 
			moveDown (x,y,animal)
	    end
	end
end

function moveUp(x,y,animal)
	if directionChange == 4 then return end
	directionChange = directionChange + 1;

    if y==1 then upy=maxy else upy=y-1 end

	if animal=="O" then
	    if world[upy][x]==" " and bufferedWorld[upy][x]==" " then 
	    	bufferedWorld[upy][x]="O" 
	    	bufferedWorld[y][x]=" " 
	    else 
	    	moveRight (x,y,animal) 
	    end
    elseif animal=="X" then 
	    if world[upy][x]=="O" then
	    	bufferedWorld[upy][x]="X" 
	    	bufferedWorld[y][x]=" "
	    	world[upy][x]=" "
		elseif world[upy][x]==" " and bufferedWorld[upy][x]==" " then 
			bufferedWorld[upy][x]="X" 
			bufferedWorld[y][x]=" "
		elseif world[upy][x]=="X" then 
			moveRight (x,y,animal)
	    end
	end
end

function moveDown(x,y,animal)
	if directionChange == 4 then return end
	directionChange = directionChange + 1;

	if y==maxy then downy=1 else downy=y+1 end

	if animal=="O" then
	    if world[downy][x]==" " and bufferedWorld[downy][x]==" " then 
	    	bufferedWorld[downy][x]="O" 
	    	bufferedWorld[y][x]=" " 
	    else 
	    	moveLeft (x,y,animal) 
	    end
    elseif animal=="X" then
	    if world[downy][x]=="O" then 
	    	bufferedWorld[downy][x]="X" 
	    	bufferedWorld[y][x]=" "
	    	world[downy][x]=" "
		elseif world[downy][x]==" " and bufferedWorld[downy][x]==" " then 
			bufferedWorld[downy][x]="X" 
			bufferedWorld[y][x]=" "
		elseif world[downy][x]=="X" then 
			moveLeft (x,y,animal)
	    end
	end
end

function swim(x,y,animal)

	directionChange = 0

    direction=randomDirection()
    if direction=="left" then
        moveLeft(x,y,animal) end
	if direction=="right" then
		moveRight(x,y,animal) end
	if direction=="up" then
		moveUp(x,y,animal) end
	if direction=="down" then
		moveDown(x,y,animal) end
		
end

function manipulateWorld()
    copyWorldToBuffer()

    for y=1,maxy do
        for x=1, maxx do
            if world[y][x]=="O" then swim(x,y,"O") end
            if world[y][x]=="X" then swim(x,y,"X") end
        end
    end

    switchBuffer()
end
