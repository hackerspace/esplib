-- Create UART <-> TCP bridge
uartbridge = net.createServer(net.TCP, 180)
uartbridge:listen(1337, function(socket)
    local fifo = {}
    local fifo_drained = true
    local function sender(c)
        if #fifo > 0 then
            c:send(table.remove(fifo, 1))
        else
            fifo_drained = true
        end
    end
    local function s_output(str)
        table.insert(fifo, str)
        if socket ~= nil and fifo_drained then
            fifo_drained = false
            sender(socket)
        end
    end
    uart.on("data", s_output, 0)
    socket:on("receive", function(c, l)
        uart.write(0, l)
    end)
    socket:on("disconnection", function(c)
        uart.on("data")
    end)
    socket:on("sent", sender)
end)

--uartbridge()
