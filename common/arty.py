import arty_cm0
import iverilog
import xilinx
import argparse



def get_args():
    """
    Get command line arguments
    """

    parser = argparse.ArgumentParser(description="""
Put description of application here
                   """)
    parser.add_argument('--iverilog', action='store', dest='iverilog',
                        help='iverilog file list', default="")

    parser.add_argument('--vivado_sim', action='store', dest='vivado_sim',
                        help='Vivado simulator file list', default="")

    parser.add_argument('--vivado_synt', action='store', dest='vivado_synt',
                        help='Vivado synthesis file list (as tcl file)',
                        default="")

    parser.add_argument('--version', action='version', version='%(prog)s 0.1')

    return parser.parse_args()



args = get_args()

l, d = arty_cm0.arty_cm0()


if args.iverilog != "":
    print "-I- iverilog generation"""
    txt = iverilog.get_iverilog_file_list(l, d, arty_cm0.context)
    with open(args.iverilog,'w')  as f:
        f.write(txt)

if args.vivado_sim != "":
    print "-I- Vivado/Sim  generation"""
    txt = xilinx.get_xvlog_file_list(l, d, arty_cm0.context)
    with open(args.vivado_sim,'w')  as f:
        f.write(txt)

if args.vivado_synt != "":
    print "Vivado/Sim  generation"""
