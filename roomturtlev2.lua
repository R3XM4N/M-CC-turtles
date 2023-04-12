--boot
print("Enter parameters.")
print("Blocks forward:")
r_x = tonumber(read())
print("Width of room:")
r_y = tonumber(read())
print("Height of room:")
r_z = tonumber(read())
t_turned =false;
r_x = r_x - 1
--basic stuff
function Forward()
    while (turtle.detect() == true)
        do turtle.dig()
    end
    turtle.forward()
end

function Up()
    while (turtle.detectUp() == true)
        do turtle.digUp()
    end
    turtle.up()
end

function Left()
    turtle.turnLeft()
end

function Right()
    turtle.turnRight()
end

function TurnAround()
    turtle.turnLeft()
    turtle.turnLeft()
end

--advanced stuff
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

function Return()
    if t_turned == true then
        Left()
        move_forward(r_y-1)
        Left()
        t_turned = false
    else
        Right()
        move_forward(r_y-1)
        Right()
        move_forward(r_x)
        TurnAround()
    end

end
--the stuff that runs
Forward()
z = r_z
while (z > 0) do
    z = z-1
    y = r_y
    while (y > 0) do
        y = y-1
        move_forward(r_x)
        if (y > 0) then
            Turn()
        end
    end
    Return()
    if  (z > 0) then
        Up()
    end
end