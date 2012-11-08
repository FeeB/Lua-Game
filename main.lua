math.randomseed( os.time() )

maxx=40
maxy=20

dofile("lib.lua")
dofile("movement.lua")

-- main programm
createWorld()

-- game loop
for i=1,100 do
    os.execute("clear")
    printWorld(i)
    manipulateWorld()

    oldTime=os.time()
    repeat until (os.time()==oldTime+1)
end
