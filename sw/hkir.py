#!/usr/bin/env python2

import argparse, serial

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Send Actions to the LED Controller Bootloader");

    p.add_argument('-u', '--vol-up', dest='vol_up', action='store_true', help='volume up');
    p.add_argument('-d', '--vol-down', dest='vol_dn', action='store_true', help='volume down');
    p.add_argument('-m', '--vol-mute', dest='vol_mt', action='store_true', help='volume mute');
    p.add_argument('-o', '--pwr-on', dest='pwr_on', action='store_true', help='power on');
    p.add_argument('-O', '--pwr-off', dest='pwr_off', action='store_true', help='power off');

    p.add_argument('-p', '--port', dest='port', action='store', default='/dev/ttyUSB0', help='serial port');

    args = p.parse_args();

    cmds = '';

    if args.vol_up:
        cmds += 'u';

    if args.vol_dn:
        cmds += 'd';

    if args.vol_mt:
        cmds += 'm';

    if args.pwr_on:
        cmds += 'o';

    if args.pwr_off:
        cmds += 'O';

    cxn = serial.Serial(args.port, 9600);
    cxn.write(cmds);
    cxn.flush();
    cxn.close();
