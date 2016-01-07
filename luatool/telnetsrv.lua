--
-- setup a telnet server that hooks the sockets input
--
function telnetsrv()
    in_use = false
    function listenFun(sock)
        if in_use then
            sock:send("Already in use.\n")
            sock:close()
            return
        end
        in_use = true

        function s_output(str)
            if(sock ~=nil) then
                sock:send(str)
            end
        end

        node.output(s_output, 0)

        sock:on("receive", function(sock, input)
                node.input(input)
            end)

        sock:on("disconnection", function(sock)
                node.output(nil)
                in_use = false
            end)
    end

    telnetServer = net.createServer(net.TCP, 180)
    telnetServer:listen(23, listenFun)

    print('Telnet server started')
end

--telnetsrv()
