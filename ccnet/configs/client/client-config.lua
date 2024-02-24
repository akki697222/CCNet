local config = {}

--client configurations 00.000 <= 00: client type 000: client number
--01~15: for data handling computers.
--16~31: for debug computers.
--32~99: for normal client
config.CLIENT_CHANNEL = 00000
--shell configurations
config.SHELL_PING_TIMEOUT = 10


return config