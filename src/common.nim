import math


################################################################################
type Address* = object of RootObj
    family*: int
    address*: string
    netmask*: string
    broadcast*: string
    ptp*: string

type User* = object
    name*: string
    terminal*: string
    host*: string
    started*: float

type CPUTimes* = object of RootObj
    user*: float
    nice*: float
    system*: float
    idle*: float
    iowait*: float
    irq*: float
    softirq*: float
    steal*: float
    guest*: float
    guest_nice*: float

type DiskUsage* = object of RootObj
    total*: int
    used*: int
    free*:int
    percent*: float

type DiskPartition* = object of RootObj
    device*: string
    mountpoint*: string
    fstype*: string
    opts*: string

type VirtualMemory* = object of RootObj
    total*: int
    avail*: int
    percent*: float
    used*: int
    free*: int
    active*: int
    inactive*: int
    buffers*: int
    cached*: int
    shared*: int

type SwapMemory* = object of RootObj
    total*: int
    used*: int
    free*: int
    percent*: float
    sin*: int
    sout*: int

type NetIO* = object of RootObj
    bytes_sent*: int
    bytes_recv*: int
    packets_sent*: int
    packets_recv*: int
    errin*: int
    errout*: int
    dropin*: int
    dropout*: int

################################################################################
proc usage_percent*[T](used: T, total: T, places=0): float =
    ## Calculate percentage usage of 'used' against 'total'.
    try:
        result = (used / total) * 100
    except DivByZeroError:
        result = if used is float or total is float: 0.0 else: 0
    if places != 0:
        return round(result, places)
    else:
        return result
