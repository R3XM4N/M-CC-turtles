cHeight =0;
cLane =0;
t_turned = false
first = true
print("Enter parameters.")
print("Blocks left:")
desiredLeft = tonumber(read())
print("Blocks right:")
desiredRight = tonumber(read())
desiredWidth = desiredRight + 1 + desiredLeft
print("Blocks foward:")
desiredDepth = tonumber(read())
print("Height of room:")
desiredHeight = tonumber(read())

function Forward()
    while (turtle.detect() == true)
        do turtle.dig()
    end
    turtle.forward()
end

function move_forward(x)
    x=x
    while(x > 0) do  
        Forward()
        x = x -1
    end
end

function move_left()
    Left()
    Forward()
    Left() 
end

function move_right()
    Right()
    Forward()
    Right()
end

function Turn()
    if t_turned == true then
        move_right()
        t_turned = false;
    else
        move_left()
        t_turned = true;
    end
end

function Up()
    while (turtle.detectUp() == true)
        do turtle.digUp()
    end
    turtle.up()
end

function MinePlane()
    if first ==true then  
        while cLane ~= desiredDepth do
            move_forward(desiredWidth -1)
            cLane = cLane + 1
            if cLane ~= desiredDepth then
                Turn()
            end
        end 
        cLane = 0
        first = false
    else
        if t_turned ==false then  
            turtle.turnRight()
            turtle.turnRight()
            while cLane ~= desiredDepth do
                move_forward(desiredWidth -1)
                cLane = cLane + 1
                if cLane ~= desiredDepth then
                    Turn()
                end
            end 
            cLane = 0
        else
            turtle.turnRight()
            turtle.turnRight()
            while cLane ~= desiredDepth do
                move_forward(desiredWidth -1)
                cLane = cLane + 1
                if cLane ~= desiredDepth then
                    Turn()
                end
            end 
            cLane = 0
        end
    end 
end

function Left()
    turtle.turnLeft()
end

function Right()
    turtle.turnRight()
end

move_forward(desiredDepth)
turtle.turnRight()
move_forward(desiredRight)
turtle.turnRight()
turtle.turnRight()
cHeight = 0

while cHeight ~= desiredHeight do
    MinePlane()
    cHeight = cHeight + 1
    if  cHeight ~= desiredHeight then
        Up()
    end
end
while cHeight ~= 0 do
    turtle.down()
    cHeight = cHeight -1
end