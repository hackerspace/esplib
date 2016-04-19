sntp.sync('78.108.145.1', -- 0.pool.ntp.org
  function(sec,usec,server)
    print('sync', sec, usec, server)
  end,
  function()
   print('failed!')
  end
)
